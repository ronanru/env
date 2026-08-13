require("config.pack").add("neovim/nvim-lspconfig")

local servers = {
	tsgo = {
		cmd = function(dispatchers, config)
			local cmd = "tsc"
			if config.root_dir then
				local local_cmd = vim.fs.joinpath(config.root_dir, "node_modules/.bin/tsc")
				if vim.fn.executable(local_cmd) == 1 then
					cmd = local_cmd
				end
			end
			return vim.lsp.rpc.start({ cmd, "--lsp", "--stdio" }, dispatchers)
		end,
	},
	tailwindcss = {},
	typos_lsp = {},
	lua_ls = {
		on_init = function(client)
			client.server_capabilities.documentFormattingProvider = false

			if client.workspace_folders then
				local path = client.workspace_folders[1].name
				if
					path ~= vim.fn.stdpath("config")
					and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
				then
					return
				end
			end

			client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
				runtime = {
					version = "LuaJIT",
					path = { "lua/?.lua", "lua/?/init.lua" },
				},
				workspace = {
					checkThirdParty = false,
					library = vim.tbl_extend("force", vim.api.nvim_get_runtime_file("", true), {
						"${3rd}/luv/library",
						"${3rd}/busted/library",
					}),
				},
			})
		end,
		settings = {
			Lua = {
				format = { enable = false },
			},
		},
	},
}

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp-highlight", { clear = true }),
	callback = function(event)
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if not client or not client:supports_method("textDocument/documentHighlight", event.buf) then
			return
		end

		local group = vim.api.nvim_create_augroup("lsp-highlight-buffer", { clear = false })
		vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
			buffer = event.buf,
			group = group,
			callback = vim.lsp.buf.document_highlight,
		})
		vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
			buffer = event.buf,
			group = group,
			callback = vim.lsp.buf.clear_references,
		})
		vim.api.nvim_create_autocmd("LspDetach", {
			buffer = event.buf,
			once = true,
			callback = function(detach_event)
				vim.lsp.buf.clear_references()
				vim.api.nvim_clear_autocmds({ group = group, buffer = detach_event.buf })
			end,
		})
	end,
})

for name, server in pairs(servers) do
	vim.lsp.config(name, server)
	vim.lsp.enable(name)
end
