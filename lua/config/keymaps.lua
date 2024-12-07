-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "jh", "<esc>")
vim.keymap.set("n", ";w", "<cmd>:w<cr>")
vim.keymap.set("n", ";q", "<cmd>:q<cr>")
