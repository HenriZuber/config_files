" set UTF-8 encoding
" reminiz => rc19
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
" disable vi compatibility (emulation of old bugs)
set nocompatible
" use indentation of previous line
set autoindent
" use intelligent indentation for C
set smartindent
" configure tabwidth and insert spaces instead of tabs
set tabstop=4 " tab width is 4 spaces
set expandtab " expand tabs to spaces
set softtabstop=4
set shiftwidth=4 " indent also with 4 spaces
filetype indent on
" Remove useless spaces at the end of the line
autocmd BufWritePre * %s/\s\+$//e
" wrap lines at 120 chars. 80 is somewhat antiquated with nowadays displays.
"set textwidth=120
set colorcolumn=100
" turn syntax highlighting on
set t_Co=256
syntax on
" turn line numbers on
set number
" highlight matching braces
set showmatch
" Highlight current line
set cursorline
" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */
" Highlight search pattern where found
set hlsearch
" Start searching on the first key stroke
set incsearch
" Case sensitive only when capital letters in search
set ignorecase
set smartcase
" Show matches on TAB completion
set wildmenu
"" Disable arrow keys
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
"" Use jk to escape (as it is closer)
inoremap jk <Esc>
" Fold code based on indent
set foldmethod=indent
" Change indentation for html
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
" CPP highlighting for AngelScript files
au BufRead,BufNewFile *.as set filetype=cpp "angelscript"
au BufRead,BufNewFile *.as set filetype=cpp "angelscript"
" HTML filetpye detection with ext (remove problems with templates)
au BufReadPost *.html set filetype=html
" Override s3cfg filetype
au! BufNewFile,BufRead *.s3cfg setf dosini
au! BufNewFile,BufRead env.dist* setf sh
" .<ext>.template should be read as <ext> files
au BufRead,BufNewFile *.ini.template set filetype=dosini
au BufRead,BufNewFile *.yml.template set filetype=yaml

au BufRead,BufNewFile nginx*.conf set filetype=nginx
" Binding for lnext and lprev to jump to errors
map <F3> :lprev <CR>
map <F4> :lnext <CR>

syntax enable
" PostgreSQL syntax by default
let g:sql_type_default = 'pgsql'
autocmd FileType sql setlocal commentstring=--\ %s

" Enable italics
set t_ZH=[3m
set t_ZR=[23m
" Reformat the current file with YAPF
autocmd FileType python nnoremap <leader>y :Black<Cr>
autocmd FileType javascript nnoremap <leader>y ! eslint --fix %<Cr>
" vimdiff params
set diffopt=vertical,filler

colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1
hi MatchParen      ctermfg=7 ctermbg=235  cterm=bold


""" ------------- Pugins ------------------
if has('nvim')
    source ~/.vim/neo.vim
else
    source ~/.vim/plugins.vim
endif
