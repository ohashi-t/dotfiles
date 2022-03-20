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

" defined in nvim/plugins/fzf.vim
nnoremap <Leader>r :CGD<CR>
vnoremap <Leader>e :call FZGitGrepRange()<CR>


" let g:mapleader = "s"

syntax enable

" session path
let s:session_path = expand('~/.config/vim_session')


if !isdirectory(s:session_path)
  call mkdir(s:session_path, "p")
endif
" save session
function! s:autoSaveSession()
  if 0 == system('git rev-parse --show-toplevel &>/dev/null; echo $?')
    let l:file_name = tr(trim(system('git rev-parse --show-toplevel')), '/', '_') . '_0.vim'
    execute 'silent mksession!' s:session_path . '/' . l:file_name
  endif
endfunction
command! -nargs=0 AutoSaveSession call s:autoSaveSession()

function! s:autoLoadSession() abort
  let l:file_name = s:session_path . '/' . tr(trim(system('git rev-parse --show-toplevel')), "/", "_") . '_0.vim'
   if filereadable(l:file_name)
     execute 'silent source' l:file_name
     return
   endif
endfunction
command! -nargs=0 AutoLoadSession call s:autoLoadSession()

command! -nargs=1 SaveSession call s:saveSession(<f-args>)
function! s:saveSession(file)
  execute 'silent mksession!' s:session_path . '/' . a:file
endfunction

" load session
command! -nargs=1 LoadSession call s:loadSession(<f-args>)
function! s:loadSession(file)
  execute 'silent source' a:file
endfunction
command! FloadSession call fzf#run({
\  'source': split(glob(s:session_path . "/*"), "\n"),
\  'sink':    function('s:loadSession'),
\  'options': '-m -x +s',
\  'down':    '40%'})

" delete session
command! -nargs=1 DeleteSession call s:deleteSession(<f-args>)
function! s:deleteSession(file)
  call delete(expand(a:file))
endfunction
command! FdeleteSession call fzf#run({
\  'source': split(glob(s:session_path . "/*"), "\n"),
\  'sink':    function('s:deleteSession'),
\  'options': '-m -x +s',
\  'down':    '40%'})

autocmd VimLeave * AutoSaveSession
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | call s:autoLoadSession() | endif
