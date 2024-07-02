" vimrc 1.1 by mit-d
set nocp
set ttyfast
set nonu
set nornu
set nolist
set mouse=a
set ruler
set wmnu
set laststatus=1
set ar

set wrap
set lbr
set sbr=+\ 
set tw=0
set so=5

set ai
set shiftwidth=4
set sts=4
set et
set si
set sta

set fdm=manual

set hlsearch
set is
set sm
set scs
set ic
set magic

filetype plugin indent on
set background=dark
sy off
let g:dotvim = '~/.vim'

" fast :wq!
nno XX ZQ

" Auto close grouping
ino (<CR> (<CR>)<C-c>O
ino {<CR> {<CR>}<C-c>O
ino [<CR> [<CR>]<C-c>O
ino (; ();<ESC>hi
ino {; {};<ESC>hi
ino [; [];<ESC>hi
