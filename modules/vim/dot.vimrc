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

for char in ['?', '!', ',', '.', '+', '=', ';', '/']
  execute('inoremap ' . char . ' ' . char . '<C-g>u')
endfor
inoremap <buffer> <Space> <Space><C-g>u

command! Cnext try | cnext | catch | cfirst | catch | endtry
command! Cprev try | cprev | catch | clast | catch | endtry

" tips: mapleaderが"\<Space>"の設定記述の上に"s"の設定を記述
" let g:mapleader = "s"

let g:mapleader = "\<Space>"
nnoremap <Leader> <Nop>
nnoremap <Leader>n :Cnext<CR>
nnoremap <Leader>N :Cprev<CR>
nnoremap <Leader>/ :vimgrep<Space>/\V/<Space>%<Space>\|<Space>cw<Left><Left><Left><Left><Left><Left><Left><Left>
nnoremap <Leader>h :set relativenumber!<CR>
nnoremap <Leader>j :set tabstop=2 shiftwidth=2<CR>
nnoremap <Leader>s :SaveSession 
nnoremap <Leader>l :FloadSession<CR>
noremap <Leader><C-l> <C-l>
noremap <C-l> <Nop>

syntax enable
