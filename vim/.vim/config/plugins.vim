
let g:deoplete#enable_at_startup = 1

"--------------- NERDTree -----------
let NERDTreeIgnore=['\.pyc$']
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
" Opens on vim <file>, not on vim .
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
map <C-n> :NERDTreeToggle<CR>
" Close vim if last window is NERDtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"--------------- NERDTree Syntax Highlight -----------
" let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeSyntaxDisableDefaultExtensions = 1
let g:NERDTreeDisableExactMatchHighlight = 1
let g:NERDTreeDisablePatternMatchHighlight = 1
let g:NERDTreeSyntaxEnabledExtensions = [
            \ 'c', 'h', 'c++', 'py', 'rb', 'js', 'css', 'sh', 'yaml', 'json']

"--------------- vim-airline -------------
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline#extensions#syntastic#enabled = 0

"--------------- indent-guides -----------
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=53
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=8

"--------------- python-mode ---------------
filetype plugin on
filetype plugin indent on
let g:pymode_virtualenv = 0
let g:pymode_options_max_line_length = 100
" " Folding can cause lag
" " Especially in Python, set the fold to match indent (default is syntax)
let g:pymode_folding = 0
let g:pymode_rope = 0
" " Disable syntax checking with python-mode
let g:pymode_lint = 0

"--------------- NeoMake ---------------
autocmd! BufWritePost * Neomake
let g:neomake_python_enabled_makers = ['pylint']
let g:neomake_error_sign = {'text': '✖', 'texthl': 'ErrorMsg'}
let g:neomake_warning_sign = {
    \   'text': '⚠',
    \   'texthl': 'NeomakeWarningSign',
    \ }
let g:neomake_message_sign = {
    \   'text': '➤',
    \   'texthl': 'NeomakeMessageSign',
    \ }
let g:neomake_info_sign = {'text': 'ℹ', 'texthl': 'NeomakeInfoSign'}

"--------------- vim-cpp-enhanced ---------------
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
" let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
let g:cpp_no_function_highlight = 1

"--------------- vim-ripgrep ---------------
let g:rg_highlight = 1
nnoremap <leader>s :Rg<Space>

"--------------- vim-polyglot ---------------
" let g:polyglot_disabled = ['python']
"
"--------------- vim-gitgutter ---------------
highlight GitGutterAddLine ctermbg=22
highlight GitGutterChangeLine ctermbg=136
highlight GitGutterDelete ctermbg=88
highlight GitGutterChangeDelete ctermbg=136

