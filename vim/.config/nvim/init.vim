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

""" :MarkdownFormat - run prettier + markdownlint-cli2 --fix on current file
function! MarkdownFormat()
  if &filetype !=# 'markdown'
    echohl WarningMsg | echo 'MarkdownFormat: not a markdown file' | echohl None
    return
  endif

  let l:has_prettier = executable('prettier')
  let l:has_mdlint = executable('markdownlint-cli2')

  if !l:has_prettier && !l:has_mdlint
    echohl ErrorMsg | echo 'MarkdownFormat: neither prettier nor markdownlint-cli2 found' | echohl None
    return
  endif

  update
  let l:file = expand('%:p')
  let l:ran = []

  if l:has_prettier
    call system('prettier -w --prose-wrap always --print-width 80 ' . shellescape(l:file))
    call add(l:ran, 'prettier')
  else
    echohl WarningMsg | echo 'MarkdownFormat: prettier not found, skipping' | echohl None
  endif

  if l:has_mdlint
    call system('markdownlint-cli2 --fix ' . shellescape(l:file))
    call add(l:ran, 'markdownlint-cli2')
  else
    echohl WarningMsg | echo 'MarkdownFormat: markdownlint-cli2 not found, skipping' | echohl None
  endif

  edit!
  echo 'MarkdownFormat: ran ' . join(l:ran, ' + ')
endfunction
command! MarkdownFormat call MarkdownFormat()
