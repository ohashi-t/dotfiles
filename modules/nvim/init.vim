set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
" let g:copilot_node_command = '/usr/local/bin/node'
" let g:node_host_prog = '/usr/local/bin/node'

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" required 'make nvim-cache-init'
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  let s:toml_dir  = '~/.config/nvim/toml'

  call dein#load_toml(s:toml_dir . '/ddu_with_depends.toml',      {'lazy': 0})
  call dein#load_toml(s:toml_dir . '/dein.toml',      {'lazy': 0})
  call dein#load_toml(s:toml_dir . '/dein_lazy.toml', {'lazy': 1})

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

inoremap ‘ <Plug>(copilot-next)
inoremap “ <Plug>(copilot-previous)

source ~/.vimrc
source ~/.config/nvim/my_session.vim
