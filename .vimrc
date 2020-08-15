execute pathogen#infect()

" syntax highlighting
syntax on

" auto indent based on file type
filetype plugin indent on 

" use clipboard
set clipboard=unnamedplus 

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" When opening a new line and no file type specific indenting is enabled, keep
" the same indent as the line you're currently on. 
set autoindent

" Use visual bell instead of beeping when doing something wrong
set visualbell

" Display line numbers on the left
set number

" Break on words when wrapping
set linebreak

" Spellcheck
set spell
set spelllang=en,nl

" Indent XML files with gg=G
au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

" Haskell plugin options
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
