return {
    {
        require('onedark').setup {
            colors = {
                cwhite = '#ffffff',
                cwhite2 = '#d4f7d6',
                cgrey = '#fcfcfc',
                cgrey2 = '#f7f7f7',
                cgrey3 = '#efefef',
                cgrey4 = '#d5d5d5',
                csteel = '#7494a3',
                cgreen = '#2d8315',
                cgreen2 = '#318e16',
                cgreen3 = '#8dc149',
                cgreen4 = '#5aa444',
                cgreen5 = '#6eaf5b',
                cseagreen = '#2e8b57',
                cdarkgreen = '#1f5c0f',
                cred = '#cc3e44',
                cpurple = '#8d43a0',
                cpurple2 = '#8d37b2',
                cpurple3 = '#b294bb',
                cpurple4 = '#bf7fbf',
                bg0 = '#1f1f1f',
                -- bg0 = '#252525',
                -- bg0 = '#2a2a2a',
                corange = '#ffa500',
                corange2 = '#ffae19',
                corange3 = '#ffb732',
                corange4 = '#ffe082',
                corange5 = '#e5c07b',
                cdarkorange = '#ff8c00',
                cdarkorange2 = '#ff9719',
                cdarkorange3 = '#e37933',
                cdarkorange4 = '#d19a66',
                cdarkblue = '#096fdf',
                cdarkblue2 = '#217de2',
                cteal = '#008080',
                cteal2 = '#56b6c2',
                clightteal = '#73d1c8',
                clightteal2 = '#4ca6a6',
                csalmon = '#f78c6a',
                cblue = '#1d5b91',
                cblue2 = '#519aba',
                cblue3 = '#4fc1ff',
                cblue4 = '#336b9c',
                cblue5 = '#9cdcfe',
                cblue6 = '#61afef',
                cblue7 = '#577ae4',
                cblue8 = '#4169e1',
                cyellow = '#ffcb6b',
                cyellow2 = '#cbcb41',
                cyellow3 = '#f3dd62',
                cblack = '#0e1112',
                cblack2 = '#090b0d',
            },
            highlights = {
                -- if, then, else, endif, switch, etc
                ['@keyword.conditional'] = {
                    fg = '$cgrey4',
                    fmt = 'bold',
                },
                -- comments
                ['@comment'] = {
                    fg = '$csteel',
                },
                ['@lsp.type.comment'] = {
                    fg = '$csteel',
                },
                -- strings
                ['@string'] = {
                    fg = '$cgreen',
                },
                -- doc strings
                ['@string.documentation'] = {
                    fg = '$clightteal2',
                },
                -- numbers: 234, 0xff
                ['@number'] = {
                    fg = '$cteal',
                    fmt = 'bold',
                },
                -- Boolean: True, false
                ['@boolean'] = {
                    fg = '$cdarkorange',
                    fmt = 'bold',
                },
                -- floating point
                ['@number.float'] = {
                    fg = '$cteal',
                    fmt = 'bold',
                },
                -- Any constant
                ['@constant'] = {
                    fg = '$cblue3',
                },
                -- Builtin Constant: python None
                ['@constant.builtin'] = {
                    fg = '$csalmon',
                },
                -- Function definition keyword: def, func, ...
                ['@keyword.function'] = {
                    fg = '$cred',
                },
                -- Function name, class methods
                ['@function'] = {
                    fg = '$cyellow3',
                },
                ['@lsp.type.function'] = {
                    fg = '$cyellow3',
                },
                -- Function paramters
                ['@parameter'] = {
                    fg = '$cdarkorange3',
                },
                ['@lsp.type.parameter'] = {
                    fg = '$cdarkorange',
                },
                -- Include statements: include, import
                ['@include'] = {
                    fg = '$cgrey4',
                    fmt = 'bold',
                },
                -- Include statements: include, import
                ['@keyword.import'] = {
                    fg = '$cgrey4',
                    fmt = 'bold',
                },
                -- Repeat: for, do, while, ...
                ['@repeat'] = {
                    fg = '$cgrey4',
                    fmt = 'bold',
                },
                ['@keyword.repeat'] = {
                    fg = '$cgrey4',
                    fmt = 'bold',
                },
                -- Operator: +, -, =, ==
                ['@operator'] = {
                    fg = '$cgrey4',
                    fmt = 'bold',
                },
                -- operator keyword: or
                ['@keyword.operator'] = {
                    fg = '$cgrey4',
                    fmt = 'bold',
                },
                -- Variables
                ['@variable'] = {
                    fg = '$cblue5',
                },
                ['@lsp.type.variable'] = {
                    fg = '$cblue5',
                },
                ['@variable.builtin'] = {
                    fg = '$cdarkorange',
                },
                -- Builtin Types
                ['@type.builtin'] = {
                    fg = '$csalmon',
                },
                ['@lsp.type.builtinType'] = {
                    fg = '$cdarkblue2',
                },
                -- Punctuation
                ['@punctuation.bracket'] = {
                    fg = '$cgrey4',
                },
                ['@punctuation.delimiter'] = {
                    fg = '$cgrey4',
                },
                -- Types
                ['@type'] = {
                    fg = '$cyellow',
                },
                -- Constructor
                ['@constructor'] = {
                    fg = '$cyellow',
                    fmt = 'bold',
                },
                -- Exceptions: try ... except
                ['@exception'] = {
                    fg = '$cgreen4',
                },
                -- Exceptions: try ... except
                ['@keyword.exception'] = {
                    fg = '$cgreen4',
                },
                -- Field
                ['@field'] = {
                    fg = '$cteal2',
                },
                -- Method Call
                ['@method'] = {
                    fg = '$cblue6',
                },
                -- Keyword
                ['@keyword'] = {
                    fg = '$cblue6',
                    fmt = 'bold',
                },
                -- Decorators
                ['@lsp.type.decorator'] = {
                    fg = '$cblue6',
                },
                -- Struct
                ['@lsp.type.struct'] = {
                    fg = '$cgreen2',
                },
                -- Characters
                -- ['@character'] = {
                --     fg = '$cteal',
                -- },
                -- Module name: import ModuleName
                ['@module'] = {
                    fg = '$cblue6',
                },
            },
        },
    },
}
