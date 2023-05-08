
local opt = vim.opt

-- 光标到达行首或行尾时,使用h\l可转到上一行或下一行的行尾或行首
-- opt.whichwrap:append "<>[]hl"

--持久性撤销文件保存目录，目录自动创建
opt.undodir = vim.fn.expand "~/.cache/nvim/undo"

