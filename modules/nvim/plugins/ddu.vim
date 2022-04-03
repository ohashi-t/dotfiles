call ddu#custom#patch_global({
    \ 'ui': 'ff',
    \ })

call ddu#custom#patch_global({
    \   'kindOptions': {
    \     'file': {
    \       'defaultAction': 'open',
    \     },
    \   }
    \ })

call ddu#custom#patch_global({
    \   'sourceOptions': {
    \     '_': {
    \       'matchers': ['matcher_substring'],
    \     },
    \   }
    \ })

call ddu#custom#patch_global({
    \ 'sources': [{'name': 'file', 'params': {}}],
    \ })

call ddu#custom#patch_local('files', {
    \ 'sources': [
    \   {'name': 'file', 'params': {}},
    \   {'name': 'file_old', 'params': {}},
    \ ],
    \ })

" call ddu#start({'sources': [
"     \ {'name': 'file_rec', 'params': {'path': expand('~')}}
"     \ ]})
