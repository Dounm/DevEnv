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
