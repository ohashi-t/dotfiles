let g:python3_host_prog = '/usr/local/bin/python3'

filetype plugin indent on

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

noremap <C-n> gt
noremap <C-p> gT

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
noremap <Leader><C-l> <C-l>
noremap <C-l> <Nop>

let g:mapleader = "s"
nnoremap <Leader> <Nop>
nmap <Leader><Leader> [~_~]
noremap [~_~]j "*p

syntax enable



