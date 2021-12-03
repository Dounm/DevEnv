
set nofoldenable
set fileencodings=utf-8
set encoding=utf-8

set foldmethod=indent
set foldlevel=99
noremap <space> za

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
" Plug 'ludovicchabant/vim-gutentags'
Plug 'preservim/nerdtree'
Plug 'inkarkat/vim-ingo-library'
" depends on vim-ingo-library
Plug 'inkarkat/vim-mark'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'vim-scripts/a.vim'
Plug 'kana/vim-textobj-user'
Plug 'sgur/vim-textobj-parameter'
Plug 'AndrewRadev/linediff.vim'
Plug 'tpope/vim-abolish'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-surround'
Plug 'sheerun/vim-polyglot'
Plug 'NLKNguyen/papercolor-theme'
Plug 'vim-airline/vim-airline'
Plug 'liuchengxu/vista.vim'
Plug 'sillybun/vim-repl'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'tpope/vim-fugitive'
call plug#end()

" colorscheme
set background=dark
colors molokai
" colors PaperColor

" nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'

" Taglist
" let Tlist_Exit_OnlyWindow = 1 "when only the taglist window is open, exit vim
" let Tlist_Use_Right_Window = 1 "let the taglist window show at the right of the window
" let Tlist_WinWidth = 35 "set the width of taglist window, default is 30
" nnoremap <silent> <F9> :TlistToggle<cr>

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

" vim-mark
" cannot use noremap for Leader
let g:mw_no_mappings = 1
" must be map instead of nmap to support visual mapping
map <Leader>m <Plug>MarkSet
nmap <Leader>j <Plug>MarkSearchOrCurNext
nmap <Leader>k <Plug>MarkSearchOrCurPrev
nmap <Leader>c <Plug>MarkAllClear<CR>
" nmap n <Plug>MarkSearchAnyOrDefaultNext
" nmap N <Plug>MarkSearchAnyOrDefaultPrev

" vim-matchup
" let g:matchup_matchparen_deferred = 1
" let g:matchup_matchparen_hi_surround_always = 1

" vim-indentLine
" :IndentLinesToggle


" vista.vim
nmap <Leader>v :Vista<CR>
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'coc'
let g:vista_sidebar_width=50
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }

"vim-fugitive
"" support git diff --staged
command Gd :Gvdiff
command Gds :Git! diff --staged


" vim-repl
let g:repl_program = {
            \   'python': 'ipython',
            \   'default': 'zsh',
            \   'r': 'R',
            \   'lua': 'lua',
            \   }
let g:repl_predefine_python = {
            \   'numpy': 'import numpy as np',
            \   'matplotlib': 'from matplotlib import pyplot as plt'
            \   }
let g:repl_cursor_down = 1
let g:repl_python_automerge = 1
let g:repl_ipython_version = '7'
nnoremap <leader>r :REPLToggle<Cr>
autocmd Filetype python nnoremap <F12> <Esc>:REPLDebugStopAtCurrentLine<Cr>
autocmd Filetype python nnoremap <F10> <Esc>:REPLPDBN<Cr>
autocmd Filetype python nnoremap <F11> <Esc>:REPLPDBS<Cr>
let g:repl_position = 3
let g:sendtorepl_invoke_key = "<leader>t"
let g:repl_stayatrepl_when_open = 0



" ==========================
" Coc.nvim
# :CocInstall coc-json coc-tsserver coc-yank coc-tabnine coc-sh coc-highligh coc-git coc-diagnostic coc-clang-format-style-options coc-xml coc-tabnine coc-jedi coc-clangd
set hidden
set nowritebackup
set updatetime=300
set shortmess+=c
set signcolumn=number
let g:coc_disable_transparent_cursor=1
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" nmap <silent> go <Plug>(coc-definition)
nnoremap <silent> go :call CocAction('jumpDefinition', v:false)<CR>
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap for rename current word
"nmap <leader>rn <Plug>(coc-rename)
command Rename :execute "normal \<Plug>(coc-rename)"

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)
" Use `:FFormat` to format the whole file
command! -nargs=0 Format :call CocAction('format')

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" coc-yank
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source ~/.specific_vimrc
