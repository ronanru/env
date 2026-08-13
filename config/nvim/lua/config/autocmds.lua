local highlight_group = vim.api.nvim_create_augroup("highlight-yank", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight yanked text",
	group = highlight_group,
	callback = function()
		vim.hl.on_yank()
	end,
})
