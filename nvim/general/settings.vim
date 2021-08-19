syntax enable 				    " Syntax color for themes
set hidden                      " Multiple buffers open
set fileencoding=utf-8          " File encoding

" Indent
set tabstop=2                   " Insert 2 spaces with a tab
set shiftwidth=2                " Spaces for indenting
set smarttab                    " Auto-detect 2 or 4 spaces
set expandtab                   " Convert tabs into spaces
set smartindent                 " Makes indenting smart
set autoindent                  " Indent on Save

" Performance
set updatetime=300              " Faster completion
set timeoutlen=300              " By default is 1000 ms
set guifont=FuraCode\ Nerd\ Font\ Mono

" Search
set ignorecase                  " Enable case insensitive search
set smartcase                   " Auto-change case-sensitive search
set hlsearch	                  " Highlight all search results

" Text rendering
set wrap                        " Enable line wrapping
set linebreak                   " Avoid wrapping in the middle of a word
set conceallevel=0              " Show `` in markdown files
set showmatch                   " Show matching brackets

" User interface
set noshowmode                  " Hide cmd status. Already showing it on airline
set number                      " Line numbers
set showtabline=2               " Always show tabs
set relativenumber              " Line number relative to current position
set cursorline                  " Highlight current line
set background=dark             " Optimize VIM to dark background
set t_Co=256                    " Support fr 256 colors
set ruler                       " Always show cursor position
set mouse=a                     " Enable mouse
set title                       " Show current file on window title
"set so=999                      " Cursor on the middle of the screen

" Display line on character limit line
" set colorcolumn=110
" highlight ColorColumn ctermbg=darkgray

set exrc                        " Enable per directory vimrc files
set secure                      " Enable secure mode

" Natural Split
set splitbelow                  " Horizontal splits to below
set splitright                  " Vertical splits to right

" Other
set history=500                " Increase undo limit
set wildmenu
set nobackup                   " COC Recommended
set nowritebackup              " COC Recommender

" Enable filetype plugins
filetype plugin indent on
