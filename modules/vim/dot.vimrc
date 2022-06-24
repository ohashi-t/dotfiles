let g:python3_host_prog = '/usr/local/bin/python3'

filetype plugin indent on
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

command! Cnext try | cnext | catch | cfirst | catch | endtry
command! Cprev try | cprev | catch | clast | catch | endtry

function! s:ApplyWebpackerAdditionalPaths()
  if 0 == ('$(git rev-parse --show-toplevel)/config/webpacker.yml; echo $?')
    echo 'debug_check'
  endif
endfunction

" tips: mapleaderが"\<Space>"の設定記述の上に"s"の設定を記述
let g:mapleader = "s"
nnoremap <Leader> <Nop>
vnoremap <Leader> <Nop>
nnoremap <Leader><Leader>u :execute('set path+='.trim(execute('pwd')))
nnoremap <Leader><Leader>U :call <SID>ApplyWebpackerAdditionalPaths()<CR>

function! s:ShortGrep(word)
  let l:current_dir = trim(execute('pwd'))
  execute 'cd '.system('git rev-parse --show-toplevel 2>/dev/null || echo $PWD')
  execute('grep '.a:word.' '.'`git ls-files`')
  " 外部コマンド実行後の待機をキャンセル出来る
  redraw
  cw
  execute 'cd '.l:current_dir
endfunction

let g:mapleader = "\<Space>"
nnoremap <Leader> <Nop>
nnoremap <Leader>/ :call <SID>ShortGrep("")<Left><Left>
nnoremap <Leader>h :set relativenumber!<CR>
nnoremap <Leader>j :set tabstop=2 shiftwidth=2<CR>
nnoremap <Leader>s :SaveSession 
nnoremap <Leader>l :FloadSession<CR>
nnoremap <Leader>e :windo edit<CR><C-w><C-w>
noremap <Leader><C-l> <C-l>
noremap <C-l> <Nop>

" https://zenn.dev/mattn/articles/83c2d4c7645faaより拝借
nmap <leader>n :Cnext<CR><SID><leader>
nmap <leader>N :Cprev<CR><SID><leader>
nnoremap <script> <SID><leader>n :Cnext<CR><SID><leader>
map <SID><leader> <Nop>

syntax enable
