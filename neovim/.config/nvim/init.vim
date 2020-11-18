""" Plug-ins
call plug#begin('~/.vim/plugged')
  " QoL
  : Plug 'bling/vim-airline'
  : Plug 'kien/ctrlp.vim'
  : let g:ctrlp_map = '<c-space>'
  : Plug 'airblade/vim-gitgutter'
  : autocmd BufWritePost * GitGutter
  : Plug 'rstacruz/vim-closer'
  : Plug 'tpope/vim-sensible'
  : Plug 'tpope/vim-sleuth'
  : Plug 'tpope/vim-commentary'
  : autocmd FileType cpp,cs,java setlocal commentstring=//\ %s
  : Plug 'tpope/vim-endwise'

  " C++
  : Plug 'rhysd/vim-clang-format'
  : autocmd FileType c,cpp setlocal equalprg="clang-format -i -style=\"{BasedOnStyle: Chromium, IndentWidth: 4}\""
  : autocmd FileType c,cpp ClangFormatAutoEnable
  : Plug 'octol/vim-cpp-enhanced-highlight'

  " Python
  : Plug 'psf/black'
  : autocmd BufWritePre *.py execute ':Black'

  " Advanced
  : Plug 'neomake/neomake'
  : Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  : let g:deoplete#enable_at_startup = 1
  : Plug 'Shougo/neosnippet.vim'
  : Plug 'honza/vim-snippets'
  : Plug 'Shougo/neosnippet.vim'
  : Plug 'Shougo/neosnippet-snippets'
  " Note: It must be "imap" and "smap".  It uses <Plug> mappings.
  : imap <C-k>     <Plug>(neosnippet_expand_or_jump)
  : smap <C-k>     <Plug>(neosnippet_expand_or_jump)
  : xmap <C-k>     <Plug>(neosnippet_expand_target)
call plug#end()
call neomake#configure#automake('w')
""" Key Binds
  " Leader Binds
  : let g:mapleader=','
  " Easier write
  : nmap <leader>w :w!<cr>
  " Easier quit
  : nmap <leader>q :q<cr>
  " Fold With Space 
  : nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
  : vnoremap <Space> zf
  " Changing Buffers
  : nmap <C-P> :bp<CR>
  : nmap <C-N> :bn<CR>
  " Highlight last inserted text 
  : nnoremap gV `[v`]

""" Configurations
  : set number                  " Show line numbers
  : set relativenumber          " Hybrid
  : set wrap                    " Wrap lines - nowrap for no wrap
  : set linebreak               " Break lines at word (requires Wrap lines)
  : set showbreak=\ \ +\        " Wrap-broken line prefix
  : set textwidth=80            " Line wrap (number of cols)
  : set showmatch               " Highlight matching brace
  
  " Scrolling
  : set scrolloff=1
    
  : set ttyfast
  : set mouse=a
  : set hlsearch                " Highlight all search results
  : set smartcase               " Enable smart-case search
  : set ignorecase              " Always case-insensitive
  : set incsearch               " Searches for strings incrementally
    
  : set autoindent              " Auto-indent new lines
  : set expandtab               " Use spaces instead of tabs
  : set shiftwidth=4            " Number of auto-indent spaces
  : set smartindent             " Enable smart-indent
  : set smarttab                " Enable smart-tabs
  : set softtabstop=4           " Number of spaces per Tab
    
  : set foldmethod=marker
    
  : set ruler                   " Show row and column ruler information
    
  : filetype plugin indent on
  : syntax on
    
  : let g:dotvim = '~/.vim'
" ex command for toggling hex mode - define mapping if desired
command -bar Hexmode call ToggleHex()

" helper function to toggle hex mode
function ToggleHex()
  " hex mode should be considered a read-only operation
  " save values for modified and read-only for restoration later,
  " and clear the read-only flag for now
  let l:modified=&mod
  let l:oldreadonly=&readonly
  let &readonly=0
  let l:oldmodifiable=&modifiable
  let &modifiable=1
  if !exists("b:editHex") || !b:editHex
    " save old options
    let b:oldft=&ft
    let b:oldbin=&bin
    " set new options
    setlocal binary " make sure it overrides any textwidth, etc.
    silent :e " this will reload the file without trickeries 
              "(DOS line endings will be shown entirely )
    let &ft="xxd"
    " set status
    let b:editHex=1
    " switch to hex editor
    %!xxd
  else
    " restore old options
    let &ft=b:oldft
    if !b:oldbin
      setlocal nobinary
    endif
    " set status
    let b:editHex=0
    " return to normal editing
    %!xxd -r
  endif
  " restore values for modified and read only state
  let &mod=l:modified
  let &readonly=l:oldreadonly
  let &modifiable=l:oldmodifiable
endfunction
