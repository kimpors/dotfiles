---@diagnostic disable: undefined-global
require("plugins-setup")

vim.lsp.enable({'clangd', 'luals'})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
	if client:supports_method('textDocument/completion') then
	  vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
	end
  end,
})

vim.diagnostic.config({ virtual_lines = true })
require("lazy").setup("plugins")
