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

  -- harpoon keymaps
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    keys = function()
      local harpoonKeyList = { "h", "j", "k", "l", "n", "m", ",", "." }
      local keys = {
        {
          "<leader>H",
          function()
            local harpoon = require("harpoon")
            harpoon.ui:toggle_quick_menu(harpoon:list())
          end,
          desc = "Harpoon Quick Menu",
        },
      }

      for i = 1, 8 do
        table.insert(keys, {
          "<leader>h" .. harpoonKeyList[i],
          function()
            require("harpoon"):list():replace_at(i)
          end,
          desc = "Harpoon File to " .. harpoonKeyList[i],
        })

        table.insert(keys, {
          "<A-" .. harpoonKeyList[i] .. ">",
          function()
            require("harpoon"):list():select(i)
          end,
          desc = "Harpoon to File " .. harpoonKeyList[i],
        })
      end

      return keys
    end,
  },
}
