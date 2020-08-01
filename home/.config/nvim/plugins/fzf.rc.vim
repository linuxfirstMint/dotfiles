" key bind
let mapleader = "\<Space>"

nmap <Leader>f [file]
nmap <Leader>l [line]
nmap <Leader>d [directory]
nmap <Leader>h [history]
nmap <Leader>? [help]
"nmap <Leader> [word] 

"   絞り込み画面の位置と大きさ
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

nnoremap [file]/ :FZFFileList<CR>
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
"command! FZFFileList call fzf#run(
"		 \  fzf#wrap({
"         \ 		'source': 'find . -type d -name .git -prune -o ! -name .DS_Store','down': '40%'}))

"nnoremap [word]/ :Rg<CR>


nnoremap [file]h :History<CR>

nnoremap [directory]/ :FZFFileList<CR>
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)


nnoremap [line]/ :Lines<CR>

nnoremap [help]/ :Maps<CR>


" Insert mode completion
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
