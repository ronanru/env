require("config.pack").add("nvim-treesitter/nvim-treesitter", {
	version = "main",
})

local treesitter = require("nvim-treesitter")
local parsers = {
	"bash",
	"c",
	"diff",
	"html",
	"lua",
	"luadoc",
	"markdown",
	"markdown_inline",
	"query",
	"regex",
	"vim",
	"vimdoc",
}

treesitter.install(parsers)

local function attach(buf, language)
	if not vim.treesitter.language.add(language) then
		return
	end

	vim.treesitter.start(buf, language)
	if vim.treesitter.query.get(language, "indents") then
		vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end
end

local available_parsers = treesitter.get_available()

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("treesitter-start", { clear = true }),
	callback = function(event)
		local language = vim.treesitter.language.get_lang(event.match)
		if not language then
			return
		end

		if vim.tbl_contains(treesitter.get_installed("parsers"), language) then
			attach(event.buf, language)
		elseif vim.tbl_contains(available_parsers, language) then
			treesitter.install(language):await(function()
				attach(event.buf, language)
			end)
		else
			attach(event.buf, language)
		end
	end,
})
