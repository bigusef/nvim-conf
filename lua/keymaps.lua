-- For conciseness
local opts = { noremap = true, silent = true }

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- file saving
vim.keymap.set("n", "<C-s>", "<cmd> w <CR>", opts) -- save file
vim.keymap.set("n", "<leader>sn", "<cmd>noautocmd w <CR>", opts) -- without auto-formatting
vim.keymap.set("n", "<C-q>", "<cmd> q <CR>", opts) -- quit file

-- delete single character without copying into register
vim.keymap.set("n", "x", '"_x', opts)

-- Keep last yanked when pasting
vim.keymap.set("v", "p", '"_dP', opts)

-- Navigate between splits
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", opts)
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", opts)
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", opts)
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", opts)

-- Stay in visual mode when indent
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)
