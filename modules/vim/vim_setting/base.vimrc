set hidden
set encoding=utf-8
set fileencoding=utf-8
set clipboard+=unnamed
set backspace=indent,eol,start
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
" カーソル移動が重くなるので切った
  " set cursorline
  " set cursorcolumn
set nofoldenable
set noswapfile
set expandtab
set splitbelow
set splitright
set incsearch
set ignorecase
set smartcase
set helplang=ja
"set timeoutlen=500 "短すぎるとprefixが適用出来ない。500位が丁度良い？
hi MatchParen ctermfg=200 ctermbg=0 

" fzfを<C-c>でキャンセルした際にカレントファイルのパスに戻ってしまうので解除
" set autochdir

" inoremapにしたいけどleximaの<BS>でカッコのペア削除されなかったので
imap <C-h> <BS>

" 以下画面中央の行にフォーカスするための設定集
augroup StartAtMiddleLine
  au VimEnter * normal zz
augroup END
nnoremap <C-f> <C-f>M
nnoremap <C-b> <C-b>M
nnoremap <C-d> <C-d>M
nnoremap <C-u> <C-u>M
nnoremap G Gzz
cnoremap <expr> <CR> getcmdtype() == '/' ? '<CR>zz' : '<CR>'
noremap j gjzz
noremap gj jzz
noremap k gkzz
noremap gk kzz
noremap n nzzzv
noremap N Nzzzv

noremap 0 g0
noremap g0 0
noremap ^ g^
noremap g^ ^
noremap $ g$
noremap g$ $

nnoremap x "_x
vnoremap x "_x

nnoremap / /\V

if executable('rg')
  let &grepprg = 'rg --vimgrep --hidden'
  set grepformat=%f:%l:%c:%m
endif

augroup KeepLastPosition
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
augroup END

" if has('persistent_undo')
"   set undodir=~/.config/.vimundo
"   set undofile
" endif

"grep結果を自動的にquickfixへ出力・表示する
"autocmd QuickFixCmdPost *grep* cwindow

"if !has('nvim')
"  nnoremap <C-n> gt
"  nnoremap <C-p> gT
"endif
