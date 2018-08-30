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
" Refer: https://www.zhihu.com/question/47691414/answer/373700711

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
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ludovicchabant/vim-gutentags'
Plug 'vim-scripts/Mark'
Plug 'vim-scripts/taglist.vim'
Plug 'w0rp/ale'
Plug 'mhinz/vim-signify'
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
set tags+=./tags;,tags " './tags;' means find tags in cur file dir or dir above recursively

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

" vim-guntenags
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
let g:gutentags_ctags_tagfile = 'tags'
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

" ale
" when work with c/c++, clang cannot found headers properly,
" so we need to export CPATH=the_include_path
let g:ale_linters = { 'cpp': ['cppcheck', 'gcc'] }
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''
