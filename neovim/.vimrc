" vimrc 1.0 by mit-d
set nocp
set ttyfast
set nu
set rnu
set list
set mouse=a
set ru "ruler"
set wmnu "wildmenu"
set ls=2 "laststatus"
set ar "autoread"

set nowrap
set lbr "linebreak"
set sbr=(+)
set tw=80 "textwidth"
set so=5 "scrolloff"

set ai "autoindent"
set shiftwidth=4
set sts=4 "softtabstop"
set et "expandtab"
set si "smartindent"
set sta "smarttab"

set fdm=indent "foldmethod"

set hls "hlsearch"
set is "incsearch"
set sm "showmatch"
set scs "smartcase"
set ic "ignorecase"
set magic

filetype plugin indent on
syntax on
let g:dotvim = '~/.vim'
