set foldmethod=syntax
set nofoldenable

syntax on
set nobackup
set formatoptions=tcqro
set bsdir=buffer
"colorscheme murphy
colors torte

set number
"Use spaces instead of tabs
set expandtab
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set showmatch

set ruler
set incsearch
set nocompatible
set hls
set backspace=indent,eol,start

imap <C-L> <right>
"imap <C-H> <left>
imap <C-J> <down>
imap <C-K> <up>
imap <BackSpace> <left><del>
imap jj <ESC>

inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {<enter>}<ESC>O


inoremap " ""<ESC>i
inoremap ' ''<ESC>i

set fileencodings=utf-8

map <F7> :!g++ %:t -o %:r<Enter>
map <F8> :!./%:r<enter>

"Taglist
filetype on
let Tlist_Exit_OnlyWindow = 2 "when only the taglist window is open, exit vim
let Tlist_Use_Right_Window = 1 "let the taglist window show at the right of the window
let Tlist_WinWidth = 35 "set the width of taglist window, default is 30
nnoremap <silent> <F9> :TlistToggle<cr>

"Doxygen
let g:doxygenToolkit_authorName="Dounm"
let g:doxygenToolkit_funcName="yes"
map <F3>a :DoxAuthor<cr>
map <F3>f :Dox<cr>
map <F3>b :DoxBlock<cr>
map <F3>c 0/** */<Left><Left>
