-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- file saving
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>", { desc = "Save file" })

-- quit file
vim.keymap.set("n", "<C-q>", "<cmd>q<CR>", { desc = "Quit file" })

-- Keybinds to make split navigation easier.
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", { desc = "Move focus to the upper window" })

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- delete single character without copying into register
vim.keymap.set("n", "x", '"_x')

-- Keep last yanked when pasting
vim.keymap.set("v", "p", '"_dP')

-- Stay in visual mode when indent
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("n", "<A-f>", "<leader>sf")
