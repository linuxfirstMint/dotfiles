let g:rc_dir = expand('~/.config/nvim/rc')

" rcファイル読み込み関数
function! s:source_rc(rc_file_name)
    let rc_file = expand(g:rc_dir . '/' . a:rc_file_name)
    if filereadable(rc_file)
        execute 'source' rc_file
    endif
endfunction

call s:source_rc('dein_init.vim')
call s:source_rc('keybinds.vim')

set t_Co=256   " This is may or may not needed.
set background=dark
colorscheme PaperColor

set number
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
set smartindent "ノーマルモードからの改行時に自動でインデントを整える"
set noswapfile "swapファイルを作らない

let mapleader="\<Space>"

nmap <Leader>f [file]
nnoremap [file]f :Ranger<CR>
