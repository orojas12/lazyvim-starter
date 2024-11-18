-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },

  { import = "lazyvim.plugins.extras.lang.json" },

  {
    "neovim/nvim-lspconfig",
    opts = {
      vtsls = {
        settings = {
          typescript = {
            inlayHints = {},
          },
        },
      },
    },
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      {
        "<leader>fe",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = LazyVim.root(), position = "float" })
        end,
      },
      { "\\", "<leader>fe", remap = true },
    },
  },
}
