return
    {
	{
	    "theprimeagen/harpoon",
	    branch = "harpoon2",
	    dependencies = { "nvim-lua/plenary.nvim" },
	    config = function()
		require("telescope").load_extension('harpoon')
		require("harpoon"):setup({
		    settings = {
			tabline = true,
			menu = {
			    width = vim.api.nvim_win_get_width(0) - 4,
			},
			tabline_prefix = "   ",
			tabline_suffix = "   ",
			tabline_numbers = true,
			config = function ()
			    vim.cmd('highlight! HarpoonInactive guibg=NONE guifg=#63698c')
			    vim.cmd('highlight! HarpoonActive guibg=NONE guifg=white')
			    vim.cmd('highlight! HarpoonNumberActive guibg=NONE guifg=#7aa2f7')
			    vim.cmd('highlight! HarpoonNumberInactive guibg=NONE guifg=#7aa2f7')
			    vim.cmd('highlight! TabLineFill guibg=NONE guifg=white')

			end
		    }
		})
	    end,
	    keys = {
		{ "<leader>A", function() require("harpoon"):list():add() end, desc = "harpoon file", },
		{ "<leader>a", function() local harpoon = require("harpoon") harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "harpoon quick menu", },
		{ "<leader>1", function() require("harpoon"):list():select(1) end, desc = "harpoon to file 1", },
		{ "<leader>2", function() require("harpoon"):list():select(2) end, desc = "harpoon to file 2", },
		{ "<leader>3", function() require("harpoon"):list():select(3) end, desc = "harpoon to file 3", },
		{ "<leader>4", function() require("harpoon"):list():select(4) end, desc = "harpoon to file 4", },
		{ "<leader>5", function() require("harpoon"):list():select(5) end, desc = "harpoon to file 5", },
	    },
	},
    }
