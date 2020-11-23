
set nofoldenable
set fileencodings=utf-8
set encoding=utf-8

set nobackup
set formatoptions=tcqro
set bsdir=buffer

filetype plugin on
syntax on

set showcmd
filetype indent on

set number
set relativenumber

" disable preview window when coding python
set completeopt-=preview

" highlight tabs and trailing spaces
set listchars=tab:>-,trail:-
set list

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

let mapleader = "," " the <Leader> in docs, default is \

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set timeoutlen=300

map te :tabe
map tn :tabn<CR>
map tp :tabp<CR>
map tc :tabc<CR>

imap <C-L> <right>
" imap <C-H> <left>
imap <C-J> <down>
imap <C-K> <up>
imap <BackSpace> <left><del>
imap jj <ESC>

inoremap ( ()<ESC>i
inoremap (( (
inoremap < <><ESC>i
inoremap << <<
inoremap [ []<ESC>i
inoremap { {}<ESC>i

inoremap " ""<ESC>i
inoremap ' ''<ESC>i

" Jump to the end of current line in the insert mode.
" You can jump to the end of current line without switching to normal mode
inoremap <C-e> <C-o>$


map <F7> :!g++ %:t -o -std=c++11 -Wall %:r<Enter>
map <F8> :!./%:r<enter>

if has("autocmd")
  augroup templates
    autocmd BufNewFile *.py 0r ~/.vim/templates/skeleton.py
    autocmd BufNewFile *.sh 0r ~/.vim/templates/skeleton.sh
  augroup END
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Refer: http://www.skywind.me/blog/archives/2021
" enable ALT key in vim
" just like Ctrl as 'c-' in vimrc, Alt is as 'm-'
function! Terminal_MetaMode(mode)
    set ttimeout
    if $TMUX != ''
        set ttimeoutlen=30
    elseif &ttimeoutlen > 80 || &ttimeoutlen <= 0
        set ttimeoutlen=80
    endif
    if has('nvim') || has('gui_running')
        return
    endif
    function! s:metacode(mode, key)
        if a:mode == 0
            exec "set <M-".a:key.">=\e".a:key
        else
            exec "set <M-".a:key.">=\e]{0}".a:key."~"
        endif
    endfunc
    for i in range(10)
        call s:metacode(a:mode, nr2char(char2nr('0') + i))
    endfor
    for i in range(26)
        call s:metacode(a:mode, nr2char(char2nr('a') + i))
        call s:metacode(a:mode, nr2char(char2nr('A') + i))
    endfor
    if a:mode != 0
        for c in [',', '.', '/', ';', '[', ']', '{', '}']
            call s:metacode(a:mode, c)
        endfor
        for c in ['?', ':', '-', '_']
            call s:metacode(a:mode, c)
        endfor
    else
        for c in [',', '.', '/', ';', '{', '}']
            call s:metacode(a:mode, c)
        endfor
        for c in ['?', ':', '-', '_']
            call s:metacode(a:mode, c)
        endfor
    endif
endfunc

call Terminal_MetaMode(0)

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
Plug 'scrooloose/nerdcommenter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ludovicchabant/vim-gutentags'
Plug 'preservim/nerdtree'
Plug 'vim-scripts/Mark--Karkat'
Plug 'dense-analysis/ale'
Plug 'mhinz/vim-signify'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'vim-scripts/a.vim'
Plug 'kana/vim-textobj-user'
Plug 'sgur/vim-textobj-parameter'
" Plug 'ycm-core/YouCompleteMe'
" Plug 'Shougo/echodoc.vim'
Plug 'AndrewRadev/linediff.vim'
Plug 'tpope/vim-abolish'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-surround'
" Plug 'andymass/vim-matchup'
Plug 'zxqfl/tabnine-vim'
Plug 'rhysd/vim-clang-format'
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
map <C-N> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
" Ctrl+N : open the def in a new tab
" Ctrl+\ : open the def in a vertical split

" nerd-tree
let NERDTreeWinPos='left'
let NERDTreeAutoCenter=1
let NERDTreeShowLineNumber=1
map <F6> :NERDTreeToggle<CR>
" close vim if the only window left is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" nerdtree-git-plugin
let g:NERDTreeGitStatusIndicatorMapCustom = {
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
let g:ale_linters_explicit = 1
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

" echodoc
" set noshowmode " not show current mode, leave space for echodoc
set cmdheight=2

" LeaderF
noremap <m-p> :LeaderfFunction<cr>
noremap <leader>g :LeaderfMru<cr>
let g:Lf_WindowHeight = 0.30
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = { 'Function': 0 }
let g:Lf_UseVersionControlTool = 0
let g:Lf_DefaultExternalTool = 'rg'
" search word under cursor, the pattern is treated as regex
noremap <leader>w :<C-U><C-R>=printf("Leaderf rg -e '%s' ", expand("<cword>"))<CR>
" search word under cursor literally only in current buffer
noremap <leader>wb :<C-U><C-R>=printf("Leaderf rg -F --current-buffer -e '%s' ", expand("<cword>"))<CR>
" search visually selected text literally, don't quit LeaderF after accepting an entry
xnoremap <leader>v :<C-U><C-R>=printf("Leaderf rg -F --stayOpen -e %s ", leaderf#Rg#visual())<CR>
" search visually selected text literally, don't quit LeaderF after accepting an entry
xnoremap <leader>vb :<C-U><C-R>=printf("Leaderf rg -F --current-buffer --stayOpen -e %s ", leaderf#Rg#visual())<CR>
" recall last search. If the result window is closed, reopen it.
noremap <leader>h :<C-U>Leaderf rg --stayOpen --recall<CR>

" vim-clang-format
let g:clang_format#command = 'clang-format-4.0'

" YouCompleteMe
" Refer: https://zhuanlan.zhihu.com/p/33046090
" let g:ycm_add_preview_to_completeopt = 0
" let g:ycm_show_diagnostics_ui = 0
" let g:ycm_server_log_level = 'info'
" let g:ycm_min_num_of_chars_for_completion = 99
" let g:ycm_min_num_identifier_candidate_chars = 5
" let g:ycm_collect_identifiers_from_comments_and_strings = 1
" let g:ycm_complete_in_strings=1
" let g:ycm_key_invoke_completion = '<c-z>'
" set completeopt=menu,menuone

" let g:ycm_semantic_triggers =  {
"     \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
"     \ 'cs,lua,javascript': ['re!\w{2}'],
"     \ }
" let g:ycm_filetype_whitelist = {
"     \ "c":1,
"     \ "objc":1,
"     \ "sh":1,
"     \ "zsh":1,
"     \ "zimbu":1,
" \ }

" Mark
" cannot use noremap for Leader
nmap <Leader>j <Leader>*
nmap <Leader>k <Leader>#
nmap <Leader>c :MarkClear<CR>

" vim-matchup
" let g:matchup_matchparen_deferred = 1
" let g:matchup_matchparen_hi_surround_always = 1

" vim-indentLine
" :IndentLinesToggle

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source ~/.specific_vimrc
