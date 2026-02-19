" vimrc 1.2 by mit-d
set nocompatible  " Disable Vi compatibility, enabling Vim-specific features
set ttyfast       " Assume
set nonumber norelativenumber
set list listchars=tab:→\ ,trail:·  " Show tabs and trailing whitespace

set mouse=a
set ruler
set wildmenu      " Use a menu for command-line completion
set laststatus=1  " Use a single status line for multiple windows
set autoread      " Automatically reload a file if it changed outside Vim

set wrap
set linebreak     " Break lines at word boundaries
set showbreak=+\
set scrolloff=5   " Keep 5 lines visible above/below cursor when scrolling

set autoindent    " Enable automatic indentation
set shiftwidth=2  " Set width for >> and << commands
set softtabstop=2 " Number of spaces per Tab in insert mode
set expandtab     " Use spaces instead of tabs
set smartindent   " Enable smart indentation
set smarttab      " Insert tabs depending on context

set foldmethod=manual

set hlsearch   " Highlight all search matches
set incsearch  " Show search matches incrementally as you type
set showmatch  " Briefly jump to matching bracket if one is typed
set smartcase  " Override 'ignorecase' if pattern has uppercase letters
set ignorecase " Ignore case in search patterns
set magic      " Use 'magic' in regex (Vim's default regex)

" Default textwidth to 0 (disabled) for all files
set textwidth=0

" Set textwidth for text-like files
augroup TextWidth
  autocmd!
  autocmd FileType text,markdown,md,rst,asciidoc setlocal textwidth=80
  autocmd FileType help,man setlocal textwidth=80
  autocmd FileType gitcommit setlocal textwidth=72
  autocmd BufRead,BufNewFile *.txt,*.md,*.markdown,*.rst setlocal textwidth=80
  autocmd FileType javascript,typescript,python,java,c,cpp,html,css,json,xml setlocal textwidth=0
augroup END

" Set tab-width for shell scripts
augroup ShellWhitespace
  autocmd!
  autocmd FileType sh,bash,zsh setlocal tabstop=2
augroup END

" Enable filetype detection, load indent rules, and plugin support
filetype plugin indent on

set background=dark

" If the file is smaller, enable syntax; otherwise, disable it
let g:max_filesize = 4194304 " ~4MB = 4 * 1024 * 1024
if getfsize(expand('%')) >= 0 && getfsize(expand('%')) < g:max_filesize
  syntax on
else
  syntax off
endif

" Update dotvim location
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

" C-w h/j/k/l falls through to tmux pane when at split edge
if exists('$TMUX')
  function! TmuxMove(direction)
    let wnr = winnr()
    silent! execute 'wincmd ' . a:direction
    if wnr == winnr()
      call system('tmux select-pane -' . tr(a:direction, 'hjkl', 'LDUR'))
    endif
  endfunction
  nnoremap <silent> <C-a>h :call TmuxMove('h')<CR>
  nnoremap <silent> <C-a>j :call TmuxMove('j')<CR>
  nnoremap <silent> <C-a>k :call TmuxMove('k')<CR>
  nnoremap <silent> <C-a>l :call TmuxMove('l')<CR>
endif

" fzf
if isdirectory('/opt/homebrew/opt/fzf')
  set rtp+=/opt/homebrew/opt/fzf
endif
