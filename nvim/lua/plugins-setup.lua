local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

-- for nerd tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- disable providers
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0

--OPTIONS
local opt = vim.opt

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- lie wrapping
opt.wrap = true

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- apperance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- split windows
opt.splitright = true
opt.splitbelow = true


--KEYMAPS
local keymap = vim.keymap

-- general keymaps
keymap.set("n", "x", '"_x')
keymap.set("v", "y", '"+y')

keymap.set("n", "H", "0")
keymap.set("n", "L", "$")

-- close editor
keymap.set("n", "<C-d>", ":conf q<CR>")

keymap.set("n", "<leader>z", "<cmd>lua require('plan').Dialog()<cr>")

-- terminal
keymap.set("t", "<ESC>", "<C-\\><C-n>")
