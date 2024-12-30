-- My custom options

-- Show relative line numbers
vim.opt.relativenumber = true
vim.opt.number = true

-- Tabs & indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true

vim.opt.wrap = true

-- Set space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Some system config: let it use the mouse, clipboard, and undo history
vim.g.have_nerd_font = true
vim.opt.swapfile = false
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"

vim.opt.undofile = true
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.showmode = false

vim.opt.splitright = true
vim.opt.splitbelow = true

-- Ignore upper and lowercase when searching, and highlight the search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = "split"
vim.opt.hlsearch = true

-- Some visual changes
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 10
vim.opt.cursorline = true

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight yanked text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
