-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {

  -- disable bufferline plugin
  { "akinsho/bufferline.nvim", enabled = false },

  -- set colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },

  -- disable inlay hints
  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      keys[#keys + 1] = { "<a-n>", false }
    end,
    opts = {
      inlay_hints = { enabled = false },
    },
  },

  -- neotree keymaps
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

  {
    "folke/snacks.nvim",
    keys = {
      { "<leader>snn", ":lua Snacks.notifier.show_history()<cr>", { desc = "Show notifier history" } },
    },
  },

  {
    "cbochs/grapple.nvim",
    dependencies = {
      {
        "nvim-tree/nvim-web-devicons",
        lazy = true,
      },
    },
    keys = function()
      local keyList = { "h", "j", "k", "l", "n", "m", ",", "." }
      local keys = {}

      for i = 1, 8 do
        table.insert(keys, {
          "<leader>t" .. keyList[i],
          function()
            require("grapple").toggle({ name = keyList[i] })
          end,
        })
        table.insert(keys, {
          "<C-" .. keyList[i] .. ">",
          function()
            require("grapple").select({ name = keyList[i] })
          end,
          desc = "Select buffer " .. keyList[i],
        })
      end

      return keys
    end,
  },

  {
    "sphamba/smear-cursor.nvim",
    opts = {},
  },
}
