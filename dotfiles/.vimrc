set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'molokai'
Plugin 'DoxygenToolkit.vim'
Plugin 'taglist.vim'
Plugin 'tcomment'
Plugin 'The-NERD-tree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'Mark'

call vundle#end()
filetype plugin indent on


set foldmethod=syntax
set nofoldenable

syntax on
set nobackup
set formatoptions=tcqro
set bsdir=buffer

colors molokai 

set number
" Use relative number index
set relativenumber

" Use spaces instead of tabs
set expandtab
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set showmatch

set ruler
set incsearch
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

map <F7> :!g++ %:t -o -std=c++11 -Wall %:r<Enter>
map <F8> :!./%:r<enter>

" Taglist
let Tlist_Exit_OnlyWindow = 1 "when only the taglist window is open, exit vim
let Tlist_Use_Right_Window = 1 "let the taglist window show at the right of the window
let Tlist_WinWidth = 35 "set the width of taglist window, default is 30
nnoremap <silent> <F9> :TlistToggle<cr>

" Doxygen
let g:doxygenToolkit_authorName="Chong Niu"
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

" ctags
set tags+=./tags,../tags,../../tags,../../../tags,/home/niuchong/workspace/git/oneflow/oneflow/core/tags

" The-NERD-tree
let NERDTreeWinPos='left'
let NERDTreeAutoCenter=1
let NERDTreeShowLineNumber=1
noremap <F6> :NERDTreeToggle<CR>

" nerdtree-git-plugin
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }
