" key bind
let mapleader = "\<Space>"

" チェーン方法

" :command1 <bar> :command2 

"nmap <Leader>r [reload]
"nnoremap [reload]r :edit<CR> 
"nnoremap [reload]v :source ~/.config/nvim/init.vim<CR>

"
nmap <Leader>e [error]
nnoremap [error]e :new <bar> :put =execute('messages')<CR>
nnoremap [error]c :new <bar> :put =execute('checkhealth')<CR>

nmap <Leader>f [file]
nnoremap [file]f :Ranger<CR>
nnoremap [file]v :edit ~/.config/nvim/init.vim<CR>


