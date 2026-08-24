local plugins = {
	"gitsigns",
	"which-key",
	"snacks",
	"inc-rename",
	"nui",
	"noice",
	"catppuccin",
	"tiny-inline-diagnostic",
	"mini",
	"fidget",
	"nvim-lspconfig",
	"conform",
	"nvim-lint",
	"blink",
	"supermaven",
	"treesitter",
	"undotree",
	"grug-far",
}

for _, plugin in ipairs(plugins) do
	require("plugins." .. plugin)
end
