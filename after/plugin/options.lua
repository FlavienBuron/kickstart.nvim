local opt = vim.opt

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.smarttab = true
opt.softtabstop = 0

-- line wrapping
opt.wrap = false

-- seach settings
opt.ignorecase = true
opt.smartcase = true

-- appearance
opt.background = 'dark'
opt.signcolumn = 'yes'
opt.termguicolors = true
opt.cursorline = true

-- backspace
opt.backspace = 'indent,eol,start'

-- clipboard
opt.clipboard:append 'unnamedplus'

-- split windows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append '-'
