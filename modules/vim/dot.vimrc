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
  " 出来なくは無いけどやってる暇無いんでベタ書き
  let l:target_dir = '/app/javascript/packs'
  if 0 != system('test -e $(git rev-parse --show-toplevel)'.l:target_dir.'; echo $?')
    echo 'target_path not found...' | return
  endif
  execute('set path+='.trim(systemlist('echo $(git rev-parse --show-toplevel)'.l:target_dir)[0]))
  echo 'append_target_path done!'

  " if 0 != system('test -e $(git rev-parse --show-toplevel)/config/webpacker.yml; echo $?')
  "   echo 'can't find webpacker.yml' | return
  " endif
  " TODO: additional_paths記載行の配列をparseして読み込む
endfunction

" TODO: ApplyEsLintCurrentFile関数と引数で対象ファイルを指定するようにして共通化したい
function! s:ApplyEsLintGitStatusFiles()
  let l:eslint_path = system('echo -n $(git rev-parse --show-toplevel)/node_modules/.bin/eslint')
  call system('test -L ' . l:eslint_path)
  if v:shell_error | echo "eslint is not found in node_modules path." | return | endif

  let l:git_status_files = systemlist('git status -s | gsed -E "s;^.*\s;;g" | gsed -nE "/.(js|vue)$/p"')

  echo "waiting..."
  call system(l:eslint_path . ' --fix ' . join(l:git_status_files))
  windo edit! | redraw | echo "eslint fix for target files by [git status] finish!"
endfunction

" TODO: ApplyEsLintGitStatusFiles関数と引数で対象ファイルを指定するようにして共通化したい
function! s:ApplyEsLintCurrentFile()
  let l:eslint_path = system('echo -n $(git rev-parse --show-toplevel)/node_modules/.bin/eslint')
  call system('test -L ' . l:eslint_path)
  if v:shell_error | echo "eslint is not found in node_modules path." | return | endif

  let l:current_full_path = trim(execute('pwd')).'/'.expand('%')

  echo "waiting..."
  call system(l:eslint_path . ' --fix ' . l:current_full_path)
  edit! | redraw | echo "eslint fix for current file finish!"
endfunction

" tips: mapleaderが"\<Space>"の設定記述の上に"s"の設定を記述
let g:mapleader = "s"
nnoremap <Leader> <Nop>
vnoremap <Leader> <Nop>
nnoremap <Leader><Leader>u :execute('set path+='.trim(execute('pwd')))
nnoremap <Leader><Leader>U :call <SID>ApplyWebpackerAdditionalPaths()<CR>
nnoremap <Leader><Leader>e :call <SID>ApplyEsLintCurrentFile()<CR>
nnoremap <Leader><Leader>E :call <SID>ApplyEsLintGitStatusFiles()<CR>

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

let g:mapleader = "\<Space>"
nnoremap <Leader> <Nop>
nnoremap <Leader>/ :call <SID>ShortGrep("")<Left><Left>
nnoremap <Leader>h :set relativenumber!<CR>
nnoremap <Leader>j :set tabstop=2 shiftwidth=2<CR>
nnoremap <Leader>s :SaveSession 
nnoremap <Leader>l :FloadSession<CR>
nnoremap <Leader>e :call <SID>TurnBackWindoEdit()<CR>
noremap <Leader><C-l> <C-l>
noremap <C-l> <Nop>

" https://zenn.dev/mattn/articles/83c2d4c7645faaから拝借
nmap <leader>n :Cnext<CR><SID><leader>
nmap <leader>N :Cprev<CR><SID><leader>
nnoremap <script> <SID><leader>n :Cnext<CR><SID><leader>
map <SID><leader> <Nop>

syntax enable
