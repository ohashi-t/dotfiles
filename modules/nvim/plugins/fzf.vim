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
endif

function s:CdAndLs(path)
  let l:isDirectory = system("test -d " . a:path . "; echo $?")
  if l:isDirectory == 0
    execute("cd " . a:path)
    call LsAndCd()
  else
    echo "can't execute..."
  endif
endfunction
command -nargs=1 CLs call s:CdAndLs(<f-args>)

function LsAndCd()
  call fzf#run({'source': 'ls -aF | tail -n +2', 'options': ['--header=' . trim(execute('pwd'))], 'sink': 'CLs' })
endfunction
command -nargs=* LCd call LsAndCd()
