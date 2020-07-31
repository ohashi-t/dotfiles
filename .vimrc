if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')
 
  let s:toml_dir  =  '~/.vim/rc' 
  let s:toml      = s:toml_dir . '/dein.toml'
  let s:lazy_toml = s:toml_dir . '/dein_lazy.toml'
  
  " tomlファイルをキャッシュしておくための記述
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on

" settings
set encoding=utf-8
set fileencoding=utf-8
set clipboard+=unnamed
set backspace=2
set tabstop=2
set shiftwidth=2
set laststatus=2
set statusline=%y
set showmatch
set wrapscan
set hlsearch
set showcmd
set title
set number relativenumber
set cursorline
set cursorcolumn
set nofoldenable
set noswapfile
set expandtab
set splitbelow
set splitright
set incsearch
set ignorecase
set smartcase
set helplang=ja

noremap <Down> <Nop>
noremap <Up> <Nop>
noremap <Right> <Nop>
noremap <Left> <Nop>
inoremap <Down> <C-l>
inoremap <Up> <Nop>
inoremap <Right> <Nop>
inoremap <Left> <Nop>
inoremap <BS> <Nop>
inoremap <CR> <Nop>

noremap j gj
noremap gj j
noremap k gk
noremap gk k
nnoremap / /\v
nnoremap <Esc><Esc> :nohlsearch<CR><Esc>

let g:mapleader = "\<Space>"
nnoremap <Leader> <Nop>
nmap <Leader><Leader> [~_~]
noremap <Leader>0 gt
noremap <Leader>9 gT
nnoremap <Leader>v V
nnoremap <Leader>h <C-u>
nnoremap <Leader>j <C-f>
nnoremap <Leader>k <C-b>
nnoremap <Leader>l <C-d>
noremap <Leader><C-l> <C-l>
noremap <C-l> <Nop>

let g:mapleader = "s"
nnoremap <Leader> <Nop>
nmap <Leader><Leader> [~_~]
noremap [~_~]j "*p

syntax on
