local M = {}

local function run_build(name, cmd, cwd)
	local result = vim.system(cmd, { cwd = cwd }):wait()
	if result.code == 0 then
		return
	end

	local output = result.stderr ~= "" and result.stderr or result.stdout
	if not output or output == "" then
		output = "No output from build command."
	end
	vim.notify(("Build failed for %s:\n%s"):format(name, output), vim.log.levels.ERROR)
end

vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(event)
		local name = event.data.spec.name
		local kind = event.data.kind
		if kind ~= "install" and kind ~= "update" then
			return
		end

		if name == "nvim-treesitter" then
			if not event.data.active then
				vim.cmd.packadd("nvim-treesitter")
			end
			vim.cmd("TSUpdate")
		end
	end,
})

function M.add(repo, spec)
	spec = vim.tbl_extend("force", spec or {}, { src = "https://github.com/" .. repo })
	vim.pack.add({ spec })
end

vim.api.nvim_create_user_command("PackUpdate", function()
	vim.pack.update()
end, { desc = "Update plugins managed by vim.pack" })

return M
