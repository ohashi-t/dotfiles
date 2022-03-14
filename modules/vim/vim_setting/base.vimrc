set hidden
set encoding=utf-8
set fileencoding=utf-8
set clipboard+=unnamed
set backspace=2
set tabstop=2
set shiftwidth=2
set laststatus=2
set statusline=%y
set showmatch
set wrapscan
set hlsearch
set showcmd
set title
set relativenumber number
set cursorline
set cursorcolumn
set nofoldenable
set noswapfile
set expandtab
set splitbelow
set splitright
set incsearch
set ignorecase
set smartcase
set helplang=ja
set autochdir
"set timeoutlen=10

noremap <Down> <Nop>
noremap <Up> <Nop>
noremap <Right> <Nop>
noremap <Left> <Nop>
inoremap <Down> <Nop>
inoremap <Up> <Nop>
inoremap <Right> <Nop>
inoremap <Left> <Nop>
inoremap <BS> <C-l>

"noremap j gj
"noremap gj j
"noremap k gk
"noremap gk k
"noremap 0 g0
"noremap g0 0
"noremap ^ g^
"noremap g^ ^
"noremap $ g$
"noremap g$ $

"x キー削除でデフォルトレジスタに入れない
nnoremap x "_x
vnoremap x "_x

nnoremap / /\V

cnoremap <Esc><Esc> <Esc>
vnoremap <Esc><Esc> <Esc>
inoremap <Esc><Esc> <Esc>
nnoremap <Esc><Esc> :nohlsearch<CR><Esc>
if !has('nvim')
  nnoremap <C-n> gt
  nnoremap <C-p> gT
endif

if executable('rg')
  let &grepprg = 'rg --vimgrep --hidden'
  set grepformat=%f:%l:%c:%m
endif

augroup KeepLastPosition
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
augroup END

if has('persistent_undo')
  set undodir=~/.config/.vimundo
  set undofile
endif

"grep結果を自動的にquickfixへ出力・表示する
"autocmd QuickFixCmdPost *grep* cwindow
