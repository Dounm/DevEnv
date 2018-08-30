set nocompatible
set foldmethod=syntax
set nofoldenable
set fileencodings=utf-8

set nobackup
set formatoptions=tcqro
set bsdir=buffer

filetype plugin on
syntax on

set number
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

let mapleader = "," " the <leader> in docs, default is \

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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



map <F7> :!g++ %:t -o -std=c++11 -Wall %:r<Enter>
map <F8> :!./%:r<enter>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" install vim-plug if need
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" vim-plug plugins
call plug#begin('~/.vim/plugged')
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'tomasr/molokai'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-scripts/Mark'
Plug 'vim-scripts/taglist.vim'
call plug#end()

" molokai
colors molokai 

" nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'

" Taglist
let Tlist_Exit_OnlyWindow = 1 "when only the taglist window is open, exit vim
let Tlist_Use_Right_Window = 1 "let the taglist window show at the right of the window
let Tlist_WinWidth = 35 "set the width of taglist window, default is 30
nnoremap <silent> <F9> :TlistToggle<cr>

" ctags
set tags+=./tags,../tags,../../tags,../../../tags,/home/niuchong/workspace/git/oneflow/oneflow/core/tags

" nerd-tree
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
