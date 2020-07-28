" key bind
let mapleader = "\<Space>"

nmap <Leader>f [file]
nnoremap [file]f :Ranger<CR>
nnoremap [file]v :edit ~/.config/nvim/init.vim<CR>
nnoremap [file]r :Ranger<CR>

let g:ranger_command_override = 'ranger --cmd "set show_hidden=true"'
set shell=fish
