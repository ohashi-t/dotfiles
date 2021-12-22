let g:python3_host_prog = '/usr/local/bin/python3'
if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  let s:toml_dir  = '~/.config/nvim'
  let s:toml      = s:toml_dir . '/dein.toml'
  let s:lazy_toml = s:toml_dir . '/dein_lazy.toml'

  " tomlファイルをキャッシュしておくための記述
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
set relativenumber number
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
inoremap <Down> <Nop>
inoremap <Up> <Nop>
inoremap <Right> <Nop>
inoremap <Left> <Nop>
inoremap <BS> <C-l>

"noremap j gj
"noremap gj j
"noremap k gk
"noremap gk k
"noremap 0 g0
"noremap g0 0
"noremap ^ g^
"noremap g^ ^
"noremap $ g$
"noremap g$ $

nnoremap / /\v
nnoremap <Esc><Esc> :nohlsearch<CR><Esc>

let g:mapleader = "\<Space>"
nnoremap <Leader> <Nop>
nmap <Leader><Leader> [~_~]
noremap <Leader>0 gt
noremap <Leader>9 gT
noremap <Leader><C-l> <C-l>
noremap <C-l> <Nop>

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
nmap <Leader><Leader> [~_~]
noremap [~_~]j "*p

syntax enable



let g:deoplete#enable_at_startup = 1
