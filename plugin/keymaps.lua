vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.set("n", "]q", "<cmd>cnext<CR>", { desc = "Go to next item in the quickfix list" })
vim.keymap.set("n", "[q", "<cmd>cprev<CR>", { desc = "Go to previous item in the quickfix list" })

vim.keymap.set("n", "<M-,>", "<c-w>5<", { desc = "Move split to the left by 5 columns" })
vim.keymap.set("n", "<M-.>", "<c-w>5>", { desc = "Move split to the right by 5 columns" })
vim.keymap.set("n", "<M-t>", "<C-W>+", { desc = "Move split up by 1 row" })
vim.keymap.set("n", "<M-s>", "<C-W>-", { desc = "Move split down by 1 row" })

vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Delete into void register when pasting" })
vim.keymap.set({ "n", "x" }, "<leader>d", '"_d', { desc = "Delete into void register" })
vim.keymap.set({ "n", "x" }, "<leader>y", '"+y', { desc = "Yank into system clipboard" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Vertical scroll and center on <C-d>" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Vertical scroll and center on <C-u>" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Find and center on [n]" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Find and center on [N]" })
vim.keymap.set("n", "J", "mzJ`z", { desc = "Keep cursor in same place when [J]oining lines" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move a line up in visual mode" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move a line down in visual mode" })
vim.keymap.set("v", "<", "<gv", { desc = "Stay in visual mode after indenting" })
vim.keymap.set("v", ">", ">gv", { desc = "Stay in visual mode after indenting" })

vim.keymap.set("n", "<leader>bd", "<cmd>bd!<CR>", { desc = "Close the current buffer" })
vim.keymap.set("n", "<leader>bc", "<cmd>enew<CR>", { desc = "Create a new buffer" })

vim.keymap.set("n", "<leader>m", "<cmd>make build<CR>", { desc = "Quickly make run from Makefile" })
vim.keymap.set("n", "<leader>M", "<cmd>make run<CR>", { desc = "Quickly make build from Makefile" })

vim.keymap.set("n", "<leader>lw", "<cmd>set wrap!<CR>", { desc = "Toggle line wrapping" })
vim.keymap.set("n", "<leader>ln", "<cmd>set relativenumber!<CR>", { desc = "Toggle relative line numbering" })
vim.keymap.set("n", "<leader>w", "<cmd>noautocmd w<CR>")
