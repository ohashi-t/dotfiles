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

let g:mapleader = "s"
nnoremap <Leader><Leader>U :call <SID>ApplyWebpackerAdditionalPaths()<CR>
nnoremap <Leader><Leader>e :call <SID>ApplyEsLintCurrentFile()<CR>
nnoremap <Leader><Leader>E :call <SID>ApplyEsLintGitStatusFiles()<CR>
