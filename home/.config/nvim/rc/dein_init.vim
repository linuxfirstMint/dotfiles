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


