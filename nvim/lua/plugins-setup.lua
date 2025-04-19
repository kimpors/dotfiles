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

-- leaders
vim.g.mapleader = " "
vim.g.maplocalleader = ";"

-- disable netrw
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
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = false
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

opt.textwidth = 60

-- split windows
opt.splitright = true
opt.splitbelow = true

-- for neorg
opt.conceallevel = 3

-- AUTOCMD
local api = vim.api
local width = api.nvim_win_get_width(0)

api.nvim_create_autocmd("FileType", {
	pattern = { "norg", "term", "oil", "gitcommit", "diff", "checkhealth" },
  	callback = function ()
		vim.cmd("setlocal nonumber")
		vim.cmd("setlocal norelativenumber")
	end
})

--KEYMAPS
local keymap = vim.keymap

keymap.set("n", "<leader>t", function ()
    vim.cmd("split term://bash")
    vim.cmd("setf term")
    vim.cmd("startinsert")
end)

-- general keymaps
keymap.set("n", "x", '"_x')
keymap.set("v", "y", '"+y')

-- open notes
keymap.set("n", "<leader>n", "<cmd>Neorg index<cr>")

-- open file browser
keymap.set("n", "<leader>o", "<cmd>Oil<cr>")

-- close editor
keymap.set("n", "Q", ":conf qa<cr>")

-- terminal
local command = string.format("<cmd>ToggleTerm size=%d direction=vertical name=suicide<cr>", width / 2)
keymap.set("n", "<leader>t", command)
keymap.set("t", "<ESC>", "<C-\\><C-n>")
keymap.set("t", "q", "<cmd>exit<cr>")

-- gitsign 
keymap.set("n", "<leader>gd", "<cmd>Gitsigns diffthis<cr>")
keymap.set("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>")

-- latex
keymap.set("n", "<leader>m", "<cmd>lua require('nabla').popup({ border = 'rounded' })<cr>")
