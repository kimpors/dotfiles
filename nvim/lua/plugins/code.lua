return {


  { "nvim-lua/plenary.nvim", lazy = true },


  -- add support for autopair 
  {
    "windwp/nvim-autopairs",

    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({
        disable_filetype = { "TelescopePrompt", "vim" },
      })
    end,
  },


  -- add auto comments 
  {
    "numToStr/Comment.nvim",

    keys = {
      { "gc", mode = { "n", "v" } },
      { "gb", mode = { "n", "v" } },
    },
    config = function()
      require("Comment").setup()
    end,

  },


  -- add fuzzy finder support
  {
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",

    cmd = "Telescope",
		keys = {
			{ "<leader>ff", "<cmd>Telescope find_files<cr>" },
			{ "<leader>fs", "<cmd>Telescope live_grep<cr>" },
			{ "<leader>fc", "<cmd>Telescope grep_string<cr>" },
			{ "<leader>fh", "<cmd>Telescope help_tags<cr>" },
			{ "<leader>fp", "<cmd>Telescope project<cr>" },
			{ "<leader>fe", "<cmd>Telescope file_browser<cr>" },
		},
		dependencies = {
			{ "nvim-telescope/telescope-project.nvim" },
		  { "nvim-telescope/telescope-file-browser.nvim" },
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = function()
			require("telescope").setup({

				defaults = {
					layout_strategy = "horizontal",
					layout_config = {
						horizontal = {
							height = 0.9,
							width = 0.9,
							preview_cutoff = 0,
							preview_width = 0.7,
							prompt_position = "bottom",
						},
					},
				},
				extensions = {
					file_browser = {},
					project = {
						theme = "dropdown",
						order_by = "asc",
						sync_with_nvim_tree = true,
					},
				},
			})

			require("telescope").load_extension("fzf")
			require("telescope").load_extension("project")
			require("telescope").load_extension("file_browser")
		end,
	},


  -- add autocompletion support
  {
		"hrsh7th/nvim-cmp",

    event = { "InsertEnter", "CmdlineEnter" },
		dependencies = {
			{
			  "L3MON4D3/LuaSnip",
			  version = "2.*",
			  build = "make install_jsregexp",
			},
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-path",
		},
		config = function()
      local luasnip = require("luasnip")
			local cmp = require("cmp")

			require("luasnip.loaders.from_vscode").lazy_load( {exclude = { "html", "cs" }})
      require("luasnip.loaders.from_snipmate").lazy_load()
			require("luasnip").filetype_extend("typescriptreact", { "html" })

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-k>"] = cmp.mapping.select_prev_item(),
					["<C-j>"] = cmp.mapping.select_next_item(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = false }),
          -- ["<Tab>"] = cmp.mapping(function()
          --     if luasnip.expand_or_jumpable() then
          --         luasnip.expand_or_jump()
          --     end
          -- end, { "i", "s" }),
				}),
				sources = cmp.config.sources({
					{ name = "luasnip" },
					{ name = "nvim_lsp" },
					{ name = "path" },
				}),
			})
		end,
	},


  -- add git support
  {
    "lewis6991/gitsigns.nvim",

    event = "InsertEnter",
    config = function()
      require("gitsigns").setup()
    end,
  },


  -- add wrap selection
  {
    "kylechui/nvim-surround",
    version = "*",

    event = "InsertEnter",
    config = function()
      require("nvim-surround").setup()
    end,

  },


  -- add highlight support
  {
    "nvim-treesitter/nvim-treesitter",


    event = { "BufReadPost", "BufWritePost", "BufNewFile", "VeryLazy" },
    build = ":TSUpdate",
    dependencies = {
      "windwp/nvim-ts-autotag",
    },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = SERVER_LANGS.treesitter,
        highlight = { enable = true },
        autotag = { enable = true },
        sync_install = true,
      })
    end,
  },


  -- for note taking
  {
    "nvim-neorg/neorg",

    cmd = "Neorg",
    build = ":Neorg sync-parsers",
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {},
          ["core.concealer"] = {},
          ["core.summary"] = {},
          ["core.dirman"] = {
            config = {
              workspaces = {
                notes = "~/notes",
              },
              default_workspace = "notes"
            },
          },
        },
      }
    end,
  },
}
