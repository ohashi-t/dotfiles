set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

if &compatible
  set nocompatible
endif
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  let s:toml_dir  = '~/.config/nvim'
  let s:toml      = s:toml_dir . '/dein.toml'
  let s:lazy_toml = s:toml_dir . '/dein_lazy.toml'

  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

let g:mapleader = "s"
nnoremap <Leader> <Nop>
nnoremap <silent> <leader>y :Defx<CR>
nnoremap <silent> <leader>k :Denite file/rec buffer<CR>
nnoremap <silent> <leader>b :Denite buffer<CR>
nnoremap <silent> <leader>l :Denite line<CR>
nnoremap <silent> <leader>o :Denite outline<CR>
nnoremap <silent> <leader>r :Denite file/old<CR>
nnoremap <silent> <leader>h :Denite command_history<CR>
nnoremap <silent> <leader>g :Denite grep<CR>

let g:deoplete#enable_at_startup = 1
colorscheme molokai

source ~/.vimrc
