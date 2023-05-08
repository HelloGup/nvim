-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- n, v, i, t = mode names

-- 移至行首行尾
vim.keymap.set("n", "H", "^", { silent = true })
vim.keymap.set("n", "L", "$", { silent = true })

-- 快速移动
vim.keymap.set("n", "J", "5j", { silent = true })
vim.keymap.set("n", "K", "5k", { silent = true })

-- 删或复制至行首
vim.keymap.set("n", "yH", "y0", { silent = true })
vim.keymap.set("n", "dH", "d0", { silent = true })

-- 删除全文行尾空格
vim.keymap.set("n", "ds", ":%s#\\s\\+$##g<CR>", { desc = "Delete space", silent = true })

-- 插入模式导航
vim.keymap.set("i", "<C-e>", "<End>", { silent = true })
vim.keymap.set("i", "<C-h>", "<Left>", { silent = true })
vim.keymap.set("i", "<C-l>", "<Right>", { silent = true })
vim.keymap.set("i", "<C-j>", "<Down>", { silent = true })
vim.keymap.set("i", "<C-k>", "<Up>", { silent = true })

-- 插入模式粘贴
vim.keymap.set("i", "<C-p>", "<ESC>pli", { silent = true })
