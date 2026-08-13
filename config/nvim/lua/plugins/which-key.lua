require("config.pack").add("folke/which-key.nvim")

require("which-key").setup({
	delay = 500,
	icons = { mappings = vim.g.have_nerd_font },
	win = {
		row = math.huge,
		col = math.huge,
	},
	spec = {
		{ "<leader>s", group = "[S]earch", mode = { "n", "v" } },
		{ "<leader>t", group = "[T]oggle" },
		{ "<leader>h", group = "Git [H]unk", mode = { "n", "v" } },
		{ "<leader>c", group = "[C]ode" },
		{ "gr", group = "LSP Actions", mode = "n" },
	},
})
