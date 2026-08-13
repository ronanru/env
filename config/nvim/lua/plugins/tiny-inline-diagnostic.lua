require("config.pack").add("rachartier/tiny-inline-diagnostic.nvim")

require("tiny-inline-diagnostic").setup({
	preset = "minimal",
	options = {
		multilines = {
			enabled = true,
			always_show = true,
		},
	},
})
