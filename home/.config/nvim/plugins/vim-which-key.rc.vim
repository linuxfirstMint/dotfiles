
set nocompatible

let g:mapleader="\<Space>"
let g:maplocalleader = ',' " ノーマルモード以外で使う
set timeoutlen=100

nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vmap <silent> <localleader> :<c-u>WhichKeyVisual '<,>'<CR>


" Provide commands(ex-command, <Plug>/<C-W>/<C-d> mapping, etc.) and descriptions for existing mappings

let g:which_key_map = {}
let g:which_key_map_visual = {}

let g:which_key_map.0 =
			\{
			\ 'name':"+Test1",
			\ '1' : [':echom "Hello, World"',"Hello world"],
			\}


let g:which_key_map.1 = {
			\ 'name' : '+buffer',
			\ 'c' : [':bd',            'close-buffer']   ,
			\ 'f' : [':bfirst',        'first-buffer']    ,
			\ 'h' : [':History',         'history-buffer']     ,
			\ 'n' : [':bnext',         'next-buffer']     ,
			\ 'p' : [':bprevious',     'previous-buffer'] ,
			\ 'b' : [':Buffers',       'buffer-list-fzf']      ,
			\ }


let g:which_key_map.w = {
			\ 'name': '+window',
			\ 'h':    ['<C-w>h',  'focus-left-window']        ,
			\ 'j':    ['<C-w>j',  'focus-down-window']        ,
			\ 'k':    ['<C-w>k',  'focus-up-window']        ,
			\ 'l':    ['<C-w>l',  'focus-right-window']        ,
			\ 'w':    ['<C-w>w',  'focus-next-window']        ,
			\ 'c':    [':close',  'clode-window']        ,
			\ '-':    [':split',  'Horizontal-split']        ,
			\ '\':    [':vsplit', 'Vertical-split']        ,
			\ }

let g:which_key_map.r = {
			\ 'name' : '+reload' ,
			\ 'v' : [':source ~/.config/nvim/init.vim'    , 'reload-init.vim']        ,
			\ }

let g:which_key_map_visual.f = {
			\ 'name' : '+format' ,
			\ 'f' : [":'<,'>EasyAlign"    , 'code-format']        ,
			\ }


" ガイドをポップアップするためのコマンド
" (プレフィックス,辞書)
call which_key#register('<Space>', "g:which_key_map")
call which_key#register('<,>', "g:which_key_map_visual")
