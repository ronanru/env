require("config.pack").add("nvim-mini/mini.nvim")

if vim.g.have_nerd_font then
	require("mini.icons").setup()
	MiniIcons.mock_nvim_web_devicons()
end

require("mini.ai").setup({
	mappings = {
		around_next = "aa",
		inside_next = "ii",
	},
	n_lines = 500,
})

require("mini.surround").setup()

local statusline = require("mini.statusline")
statusline.setup({ use_icons = vim.g.have_nerd_font })

statusline.section_location = function()
	return "%2l:%-2v"
end
