let g:python3_host_prog = '/usr/local/bin/python3'

filetype plugin indent on
runtime macros/matchit.vim

set shell=/bin/bash

if filereadable(expand('~/.config/vim_setting/base.vimrc'))
  source ~/.config/vim_setting/base.vimrc
endif

if !has('nvim')
  "ex_modeで<C-p>, <C-n>は入力途中のキーワードで絞り込めない為
  cnoremap <C-p> <Up>
  cnoremap <C-n> <Down>
  set wildmenu
endif

"inoremap { {<Space><Space>}<Left><Left>
"inoremap ( ()<Left>
"inoremap [ []<Left>
"inoremap < <><Left>
"inoremap " ""<Left>
"inoremap ' ''<Left>
"inoremap {} {}
"inoremap () ()
"inoremap [] []
"inoremap <> <>
"inoremap "" ""
"inoremap '' ''
"inoremap {<CR> {<CR>}<Esc><S-o>
"inoremap (<CR> (<CR>)<Esc><S-o>
"inoremap [<CR> [<CR>]<Esc><S-o>

let g:mapleader = "\<Space>"
nnoremap <Leader> <Nop>
nnoremap <Leader>h :set relativenumber!<CR>
nnoremap <Leader>j :set tabstop=2 shiftwidth=2<CR>
nmap <Leader><Leader> [~_~]
noremap <Leader><C-l> <C-l>
noremap <C-l> <Nop>

let g:mapleader = "s"
nnoremap <Leader> <Nop>
noremap [~_~]j "*p

syntax enable
