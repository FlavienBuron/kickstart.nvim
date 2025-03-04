vim.g.mapleader = ' '

local keymap = vim.keymap

keymap.set('n', '<leader>+', '<C-a>') -- increment int
keymap.set('n', '<leader>-', '<C-x>') -- decreament int

-- Window Split
keymap.set('n', '<leader>sV', '<C-w>v') -- split window vertically
keymap.set('n', '<leader>sH', '<C-w>s') -- split window horizontally
keymap.set('n', '<leader>sE', '<C-w>=') -- make split windows equal width / height
keymap.set('n', '<leader>sQ', '<C-w>q') -- close current split window

-- Tabs
keymap.set('n', '<leader>to', ':tabnew<CR>')   -- open new tab
keymap.set('n', '<leader>tx', ':tabclose<CR>') -- close current tab
keymap.set('n', '<leader>tn', ':tabn<CR>')     -- go to next tab
keymap.set('n', '<leader>tp', ':tabp<CR>')     -- go to previous tab

keymap.set('n', 'x', '_x')                     -- delete character instead of cut to reg

-- Telescope keybind
keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
keymap.set('n', '<leader>fs', '<cmd>Telescope live_grep<cr>')
keymap.set('n', '<leader>fc', '<cmd>Telescope grep_string<cr>')
keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')

-- nvim-tree
keymap.set('n', '<leader>E', '<cmd>NvimTreeToggle<CR>')
keymap.set('n', '<leader>e', '<cmd>Neotree<CR>')

-- Magma
keymap.set('n', '<leader>mi', '<cmd>MagmaInit<CR>')
keymap.set('n', '<leader>mo', '<cmd>MagmaEvaluateOperator<CR>')
keymap.set('n', '<leader>ml', '<cmd>MagmaEvaluateLine<CR>')
keymap.set('n', '<leader>mv', '<cmd>MagamEvaluateVisual<CR>')
keymap.set('n', '<leader>mc', '<cmd>MagamReevaluateCell<CR>')
keymap.set('n', '<leader>mr', '<cmd>MagmaRestart!<CR>')
keymap.set('n', '<leader>mx', '<cmd>MagmaInterrupt<CR>')
keymap.set('n', '<leader>mE', '<cmd>noautocmd MagmaEnterOutput<CR>')
keymap.set('n', '<leader>mO', '<cmd>MagmaShowOutput<CR>')
keymap.set('n', '<leader>md', '<cmd>MagmaDelete<CR>')
