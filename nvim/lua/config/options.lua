--Basic vim settings

local opt = vim.opt

opt.number = true  --line number
opt.cursorline = true --adds background to your line
opt.relativenumber = true --jump numbers
opt.shiftwidth = 4 --making tab smaller

vim.o.showtabline = 2 --for bar

vim.cmd("let g:netrw_liststyle = 3") --tree style netrw

opt.clipboard = "unnamedplus" --copy paste
