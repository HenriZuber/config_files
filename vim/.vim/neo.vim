" Check for files to source
runtime! config/**/*.vim

tnoremap jk <C-\><C-n>

set nocompatible

function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release
    else
      !cargo build --release --no-default-features --features json-rpc
    endif
  endif
endfunction

call plug#begin()

Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-css-color'
Plug 'bling/vim-airline',
Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
Plug 'honza/vim-snippets',
Plug 'jremmen/vim-ripgrep'
Plug 'kien/ctrlp.vim',
Plug 'nathanaelkane/vim-indent-guides'
Plug 'neomake/neomake'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'python-mode/python-mode'
Plug 'Raimondi/delimitMate'
Plug 'rust-lang/rust.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' },
Plug 'sheerun/vim-polyglot'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' },
Plug 'SirVer/ultisnips',
Plug 'HerringtonDarkholme/vim-nerdtree-syntax-highlight'
Plug 'tpope/vim-commentary',
Plug 'tpope/vim-fugitive',
Plug 'tpope/vim-surround',
Plug 'zchee/deoplete-jedi',

call plug#end()

