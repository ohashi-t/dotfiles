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
