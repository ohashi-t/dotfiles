function! RRoute() abort
  if !executable('rroute')
    echo "can't execute this command..."
    return -1
  endif
  call fzf#run({'source': 'rroute'})
endfunction
command! -nargs=0 -bang RRR call RRoute()

if executable('rroute')
  inoremap  <expr> <c-x><c-r> fzf#vim#complete({'source': 'rroute'})
endif

if executable('rg')
  function! FZGrep(query, fullscreen)
    let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
  endfunction
  command! -nargs=* -bang RG call FZGrep(<q-args>, <bang>0)

  function! FZGitGrep(query, fullscreen)
    execute 'cd ' . system('git rev-parse --show-toplevel')
    let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
  endfunction
  command! -nargs=* -bang RGG call FZGitGrep(<q-args>, <bang>0)

  function! FZGitGrepRange() range
    let tmp = @@
    silent normal gvy
    let selected = @@
    let @@ = tmp
    echo selected
    call FZGitGrep(selected, 0)
  endfunction

  let g:mapleader = "\<Space>"
  vnoremap <Leader>e :call FZGitGrepRange()<CR>
endif

function! s:CdGitDir() abort
  call fzf#run({'source': "git ls-files | gsed -E '/^[^/]*$/d' | gsed -E 's;/[^/]*$;;g' | sort | uniq", 'dir': systemlist('git rev-parse --show-toplevel')[0], 'options': ['--bind=ctrl-k:kill-line,Up:Preview-up,Down:preview-down', '--preview', 'ls -aFG {}'], 'sink': 'cd'})
endfunction
command! -nargs=0 -bang CGD call s:CdGitDir()
let g:mapleader = "\<Space>"
nnoremap <Leader>r :CGD<CR>


function s:CdAndLs(path) abort
  if 0 == system("test -d " . a:path . "; echo $?")
    execute("cd " . a:path)
    call LsAndCd()
  elseif 0 == system("test -f " . a:path . "; echo $?")
    execute("args ". a:path)
  else
    echo "can't execute..."
  endif
endfunction
command -nargs=1 CLs call s:CdAndLs(<f-args>)

function LsAndCd() abort
  call fzf#run({'source': 'ls -aF | tail -n +2', 'options': ['--header=' . trim(execute('pwd')), '--bind=ctrl-k:kill-line,Up:Preview-up,Down:preview-down'], 'sink': 'CLs' })
endfunction
command -nargs=* LCd call LsAndCd()

" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | LCd | endif
