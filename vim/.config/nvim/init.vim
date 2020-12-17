""" Plug-ins
call plug#begin('~/.vim/plugged')
  " QoL
  : Plug 'bling/vim-airline'
  ": Plug 'kien/ctrlp.vim'
  ": let g:ctrlp_map = '<c-space>'
  : Plug 'airblade/vim-gitgutter'
  ": autocmd BufWritePost * GitGutter
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
  " Other
  ": Plug 'neomake/neomake'
  ": call neomake#configure#automake('w')
  ": Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  ": let g:deoplete#enable_at_startup = 0
  ": Plug 'Shougo/neosnippet.vim'
  ": Plug 'honza/vim-snippets'
  ": Plug 'Shougo/neosnippet.vim'
  ": Plug 'Shougo/neosnippet-snippets'
  " Note: It must be "imap" and "smap".  It uses <Plug> mappings.
  : imap <C-k>     <Plug>(neosnippet_expand_or_jump)
  : smap <C-k>     <Plug>(neosnippet_expand_or_jump)
  : xmap <C-k>     <Plug>(neosnippet_expand_target)
call plug#end()

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

""" source minimal vim configs
  : so ~/.vimrc

""" Functions
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()
