-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Editor essentials (Ctrl)
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>", { desc = "Save file" })
vim.keymap.set("n", "<C-q>", "<cmd>q<CR>", { desc = "Quit file" })

-- Window navigation (Ctrl)
vim.keymap.set("n", "<C-h>", "<cmd>wincmd h<CR>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-j>", "<cmd>wincmd j<CR>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-l>", "<cmd>wincmd l<CR>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-k>", "<cmd>wincmd k<CR>", { desc = "Move focus to the upper window" })

-- Buffer navigation ([/] convention)
vim.keymap.set("n", "[b", "<cmd>bprev<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "]b", "<cmd>bnext<CR>", { desc = "Next buffer" })

-- Buffer management (Leader + b namespace)
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "[B]uffer [D]elete" })

-- Diagnostic navigation ([/] convention)
vim.keymap.set("n", "[d", function()
	vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "Previous diagnostic" })
vim.keymap.set("n", "]d", function()
	vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Next diagnostic" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Vim motion overrides
vim.keymap.set("n", "x", '"_x', { desc = "Delete char without yank" })
vim.keymap.set("v", "p", '"_dP', { desc = "Paste without yank" })
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and stay in visual" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and stay in visual" })
