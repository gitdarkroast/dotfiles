local opt = vim.opt

vim.g.mapleader = " "
vim.g.maplocalleader = ","

opt.backspace = "indent,eol,start"
opt.showcmd = true
opt.laststatus = 3
opt.autowrite = true
opt.autoread = true

-- use spaces for tabs and whatnot
opt.tabstop = 2
opt.shiftwidth = 2
opt.shiftround = true
opt.expandtab = true

opt.swapfile = false
opt.termguicolors = true

-- Line numbers
opt.relativenumber = true
opt.number = true

-- line wrapping
opt.wrap = false -- disable line wrapping

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
opt.cursorline = true

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"
