return {
	{
		"neovim/nvim-lspconfig",

    lazy = true,
		dependencies = {
			{
				"nvimdev/lspsaga.nvim",
				config = function()
					require("lspsaga").setup({
						ui = {
							kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
						},
					})
				end,
			},
			"hrsh7th/cmp-nvim-lsp",
		},

		config = function()
			local lspconfig = require("lspconfig")
			local cmp = require("cmp_nvim_lsp")

			local keymap = vim.keymap

			local on_attach = function(_, bufnr)
				local opts = { noremap = true, silent = true, buffer = bufnr }

				keymap.set("n", "gh", ":Lspsaga finder<CR>", opts)
				keymap.set({ "n", "v" }, "<leader>ca", ":Lspsaga code_action<CR>", opts)
				keymap.set("n", "gr", ":Lspsaga rename<CR>", opts)
				keymap.set("n", "gd", ":Lspsaga peek_definition<CR>", opts)
				keymap.set("n", "<leader>sb", ":Lspsaga show_buf_diagnostics<CR>", opts)
				keymap.set("n", "<leader>o", ":Lspsaga outline<CR>", opts)
			end

			for _, value in pairs(SERVER_LANGS.names) do
				lspconfig[value].setup({
					on_attach = on_attach,
					capabilities = cmp.default_capabilities(),
				})

				if value == "lua_ls" then
					lspconfig[value].setup({
						on_attach = on_attach,
						capabilities = cmp.default_capabilities(),
						settings = {
							Lua = {
								completion = {
									callSnippet = "Replace",
								},
								diagnostics = {
									globals = { "vim" },
								},
								workspace = {
									library = {
										[vim.fn.expand("$VIMRUNTIME/lua")] = true,
										[vim.fn.stdpath("config") .. "/lua"] = true,
									},
								},
							},
						},
					})
				end
			end
		end,
	},
}
