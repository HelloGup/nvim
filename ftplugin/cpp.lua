vim.opt_local.expandtab = true
vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4
vim.opt_local.softtabstop = 4

-- 一键编译运行
vim.keymap.set(
  "n",
  "<leader>ma",
  ":split<CR>:te make && ./%:t:r<CR>i",
  { desc="make",silent = true, noremap = true }
)

vim.keymap.set(
  "n",
  "<leader>mc",
  ":split<CR>:te make clean<CR>i",
  {desc="make clean", silent = true, noremap = true }
)

-- 生成同名可执行文件运行
vim.keymap.set(
  "n",
  "<leader>mr",
  ":split<CR>:te g++ -std=c++11 -o ./%:t:r % -g && ./%:t:r<CR>i",
  { desc="g++ run",silent = true, noremap = true }
)
