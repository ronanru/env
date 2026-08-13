require("config.pack").add("folke/snacks.nvim")

require("snacks").setup({
	bigfile = { enabled = true },
	input = { enabled = true },
	explorer = { enabled = true },
	picker = {
		enabled = true,
		sources = {
			explorer = {
				layout = { preset = "vertical", preview = false },
				jump = { close = true },
			},
		},
	},
})

Snacks.words.enable()
