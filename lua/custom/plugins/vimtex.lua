return {
  {
    'lervag/vimtex',
    ft = 'tex', -- load only for LaTeX files
    config = function()
      vim.g.vimtex_compiler_method = 'latexmk'
      vim.g.vimtex_view_method = 'zathura' -- or 'skim', 'okular', 'evince'
    end,
  },
}
