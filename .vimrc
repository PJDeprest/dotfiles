" use clipboard
set clipboard=unnamedplus 

" auto indent based on file type
filetype indent plugin on 

" syntax highlighting
syntax on

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

" Auto indent XML files
au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
