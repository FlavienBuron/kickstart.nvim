return {
    {
        -- 'glepnir/lspsaga.nvim'
        'nvimdev/lspsaga.nvim',
        config = function()
            require('lspsaga').setup {
                move_in_saga = {
                    prev = 'C-k',
                    next = 'C-j',
                },
                finder_action_keys = {
                    edit = '<CR>',
                },
                ui = {
                    code_action = '',
                },
                finder = {
                    layout = 'float',
                    default = 'def+ref+imp',
                },
            }
        end,
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
        },
    },
}
