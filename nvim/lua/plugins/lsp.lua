return {
-- language server manager
	{
    	"williamboman/mason-lspconfig.nvim",

        event = { "BufReadPost", "BufWritePost", "BufNewFile", "VeryLazy" },
        cmd = "Mason",
        dependencies = {
          {
            "williamboman/mason.nvim",

            config = function()
              require("mason").setup()
            end,
          },
        },
        config = function()
          require("mason-lspconfig").setup({
            ensure_installed = SERVER_LANGS.lsp,
            automatic_installation = true,
          })
        end,
      },


-- language servers benefits
	{
		"neovim/nvim-lspconfig",

        event = { "BufReadPost", "BufWritePost", "BufNewFile", "VeryLazy" },
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
		},

		config = function()
			local lspconfig = require("lspconfig")

			local keymap = vim.keymap

			local on_attach = function(_, bufnr)
				local opts = { noremap = true, silent = true, buffer = bufnr }

				keymap.set("n", "<leader>lf", ":Lspsaga finder<CR>", opts)
				keymap.set({ "n", "v" }, "<leader>la", ":Lspsaga code_action<CR>", opts)
				keymap.set("n", "<leader>lr", ":Lspsaga rename<CR>", opts)
				keymap.set("n", "<leader>ld", ":Lspsaga peek_definition<CR>", opts)
				keymap.set("n", "<leader>lb", ":Lspsaga show_buf_diagnostics<CR>", opts)
			end

			for _, value in pairs(SERVER_LANGS.lsp) do
				lspconfig[value].setup({
					on_attach = on_attach,
				})
			end

            lspconfig.gdscript.setup({
				on_attach = on_attach,
                filetype = { "gd", "gdscript", "gdscript3" },
            })
		end,
	},
}
