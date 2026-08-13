require("config.pack").add("mfussenegger/nvim-lint")

local lint = require("lint")

lint.linters.oxlint.cmd = function()
	local buffer_path = vim.api.nvim_buf_get_name(0)
	local start_path = buffer_path ~= "" and vim.fs.dirname(buffer_path) or vim.uv.cwd()

	for _, node_modules in
		ipairs(vim.fs.find("node_modules", {
			path = start_path,
			upward = true,
			type = "directory",
			limit = math.huge,
		}))
	do
		local command = node_modules .. "/.bin/oxlint"
		if vim.fn.executable(command) == 1 then
			return command
		end
	end

	return "oxlint"
end

lint.linters_by_ft = {
	javascript = { "oxlint" },
	javascriptreact = { "oxlint" },
	typescript = { "oxlint" },
	typescriptreact = { "oxlint" },
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
	callback = function()
		lint.try_lint()
	end,
})
