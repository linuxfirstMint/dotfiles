"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/kou/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/kou/.cache/dein')
  call dein#begin('/home/kou/.cache/dein')

  " Let dein manage dein
  " Required:
  "call dein#add('/home/kou/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')
 " ~~~ ここからtomlファイルを利用するための設定 ~~~
   let s:toml_dir  = '~/.config/nvim/dein' 
   let s:toml      = s:toml_dir . '/dein_package.toml'
   let s:lazy_toml = s:toml_dir . '/dein_lazy.toml'
 
   " tomlファイルをキャッシュしておくための記述
   call dein#load_toml(s:toml,      {'lazy': 0})
   call dein#load_toml(s:lazy_toml, {'lazy': 1})
  " ~~~ tomlのための設定はここまで ~~~

" Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

let g:python3_host_prog = '/usr/bin/python3'

set number

set t_Co=256   " This is may or may not needed.
set background=dark
colorscheme PaperColor

set clipboard+=unnamedplus " クリップボードを使えるようにする
set hidden " 編集中のファイルでもバッファを切り替えられる
set encoding=utf-8 
set tabstop=4
set shiftwidth=4
set incsearch "インクリメントサーチ
set ignorecase "大文字小文字無視
set smartcase "小文字大文字の両方を含む検索の場合、ignorecaseを打ち消す
set fileformats=unix,dos,mac "文字コードの自動認識
set cursorline "カーソル行を強調
set modeline "ファイル特有の設定を有効にする


" key bind
let mapleader = "\<Space>"

" チェーン方法
" :command1 <bar> :command2 

nmap <Leader>r [reload]
nnoremap [reload]r :edit<CR> 
nnoremap [reload]v :source ~/.config/nvim/init.vim<CR>

nmap <Leader>t [toggle]
nnoremap [toggle]t :NERDTreeToggleVCS<CR>

nmap <Leader>w [window]
nnoremap [window]h <C-w>h
nnoremap [window]j <C-w>j
nnoremap [window]k <C-w>k
nnoremap [window]l <C-w>l
nnoremap [window]w <C-w>w
nnoremap [window]- :split<CR>
nnoremap [window]\ :vsplit<CR>
nnoremap [window]d :close<CR>

nmap <Leader>e [error]
"nnoremap [error]e :messages<CR>
nnoremap [error]e :new <bar> :put =execute('messages')<CR>



