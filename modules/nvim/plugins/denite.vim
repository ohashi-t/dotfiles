autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
        \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
        \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
        \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
        \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> <Esc>
        \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
        \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
        \ denite#do_map('toggle_select').'j'
endfunction



call denite#custom#option('default', {
      \ 'split': 'horizontal',
      \ 'highlight_filter_background': 'DeniteFilter',
      \ 'prompt': '> ',
      \ 'start_filter': v:true
      \})



let s:menus = {}

let s:menus.dotfile = {
    \ 'description': 'Edit your dotfile'
    \ }
let s:menus.dotfile.file_candidates = [
    \ ['vimrc', '~/.vimrc'],
    \ ['gvimrc', '~/.gvimrc'],
    \ ['bashrc', '~/.bashrc'],
    \ ['bash_aliases', '~/.bash_aliases'],
    \ ]


let s:menus.my_denites = {
    \ 'description': 'Denite list'
    \ }
let s:menus.my_denites.command_candidates = [
      \    ['file/old', 'Denite file/old'],
      \    ['menu:dotfile', 'Denite menu:dotfile'],
      \    ['grep', 'Denite grep'],
      \]

call denite#custom#var('menu', 'menus', s:menus)


let g:mapleader = 's'
nnoremap <silent> <leader>k :Denite file/rec buffer<CR>
nnoremap <silent> <leader>b :Denite buffer<CR>
nnoremap <silent> <leader>l :Denite line<CR>
nnoremap <silent> <leader>o :Denite outline<CR>
nnoremap <silent> <leader>q :Denite file/old<CR>
nnoremap <silent> <leader>h :Denite command_history<CR>
nnoremap <silent> <leader>g :Denite grep<CR>
nnoremap <silent> <leader>M :Denite menu<CR>
