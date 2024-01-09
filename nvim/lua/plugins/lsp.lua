return {


  -- add easy way to install language servers
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


  -- configure language servers
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

			for _, value in pairs(SERVER_LANGS.lsp) do
				lspconfig[value].setup({
					on_attach = on_attach,
					capabilities = cmp.default_capabilities(),
				})
			end
		end,
	},
}
