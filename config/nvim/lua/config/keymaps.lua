local map = vim.keymap.set

map("n", "<Esc>", "<cmd>nohlsearch<CR>")
map({ "n", "i", "v" }, "<C-s>", "<cmd>write<CR>", { desc = "Save file" })
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
map("n", "<leader>cd", function()
	vim.diagnostic.open_float({ scope = "line" })
end, { desc = "[C]ode [D]iagnostics (float)" })
map("n", "<leader>cr", function()
	return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true, desc = "[C]ode [R]ename" })
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
map("n", "|", "<cmd>vsplit<CR>", { desc = "Open vertical split" })
map("n", "_", "<cmd>split<CR>", { desc = "Open horizontal split" })
map("n", "<leader>uw", function()
	vim.wo.wrap = not vim.wo.wrap
end, { desc = "Toggle line wrap" })

map("n", "<leader>sh", Snacks.picker.help, { desc = "[S]earch [H]elp" })
map("n", "<leader>sk", Snacks.picker.keymaps, { desc = "[S]earch [K]eymaps" })
map("n", "<leader>sf", Snacks.picker.files, { desc = "[S]earch [F]iles" })
map("n", "<leader>ss", Snacks.picker.pickers, { desc = "[S]earch [S]elect Picker" })
map({ "n", "v" }, "<leader>sw", Snacks.picker.grep_word, { desc = "[S]earch current [W]ord" })
map("n", "<leader>sg", Snacks.picker.grep, { desc = "[S]earch by [G]rep" })
map("n", "<leader>sd", Snacks.picker.diagnostics, { desc = "[S]earch [D]iagnostics" })
map("n", "<leader>sr", Snacks.picker.resume, { desc = "[S]earch [R]esume" })
map("n", "<leader>s.", Snacks.picker.recent, { desc = '[S]earch Recent Files ("." for repeat)' })
map("n", "<leader>sc", Snacks.picker.commands, { desc = "[S]earch [C]ommands" })
map("n", "<leader><leader>", Snacks.picker.files, { desc = "Search Files" })
map("n", "<leader>e", function()
	Snacks.explorer()
end, { desc = "File [E]xplorer" })
map("n", "<leader>/", Snacks.picker.grep, { desc = "[/] Grep in all files" })
map("n", "<leader>s/", Snacks.picker.grep_buffers, { desc = "[S]earch [/] in Open Files" })
map("n", "<leader>sn", function()
	Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
end, { desc = "[S]earch [N]eovim files" })

map({ "n", "v" }, "<leader>f", function()
	require("conform").format({ async = true })
end, { desc = "[F]ormat buffer" })

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp-keymaps", { clear = true }),
	callback = function(event)
		local function lsp_map(keys, func, desc, mode)
			map(mode or "n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end

		lsp_map("<leader>cl", Snacks.picker.lsp_config, "Lsp Info")
		lsp_map("gd", Snacks.picker.lsp_definitions, "Goto Definition")
		lsp_map("gr", Snacks.picker.lsp_references, "References")
		lsp_map("gI", Snacks.picker.lsp_implementations, "Goto Implementation")
		lsp_map("gy", Snacks.picker.lsp_type_definitions, "Goto T[y]pe Definition")
		lsp_map("gD", vim.lsp.buf.declaration, "Goto Declaration")
		lsp_map("K", vim.lsp.buf.hover, "Hover")
		lsp_map("gK", vim.lsp.buf.signature_help, "Signature Help")
		lsp_map("<C-k>", vim.lsp.buf.signature_help, "Signature Help", "i")
		lsp_map("<leader>ca", vim.lsp.buf.code_action, "Code Action", { "n", "x" })
		lsp_map("<leader>cc", vim.lsp.codelens.run, "Run Codelens", { "n", "x" })
		lsp_map("<leader>cC", vim.lsp.codelens.refresh, "Refresh & Display Codelens")
		lsp_map("<leader>cR", Snacks.rename.rename_file, "Rename File")
		lsp_map("<leader>cr", vim.lsp.buf.rename, "Rename")
		lsp_map("<leader>cA", function()
			vim.lsp.buf.code_action({
				apply = true,
				context = { only = { "source" }, diagnostics = {} },
			})
		end, "Source Action")
		lsp_map("]]", function()
			Snacks.words.jump(vim.v.count1)
		end, "Next Reference")
		lsp_map("[[", function()
			Snacks.words.jump(-vim.v.count1)
		end, "Prev Reference")
		lsp_map("<A-n>", function()
			Snacks.words.jump(vim.v.count1, true)
		end, "Next Reference")
		lsp_map("<A-p>", function()
			Snacks.words.jump(-vim.v.count1, true)
		end, "Prev Reference")
		lsp_map("<leader>co", function()
			vim.lsp.buf.code_action({
				apply = true,
				context = { only = { "source.organizeImports" }, diagnostics = {} },
			})
		end, "Organize Imports")
		lsp_map("<leader>ss", Snacks.picker.lsp_symbols, "LSP Symbols")
		lsp_map("<leader>sS", Snacks.picker.lsp_workspace_symbols, "LSP Workspace Symbols")
		lsp_map("gai", Snacks.picker.lsp_incoming_calls, "C[a]lls Incoming")
		lsp_map("gao", Snacks.picker.lsp_outgoing_calls, "C[a]lls Outgoing")

		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client and client:supports_method("textDocument/inlayHint", event.buf) then
			lsp_map("<leader>th", function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
			end, "[T]oggle Inlay [H]ints")
		end
	end,
})
