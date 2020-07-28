" key bind
let mapleader = "\<Space>"

nmap <Leader>b [buffer]
nnoremap [buffer]h  :bprev<CR>
nnoremap [buffer]l  :bnext<CR>
"nnoremap [buffer]b  :ls<CR> 
nnoremap [buffer]b  :Unite buffer<CR> 
nnoremap [buffer]d  :bdelete<CR>


