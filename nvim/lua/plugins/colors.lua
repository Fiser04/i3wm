return {
    {
	'rebelot/kanagawa.nvim',
	lazy = false,
	priority = 1000,
	config = function()
	    require('kanagawa').setup{
		transparent = true,
		colors = {
		    theme = {
			all = {
			    ui = {
				bg_gutter = "none"
			    }
			}
		    }
		},
	    }
	    vim.cmd("colorscheme kanagawa-dragon")
	end
    },
    {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	opts = {
	    'kanagawa'
	},
    },
}
