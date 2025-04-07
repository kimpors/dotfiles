---@diagnostic disable: undefined-global
require("plugins-setup")

vim.lsp.enable({'clangd', 'luals'})
vim.diagnostic.config({ virtual_lines = true })
require("lazy").setup("plugins")
