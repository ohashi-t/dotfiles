call ddu#custom#patch_global({
    \   'ui': 'ff',
    \   'uiParams': {
    \     'ff': {
    \       'startFilter': v:true,
    \       'prompt': '> ',
    \       'split': 'floating',
    \     }
    \   },
    \   'sources': [{'name':'file','params':{}},{'name':'mr'},{'name':'register'},{'name':'buffer'}],
    \   'sourceOptions': {
    \     '_': {
    \       'matchers': ['matcher_substring'],
    \     },
    \     'file_rec': {'path': expand("%:h")},
    \   },
    \   'filterParams': {
    \     'matcher_substring': {
    \       'highlightMatched': 'Title',
    \     },
    \   },
    \   'kindOptions': {
    \     'file': {
    \       'defaultAction': 'open',
    \     },
    \     'word': {
    \       'defaultAction': 'append',
    \     },
    \   },
    \ })

call ddu#custom#patch_local('grep', {
\   'sourceParams' : {
\     'rg' : {
\       'args': ['--column', '--no-heading', '--color', 'never'],
\     },
\   },
\   'uiParams': {
\     'ff': {
\       'startFilter': v:false,
\     }
\   },
\ })

" call ddu#custom#patch_local('files', {
"     \ 'sources': [
"     \   {'name': 'file', 'params': {}},
"     \   {'name': 'file_old', 'params': {}},
"     \ ],
"     \ })

" call ddu#start({'sources': [
"     \ {'name': 'file_rec', 'params': {'path': expand('~')}}
"     \ ]})



"ddu-key-setting
autocmd FileType ddu-ff call s:ddu_my_settings()
function! s:ddu_my_settings() abort
  nnoremap <buffer><silent> <CR>
        \ <Cmd>call ddu#ui#ff#do_action('itemAction')<CR>
  nnoremap <buffer><silent> <Space>
        \ <Cmd>call ddu#ui#ff#do_action('toggleSelectItem')<CR>
  nnoremap <buffer><silent> i
        \ <Cmd>call ddu#ui#ff#do_action('openFilterWindow')<CR>
  nnoremap <buffer><silent> q
        \ <Cmd>call ddu#ui#ff#do_action('quit')<CR>
  nnoremap <buffer><silent> p
        \ <Cmd>call ddu#ui#ff#do_action('preview')<CR>
endfunction

autocmd FileType ddu-ff-filter call s:ddu_filter_my_settings()
function! s:ddu_filter_my_settings() abort
  inoremap <buffer><silent> <CR>
  \ <Esc><Cmd>close<CR>
  nnoremap <buffer><silent> <CR>
  \ <Cmd>close<CR>
  nnoremap <buffer><silent> q
  \ <Cmd>close<CR>
endfunction

let g:mapleader = 's'
nnoremap <silent><Leader>b :<C-u>Ddu buffer<CR>
nnoremap <silent><Leader>fn :<C-u>Ddu file -source-param-new -volatile<CR>
nnoremap <silent><Leader>ff :<C-u>Ddu file<CR>
nnoremap <silent><Leader>fr :<C-u>Ddu file_rec<CR>
nnoremap <silent><Leader>r :<C-u>Ddu register<CR>
nnoremap <silent><Leader>m :<C-u>Ddu mr<CR>
" nnoremap <silent><Leader>g :<C-u>Ddu grep<CR>
nnoremap <silent><Leader>fs <Cmd>call ddu#start({})<CR>
nnoremap <silent><Leader>g <Cmd>call ddu#start({
\   'name': 'grep',
\   'sources':[
\     {'name': 'rg', 'params': {'input': expand('<cword>')}}
\   ],
\ })<CR>
