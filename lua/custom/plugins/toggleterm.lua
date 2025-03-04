return {
	{
		"akinsho/toggleterm.nvim",
		version = "v2.*",
		config = function()
			require("toggleterm").setup {
				size = 20,
				open_mapping = [[<C-\>]]
			}
		end,
	}
}
