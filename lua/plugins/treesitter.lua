-- configurações do treesitter 


local M = {
	"nvim-treesitter/nvim-treesitter",
	build = function()
		require("nvim-treesitter.install").update({ with_sync = true })()
	end,


	config = function () 
	local configs = require("nvim-treesitter.configs")

	configs.setup({
		sync_install = true,
		auto_install = true,
		highlight = { enable = true },
        	indent = { enable = true },  
	})
	end,
}

return { M }
