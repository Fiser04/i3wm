return
    {
	'nvim-treesitter/nvim-treesitter',
	buid = ":TSUpdate",
	config = function()
	    local configs = require("nvim-treesitter.configs")
	    configs.setup({
		highlight = {
		    enable = true,
		},
		indent = {
		    enable = true,
		},
		autotage = {
		    enable = true,
		},
		ensure_installed = {
		    "lua",
		    "query",
		    "python",
		    "java",
		    "markdown",
		    "markdown_inline",
		},
		auto_install = false,
	    })
	end
    }

