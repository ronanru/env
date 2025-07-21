return {
  {
    -- remove clock
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.sections.lualine_z = {}
    end,
  },

  -- Catppuccin
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  -- Disable inlay hints
  {
    "nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
    },
  },
  -- Disable tabs
  {
    "bufferline.nvim",
    enabled = false,
  },
  {
    "persistence.nvim",
    enabled = false,
  },
  {
    "todo-comments.nvim",
    enabled = false,
  },
  {
    "tokyonight.nvim",
    enabled = false,
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = { section_separators = "", component_separators = "" },
    },
  },
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        enabled = false,
      },
      explorer = {
        replace_netrw = true,
      },
      picker = {
        sources = {
          explorer = {
            auto_close = true,
            layout = "vertical",
          },
        },
      },
    },
  },
  -- Disable snippets
  {
    "rafamadriz/friendly-snippets",
    enabled = false,
  },
  -- Undo tree
  "mbbill/undotree",
  {
    "dmmulroy/tsc.nvim",
    lazy = true,
    cmd = {
      "TSC",
    },
    opts = {
      use_trouble_qflist = true,
    },
  },
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        preset = "super-tab",
        ["<Tab>"] = {
          require("blink.cmp.keymap.presets").get("super-tab")["<Tab>"][1],
          require("lazyvim.util.cmp").map({ "snippet_forward", "ai_accept" }),
          "fallback",
        },
      },
    },
  },
  {
    "snacks.nvim",
    opts = {
      scroll = { enabled = false },
      zen = { enabled = false },
      animate = { enabled = false },
      terminal = { enabled = false },
    },
  },
}

