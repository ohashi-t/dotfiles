let g:python3_host_prog = '/usr/local/bin/python3'

filetype plugin indent on
let g:netrw_liststyle=3    "tree view.
runtime macros/matchit.vim

set shell=/bin/bash

set suffixesadd+=.vue,.js,.ts

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

" tips: mapleaderが"\<Space>"の設定記述の上に"s"の設定を記述
let g:mapleader = "s"
nnoremap <Leader> <Nop>
vnoremap <Leader> <Nop>
nnoremap <Leader><Leader>u :execute('set path+='.trim(execute('pwd')))

function! s:ShortGrep(word)
  let l:current_dir = trim(execute('pwd'))
  execute 'cd '.system('git rev-parse --show-toplevel 2>/dev/null || echo $PWD')
  execute('grep '.a:word.' '.'`git ls-files`')
  " 外部コマンド実行後の待機をキャンセル出来る
  redraw
  cw
  execute 'cd '.l:current_dir
endfunction

function! s:TurnBackWindoEdit()
  let l:prev_winnr = winnr()
  windo edit
  exe l:prev_winnr .. "wincmd w"
  norm zz
endfunction

nnoremap ? :call <SID>ShortGrep("")<Left><Left>

let g:mapleader = "\<Space>"
nnoremap <Leader> <Nop>
nnoremap <Leader>h :set relativenumber!<CR>
nnoremap <Leader>j :set tabstop=2 shiftwidth=2<CR>
nnoremap <Leader>s :SaveSession 
nnoremap <Leader>l :FloadSession<CR>
nnoremap <Leader>e :call <SID>TurnBackWindoEdit()<CR>
nnoremap <Leader>B hn:s;<C-R>/;;<Left>
nnoremap <Leader>b n&
noremap <Leader><C-l> <C-l>
noremap <C-l> <Nop>

command! Cnext try | cnext | catch | cfirst | catch | endtry
command! Cprev try | cprev | catch | clast | catch | endtry

" https://zenn.dev/mattn/articles/83c2d4c7645faaから拝借
nmap <leader>n :Cnext<CR><SID><leader>
nmap <leader>N :Cprev<CR><SID><leader>
nnoremap <script> <SID><leader>n :Cnext<CR><SID><leader>
nnoremap <script> <SID><leader>N :Cprev<CR><SID><leader>

nmap <leader>b n&<SID><leader>
nnoremap <script> <SID><leader>b n&<SID><leader>
map <SID><leader> <Nop>

syntax enable
