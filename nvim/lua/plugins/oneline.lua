return
    {
	{
	    'airblade/vim-gitgutter',
	    config = function ()
	    end
	},
	{
	    "j-hui/fidget.nvim",
	    config = function ()
		require('fidget').setup() 	
	    end
	},
	{
	    "rktjmp/lush.nvim",
	    event = "VeryLazy",
	},
    }
