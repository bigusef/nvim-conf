-- set the leaders keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- enable line numbers
vim.wo.number = true
vim.o.relativenumber = true

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

-- enhance color's showing in the Termnail
vim.o.termguicolors = true

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- windows split
vim.o.splitright = true
vim.o.splitbelow = true

-- enable case insensitive UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Sets how display certain whitespace characters in the editor.
--  See `:help 'list'` and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- indentation options
-- vim.o.shiftwidth = 4
vim.o.tabstop = 4
-- vim.o.softtabstop = 4
-- vim.o.expandtab = true
