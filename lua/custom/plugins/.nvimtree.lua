-- config for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF]])

return {
	"kyazdani42/nvim-tree.lua",
	version = "*",
	lazy = false,
	-- dependencies = {
	-- 	"nvim-tree/nvim-web-devicons",
	-- },
	config = function()
		require("nvim-tree").setup {
			renderer = {
				highlight_opened_files = "icon"
			},
			actions = {
				open_file = {
					window_picker = {
						enable = false,
					}
				}
			},
		}
	end,
}
