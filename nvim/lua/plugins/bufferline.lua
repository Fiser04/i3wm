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
			mode = "tab",
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
		-- Cache the devicons module
		local devicons = require("nvim-web-devicons")

		local function setup_bufferline_devicon_highlights(bufnr)
		    -- Get buffer path (use provided bufnr or current buffer)
		    local buf = bufnr or 0
		    local bufpath = vim.api.nvim_buf_get_name(buf)
		    if bufpath == "" then
			return
		    end

		    -- Use get_icon which is what bufferline uses
		    local icon, icon_hl_group = devicons.get_icon(vim.fn.fnamemodify(bufpath, ":t"), nil, { default = true })

		    if icon and icon_hl_group then
			local icon_name = icon_hl_group:gsub("^DevIcon", "")
			if icon_name and icon_name ~= "" then
			    vim.api.nvim_set_hl(
				0,
				"BufferLine" .. icon_hl_group .. "Selected",
				{ link = "BufferLineDevIconSelected" }
			    )
			    vim.api.nvim_set_hl(0, "BufferLine" .. icon_hl_group, { link = "BufferLineDevIcon" })
			end
		    end
		end

		-- Function to set up highlights for all existing buffers
		local function setup_all_buffer_highlights()
		    for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
			setup_bufferline_devicon_highlights(bufnr)
		    end
		end

		-- Create the augroup in Lua
		local bufferline_highlight_group =
		vim.api.nvim_create_augroup("BufferlineAllFileTypeHighlight", { clear = true })

		-- Set up autocmds for individual buffer events
		vim.api.nvim_create_autocmd({ "FileType", "BufEnter" }, {
		    group = bufferline_highlight_group,
		    callback = function()
			setup_bufferline_devicon_highlights()
		    end,
		})

		-- Set up autocmd for session loading
		vim.api.nvim_create_autocmd("SessionLoadPost", {
		    group = bufferline_highlight_group,
		    callback = setup_all_buffer_highlights,
		})

		setup_all_buffer_highlights()
	    end,
	    vim.keymap.set('n', '<leader>H', ':BufferLineCyclePrev<CR>', { desc = "Move to previous buffer" }),
	    vim.keymap.set('n', '<leader>L', ':BufferLineCycleNext<CR>', { desc = "Move to next buffer" }),
	    vim.keymap.set('n', '<leader>bd', ':bdelete<CR>', { desc = "Close current buffer" }),

	},
    }
