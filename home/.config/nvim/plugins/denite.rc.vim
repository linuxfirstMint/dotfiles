" key bind
let mapleader = "\<Space>"

nmap <Leader>b [buffer]
nmap <Leader>f [file]
nmap <Leader>d [directory]
nmap <Leader>h [history]

" 【Ctrl + d + a】 カレントディレクトリとバッファを表示
"nnoremap <silent><C-d>a :<C-u>Denite file buffer -split=floating file:new<CR>

""" 【Ctrl + d + b】 バッファを表示
"nnoremap [buffer]b :<C-u>Denite buffer -split=floating file:new<CR>
"
""" 【Ctrl + d + f】 カレントディレクトリを表示
"nnoremap [directory]d :<C-u>Denite file -split=floating file:new<CR>
"
""" 【Ctrl + d + r】 カレントディレクトリ以下を再帰的に表示
"nnoremap [directory]f :<C-u>Denite file/rec -split=floating file:new<CR>
"
"" 【Ctrl + d + g】 カレントディレクトリ以下のファイルから指定した文字列を検索
"nnoremap [file]g :<C-u>Denite grep -buffer-name=search<CR> 
""" 【Ctrl + d + ,】 カレントディレクトリ以下のファイルからカーソル下の文字列を検索
""nnoremap [directory]g :<c-u>denitecursorword grep -buffer-name=search line<cr>
"
"
""" 【Ctrl + d + gs】 grepした結果を再表示
"nnoremap [history]g :<C-u>Denite -resume -buffer-name=search<CR>
"
""" 【Ctrl + d + c】 Neovim内で実行したコマンドを表示
"nnoremap [history]: :<C-u>Denite command_history -split=floating<CR>
"
"
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  " 【Enter】 ファイルを開く
  nnoremap <silent><buffer><expr> <E>
  \ denite#do_map('do_action')
  " 【s】 ウィンドウを水平分割してファイルを開く
  nnoremap <silent><buffer><expr> -
  \ denite#do_map('do_action', 'split')
  " 【v】 ウィンドウを垂直分割してファイルを開く
  nnoremap <silent><buffer><expr> \
  \ denite#do_map('do_action', 'vsplit')
  " 【d】 ファイルを削除する
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  " 【p】 ファイルをプレビュー画面で開く
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  " 【ESC】 / 【q】 denite.nvimを終了する
 nnoremap <silent><buffer><expr> <Esc>
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  " 【/】 ファイル名で検索する
  nnoremap <silent><buffer><expr> /
  \ denite#do_map('open_filter_buffer')
  " 【SPACE】 ファイルを複数選択する
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction
"
autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
  imap <silent><buffer> <C-o> <Plug>(denite_filter_quit)
endfunction
