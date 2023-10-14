set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
" let g:copilot_node_command = '/usr/local/bin/node'
" let g:node_host_prog = '/usr/local/bin/node'

" 以下の記述が遅いので要修正
" let $CACHE = expand('~/.cache')
" if !($CACHE->isdirectory())
"   call mkdir($CACHE, 'p')
" endif
" if &runtimepath !~# '/dein.vim'
"   let s:dir = 'dein.vim'->fnamemodify(':p')
"   if !(s:dir->isdirectory())
"     let s:dir = $CACHE .. '/dein/repos/github.com/Shougo/dein.vim'
"     if !(s:dir->isdirectory())
"       execute '!git clone https://github.com/Shougo/dein.vim' s:dir
"     endif
"   endif
"   execute 'set runtimepath^='
"     \ .. s:dir->fnamemodify(':p')->substitute('[/\\]$', '', '')
" endif

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  let s:toml_dir  = '~/.config/nvim/toml'

  call dein#load_toml(s:toml_dir . '/ddu_with_depends.toml',      {'lazy': 0})
  call dein#load_toml(s:toml_dir . '/dein.toml',      {'lazy': 0})
  call dein#load_toml(s:toml_dir . '/dein_lazy.toml', {'lazy': 1})

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  " if !has('nvim')
  "   call dein#add('roxma/nvim-yarp')
  "   call dein#add('roxma/vim-hug-neovim-rpc')
  " endif

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
