-- repl
return {
	{
		'hkupty/iron.nvim',
		config = function()
			local iron = require 'iron.core'
			iron.setup {
				config = {
					-- Whether a repl should be discarded or not
					scratch_repl = true,
					repl_open_cmd = 'rightbelow 40vsplit | set nonu | set norelativenumber | set signcolumn=no',
					repl_definition = {
						python = {
							command = function()
								if os.getenv 'CONDA_PREFIX' == nil then
									return { 'python3' }
								else
									return { os.getenv 'CONDA_PREFIX' .. '/bin/python3' }
								end
							end,
						},
					},
				},
				highlight = {
					italic = true,
				},
				ignore_blank_line = false,
			}
		end,
	},
}
