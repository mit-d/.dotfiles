""" Plug-ins
call plug#begin(stdpath('data') . '/plugged')

Plug 'tanvirtin/monokai.nvim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'rstacruz/vim-closer'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-commentary'
Plug 'sindrets/diffview.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
autocmd FileType cpp,cs,java setlocal commentstring=//\ %s
Plug 'tpope/vim-endwise'
" Python
Plug 'psf/black'
autocmd BufWritePre *.py execute ':Black'

call plug#end()

""" Configure airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" powerline symbols
let g:airline_theme='base16_monokai'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'

""" Don't use a custom colorscheme
lua require('monokai_remastered').setup()
highlight Normal guibg=none
highlight NonText guibg=none
highlight Normal ctermbg=none
highlight NonText ctermbg=none

""" source minimal vim configs
source ~/.vimrc

""" Close diffview before quitting to avoid E21 on non-modifiable buffers
autocmd QuitPre * if &filetype ==# 'DiffviewFiles' || &filetype ==# 'DiffviewFileHistory' | tabclose | endif
