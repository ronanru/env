require("config.pack").add("folke/noice.nvim")

require("noice").setup({
	presets = {
		inc_rename = true,
	},
	cmdline = {
		view = "cmdline_popup",
	},
	views = {
		cmdline_popup = {
			position = {
				row = "10%",
				col = "50%",
			},
		},
	},
})
