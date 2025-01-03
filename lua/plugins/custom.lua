-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {

  -- disable bufferline plugin
  { "akinsho/bufferline.nvim", enabled = false },

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

  {
    "ibhagwan/fzf-lua",
    keys = {
      { "<leader><leader>", LazyVim.pick("files", { root = false }), desc = "Find Files (cwd)" },
      { "<leader>sg", LazyVim.pick("live_grep", { root = false }), desc = "Grep (cwd)" },
      { "<leader>sG", false },
    },
  },

  {
    "folke/snacks.nvim",
    opts = {
      lazygit = { enabled = true },
      notifier = {
        timeout = 10000,
      },
    },
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
            require("grapple").tag({ name = keyList[i] })
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

  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    -- dependencies = { { "echasnovski/mini.icons", opts = {} } },
    keys = {
      { "<leader>o", "<CMD>Oil --float<CR>", { desc = "Open parent directory in Oil" } },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
  },

  {
    "tpope/vim-fugitive",
  },
}
