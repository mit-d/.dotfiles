" vimrc by mit-d 2021

set nocompatible
set ttyfast
set mouse=a
set autoread
set wildmenu

set nonu
set nornu
set ruler

set nolist
set laststatus=2

set nowrap
set lbr
set showbreak=+\ 
set tw=0
set so=5

set autoindent
set sw=4
set sts=4
set et
set si
set sta

set hls
set is
set sm
set scs
set ic
set magic

filetype plugin indent on
set background=dark
sy off

nno XX ZQ
ino (<CR> (<CR>)<C-c>O
ino {<CR> {<CR>}<C-c>O
ino [<CR> [<CR>]<C-c>O

ino (; ();<ESC>hi
ino {; {};<ESC>hi
ino [; [];<ESC>hi

let mapleader=","

function ClangFormatBuffer()
    let cursor_pos = getpos('.')
    :%!clang-format
    call setpos('.', cursor_pos)
endfunction

nno <leader>f :call ClangFormatBuffer()
nno <leader>W :w !sudo tee %

" other rc files
let g:dotvim = '~/.vim'
runtime git.vim
