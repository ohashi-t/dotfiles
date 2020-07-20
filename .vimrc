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

noremap j gj
noremap gj j
noremap k gk
noremap gk k
nnoremap / /\v
nnoremap <Esc><Esc> :nohlsearch<CR><Esc>

nnoremap <Space> <Nop>
let g:mapleader = "\<Space>"
noremap <Leader>0 gt
noremap <Leader>9 gT
nnoremap <Leader>v V

nnoremap s <Nop>
let g:mapleader = "s"
nmap <Leader>s [ss]
noremap [ss]j "*p

syntax on
