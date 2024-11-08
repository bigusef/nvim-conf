-- set the leaders keys
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- enable line numbers
vim.wo.number = true
vim.o.relativenumber = true

-- enable copy from vim to system clipbord
vim.o.clipboard = "unnamedplus"

-- enhance color's showing in the Termnail
vim.o.termguicolors = true

-- windows split
vim.o.splitright = true
vim.o.splitbelow = true

-- enable case insensitive UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- indentation options
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
