vim.opt.hidden = true
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.clipboard:append("unnamed")
vim.opt.backspace = "indent,eol,start"
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.laststatus = 2
vim.opt.statusline = "%y"
vim.opt.showmatch = true
vim.opt.wrapscan = true
vim.opt.hlsearch = true
vim.opt.showcmd = true
vim.opt.title = true
vim.opt.relativenumber = true
vim.opt.number = true
-- カーソル移動が重くなるので切った
-- vim.opt.cursorline = false
-- vim.opt.cursorcolumn = false
vim.opt.foldenable = false
vim.opt.swapfile = false
vim.opt.expandtab = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.helplang = "ja"
-- vim.opt.timeoutlen = 10
vim.cmd("hi MatchParen ctermfg=200 ctermbg=0")

-- fzfを<C-c>でキャンセルした際にカレントファイルのパスに戻ってしまうので解除
-- vim.opt.autochdir = false

-- inoremapにしたいけどleximaの<BS>でカッコのペア削除されなかったので
vim.api.nvim_set_keymap('i', '<C-h>', '<BS>', { noremap = true })

-- 以下画面中央の行にフォーカスするための設定集
vim.api.nvim_exec([[
augroup StartAtMiddleLine
  autocmd!
  autocmd VimEnter * normal zz
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
nnoremap Y y$
cnoremap <Esc><Esc> <Esc>
vnoremap <Esc><Esc> <Esc>
inoremap <Esc><Esc> <Esc>
nnoremap <Esc><Esc> :nohlsearch<CR><Esc>
if not vim.fn.has('nvim') then
  nnoremap <C-n> gt
  nnoremap <C-p> gT
end
]], false)

if vim.fn.executable('rg') then
  vim.o.grepprg = 'rg --vimgrep --hidden'
  vim.o.grepformat = '%f:%l:%c:%m'
end

-- grep結果を自動的にquickfixへ出力・表示する
vim.cmd("autocmd QuickFixCmdPost *grep* cwindow")
