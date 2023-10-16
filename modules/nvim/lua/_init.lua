vim.cmd.packadd "packer.nvim"

return require('packer').startup(function(use)
  use { "tpope/vim-commentary" }
  use { "vim-jp/vimdoc-ja" }
  use { "tpope/vim-surround" }
  use { "cohama/lexima.vim" }
  use {
    'junegunn/fzf.vim',
    requires = { 'junegunn/fzf', run = ':call fzf#install()' }
  }
end)
