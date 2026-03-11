vim.o.number = true
vim.o.relativenumber = true

vim.o.mouse = "a"

vim.o.linebreak = true
vim.o.breakindent = true
vim.o.undofile = true
vim.o.swapfile = false
vim.o.backup = false

vim.o.hlsearch = false
vim.o.incsearch = true

vim.o.inccommand = "split"
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.termguicolors = true
vim.o.signcolumn = "yes"

vim.o.updatetime = 250
vim.o.timeoutlen = 300

vim.o.splitright = true
vim.o.splitbelow = true

vim.o.scrolloff = 8
vim.o.sidescrolloff = 8

vim.o.wrap = false
vim.o.foldmethod = "manual"
vim.opt.formatoptions:remove "o"

vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

vim.o.confirm = true

if vim.fn.executable "rg" == 1 then
  vim.o.grepprg = "rg --vimgrep --no-heading --no-line-number --smart-case --color=never --hidden -g '!node_modules'"
  vim.o.grepformat = "%f:%l:%c:%m,%f:%l:%m,%f"
end
