return {

    -- icons
  { "nvim-tree/nvim-web-devicons", lazy = true },


  -- ui components
  { "MunifTanjim/nui.nvim", lazy = true },


  -- ui components
  { "rcarriga/nvim-notify", lazy = true },


  -- support for colors
  {
    "NvChad/nvim-colorizer.lua",

    ft = { "css", "html", "javascript" },
    config = function()
      require("colorizer").setup({
        filetypes = ft,
      })
    end,
  },


  -- ui replacment for messages, cmdline and the popupmenu
  {
    "folke/noice.nvim",

    event = "VeryLazy",
    config = function()
      require("noice").setup({
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        presets = {
          bottom_search = false,
          command_palette = true,
          long_message_to_split = true,
          inc_rename = false,
          lsp_doc_border = false,
        },
      })
    end,
  },


  -- startup screen
  {
    "glepnir/dashboard-nvim",

    event = "VimEnter",
    config = function()
      require("dashboard").setup({
        theme = "hyper",
        hide = {
          statusline = false,
        },
        change_to_vcs_root = true,
        config = {
          week_header = { enable = true },
          packages = { enable = false },
          project = { enable = false },
          mru = { limit = 5, label = "Recent" },
          disable_move = true,

          shortcut = {
            { desc = "Lazy", key = "L", action = "Lazy" },
            { desc = "Mason", key = "M", action = "Mason" },
          },
          footer = {},
        },
      })
    end,
  },


  -- statusline
  {
		"nvim-lualine/lualine.nvim",


    event = "VeryLazy",
    init = function()
      vim.g.lualine_laststatus = vim.o.laststatus

      if vim.fn.argc(-1) > 0 then
        -- set an empty statusline till lualine loads
        vim.o.statusline = " "
      else
        -- hide the statusline on the starter page
        vim.o.laststatus = 0
      end
    end,
		config = function()
			require("lualine").setup({
				options = {
					theme = "catppuccin",
					globalstatus = true,
					component_separators = { left = "󰍟", right = "󰍞" },
					section_separators = { left = "", right = "" },
					disabled_filetypes = {
                        statusline = { "dashboard" },
						"help",
						"gitcommit",
					},
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch" },
					lualine_c = { "diagnostics" },
					lualine_x = {},
					lualine_y = { "filesize", "filetype" },
					lualine_z = { "progress" },
				},
			})
		end,
  }
}
