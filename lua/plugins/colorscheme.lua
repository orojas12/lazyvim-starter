return {

  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      style = "night",
    },
  },

  {
    "ficcdaf/ashen.nvim",
    lazy = true,
    priority = 1000,
    -- configuration is optional!
    opts = {
      -- your settings here
    },
  },

  {
    "sainnhe/gruvbox-material",
    lazy = true,
    config = function()
      vim.g.gruvbox_material_background = "medium"
      vim.g.gruvbox_material_foreground = "material"
    end,
  },

  {
    "Mofiqul/vscode.nvim",
    lazy = true,
  },

  {
    "comfysage/evergarden",
    lazy = true,
    opts = {
      variant = "medium",
    },
  },

  {
    "zaldih/themery.nvim",
    lazy = false,
    config = function()
      require("themery").setup({
        themes = {
          {
            name = "gruvbox dark",
            colorscheme = "gruvbox-material",
            before = [[
              vim.opt.background = "dark"
            ]],
          },
          {
            name = "gruvbox light",
            colorscheme = "gruvbox-material",
            before = [[
              vim.opt.background = "light"
            ]],
          },
          {
            name = "tokyonight",
            colorscheme = "tokyonight",
            before = [[
              vim.opt.background = "dark"
            ]],
          },
          {
            name = "ashen",
            colorscheme = "ashen",
          },
          {
            name = "vscode dark",
            colorscheme = "vscode",
            before = [[
              vim.opt.background = "dark"
            ]],
          },
          {
            name = "vscode light",
            colorscheme = "vscode",
            before = [[
              vim.opt.background = "light"
            ]],
          },
          {
            name = "evergarden",
            colorscheme = "evergarden",
            before = [[
              vim.opt.background = "dark"
            ]],
          },
        },
        livePreview = true,
      })
    end,
  },

  -- {
  --   "LazyVim/LazyVim",
  --   opts = {
  --     colorscheme = "gruvbox-material",
  --   },
  -- },

  -- :TransparentEnable or :TransparentDisable
  {
    "xiyaowong/transparent.nvim",
  },
}
