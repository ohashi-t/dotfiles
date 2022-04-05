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
    execute 'cd ' . system('git rev-parse --show-toplevel 2>/dev/null || echo $HOME')

    let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'ctrl-k:kill-line,Up:Preview-up,Down:preview-down,change:reload:'.reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
  endfunction
  command! -nargs=* -bang RG call FZGrep(<q-args>, <bang>0)

  function! FZGitGrepRange() range
    let tmp = @@
    silent normal gvy
    let selected = @@
    let @@ = tmp
    echo selected
    call FZGrep(selected, 0)
  endfunction
endif

function! s:OpenGitFile(dir_path) abort
  let l:full_path = systemlist('git rev-parse --show-toplevel')[0] . '/' . a:dir_path
  execute "cd " . l:full_path
  if 0 != system("ls -F | grep -v '/'; echo $?")
    echo "move to " . l:full_path
    return
  endif
  call fzf#run({ 'source': "ls -F | grep -v '/'", 'sink': 'args', 'options': ['--preview', 'bat {}']} )
endfunction
command! -nargs=1 -bang OGFile call s:OpenGitFile(<f-args>)

function! s:CdGitDir() abort
  call fzf#run({
        \'source': "git ls-files | gsed -E '/^[^/]*$/d' | gsed -E 's;/[^/]*$;;g' | sort | uniq",
        \'dir': systemlist('git rev-parse --show-toplevel')[0],
        \'options': ['--bind=ctrl-k:kill-line,Up:Preview-up,Down:preview-down','--preview', 'ls -aFG {}'],
        \'sink': 'OGFile'
        \})
endfunction
command! -nargs=0 -bang CGD call s:CdGitDir()

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
  call fzf#run({
        \'source': 'ls -aF | tail -n +2',
        \'options': ['--header=' . trim(execute('pwd')), '--bind=ctrl-k:kill-line,Up:Preview-up,Down:preview-down'],
        \'sink': 'CLs'
        \})
endfunction
command -nargs=* LCd call LsAndCd()

function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
  call s:BufDel()
endfunction

function! s:BufDel() abort
  call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
  \ }))
endfunction
command! BD call s:BufDel()

" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | LCd | endif


let g:mapleader = "s"
nnoremap <silent> <Leader>j :<C-u>call LsAndCd()<CR>
vnoremap <silent> <Leader>g :<C-u>call FZGitGrepRange()<CR>
nnoremap <silent> <Leader>g :<C-u>RG<CR>
" nnoremap <silent> <Leader>b :<C-u>Buffers<CR>
nnoremap <silent> <Leader>lf :<C-u>GFiles<CR>
nnoremap <silent> <Leader>l? :<C-u>GFiles?<CR>
nnoremap <silent> <Leader>ld :<C-u>BD<CR>

let g:mapleader = "\<Space>"
nnoremap <silent> <Leader>i :CGD<CR>
