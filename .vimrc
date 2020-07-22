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

noremap <Down> <Nop>
noremap <Up> <Nop>
noremap <Right> <Nop>
noremap <Left> <Nop>
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
nnoremap <C-b> <Nop>

let g:mapleader = "s"
nnoremap <Leader> <Nop>
nmap <Leader><Leader> [~_~]
noremap [~_~]j "*p

syntax on
