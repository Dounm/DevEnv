set foldmethod=syntax
set nofoldenable

syntax on
set nobackup
set formatoptions=tcqro
set bsdir=buffer

colors torte

set number
" Use relative number index
set relativenumber

" Use spaces instead of tabs
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
" imap <C-H> <left>
imap <C-J> <down>
imap <C-K> <up>
imap <BackSpace> <left><del>
imap jj <ESC>

inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {<enter>}<ESC>O

inoremap " ""<ESC>i
inoremap ' ''<ESC>i

" Jump to the end of current line in the insert mode.
" You can jump to the end of current line without switching to normal mode
inoremap <C-e> <C-o>$


"set fileencodings=utf-8
set fileencodings=utf-8,gbk

map <F7> :!g++ %:t -o %:r<Enter>
map <F8> :!./%:r<enter>

" Taglist
filetype on
let Tlist_Exit_OnlyWindow = 2 "when only the taglist window is open, exit vim
let Tlist_Use_Right_Window = 1 "let the taglist window show at the right of the window
let Tlist_WinWidth = 35 "set the width of taglist window, default is 30
nnoremap <silent> <F9> :TlistToggle<cr>

" Doxygen
let g:doxygenToolkit_authorName="Dounm"
let g:doxygenToolkit_funcName="yes"
map <F3>a :DoxAuthor<cr>
map <F3>f :Dox<cr>
map <F3>b :DoxBlock<cr>
map <F3>c 0/** */<Left><Left>

" tComment
    " Usage:
     " gc<option>: toggle for commenting. 
     "    e.g. gc$: comment the postion of cursor to the end of line
     "         gcw: comment current word
     "         gcc: toggle for commenting  current line
     "         gc<count>: toggle for commenting current line and next count line(total count+1 lines)
