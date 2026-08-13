require("config.pack").add("catppuccin/nvim")

require("catppuccin").setup({
	flavour = "mocha",
	lsp_styles = {
		underlines = {
			errors = { "undercurl" },
			warnings = { "undercurl" },
		},
	},
	integrations = {
		noice = true,
	},
})
vim.cmd.colorscheme("catppuccin")
