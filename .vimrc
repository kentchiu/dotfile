" Use the OS clipboard by default
set clipboard=unnamed,unnamedplus

" Set scrolloff 7 lines to the cursor - when moving vertically using j/k
set scrolloff=7

" the ":substitute" flag 'g' is by default
set gdefault

" print the line number in front of each line
set number

" show the line number relative to the line with the cursor
set relativenumber

" Ignore case when searching
set noignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Show matching brackets when text indicator is over them
set showmatch

" use visual bell instead of beeping
set visualbell
set tm=500


" Don't use Ex mode, use Q for formatting.
map Q gq

" message on the status line to show current mode
set showmode

" show (partial) command in the status bar
set showcmd

let mapleader = " "
inoremap jj <esc>
