require("plugins-setup")
vim.lsp.enable({"clangd", "luals", "cmakels"})
vim.diagnostic.config({ virtual_lines = true })
require("lazy").setup("plugins")
