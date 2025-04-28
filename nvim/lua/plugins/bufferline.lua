return
    {
	{
	    'akinsho/bufferline.nvim',
	    version = "*",
	    dependencies = 'nvim-tree/nvim-web-devicons',
	    config = function ()
		require("bufferline").setup{
		    options = {
			diagnostics = "nvim_lsp",
			numbers = "ordinal",
			diagnostics_indicator = function (count, level, diagnostics_dict, context)
			    local s = " "
			    for e, n in pairs(diagnostics_dict) do
				local sym = e == "error" and " "
				or (e == "warning" and "  " or "  ")
				s = s .. n .. sym
			    end
			    return s
			end
		    }
		}
	    end,
	    vim.keymap.set('n', '<leader>H', ':BufferLineCyclePrev<CR>', { desc = "Move to previous buffer" }),
	    vim.keymap.set('n', '<leader>L', ':BufferLineCycleNext<CR>', { desc = "Move to next buffer" }),
	    vim.keymap.set('n', '<leader>bd', ':bdelete<CR>', { desc = "Close current buffer" }),
	},
    }
