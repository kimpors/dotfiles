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

-- for neorg
opt.conceallevel = 3

-- AUTOCMD
local api = vim.api

api.nvim_create_autocmd("FileType", {
  pattern = { "norg", "oil", "gitcommit", "diff" },
  callback = function ()
    vim.cmd("setlocal nonumber")
    vim.cmd("setlocal norelativenumber")
  end
})

-- api.nvim_create_autocmd("FileType", {
--   pattern = { "norg" },
--   callback = function ()
--     vim.cmd("set conceallevel=3")
--   end
-- })

--KEYMAPS
local keymap = vim.keymap

-- general keymaps
keymap.set("n", "x", '"_x')
keymap.set("v", "y", '"+y')


-- open notes
keymap.set("n", "<leader>n", "<cmd>Neorg index<cr>")

-- open file browser
keymap.set("n", "<leader>o", "<cmd>Oil --float<cr>")

-- close editor
keymap.set("n", "Q", ":conf qa<cr>")

-- terminal
keymap.set("t", "<ESC>", "<C-\\><C-n>")

-- gitsign 
keymap.set("n", "<leader>gd", "<cmd>Gitsigns diffthis<cr>")
keymap.set("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>")
