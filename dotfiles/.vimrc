
set nofoldenable
set fileencodings=utf-8
" set encoding=utf-8

set foldmethod=indent
set foldlevel=99
" noremap <space> za

"terminal mapHelps
tnoremap jj <C-\><C-n>

"vim-polyglot
set nocompatible
let g:polyglot_disabled = ['markdown']

set nobackup
set formatoptions=tcqro
set bsdir=buffer

filetype plugin on
syntax on

set showcmd
filetype indent on

" Disable Recording, cuz it's very annoying
map q <Nop>

" set number
" set relativenumber

" disable preview window when coding python
" set completeopt-=preview

" highlight tabs and trailing spaces
" set listchars=tab:>-,trail:-
" set list

" Use spaces instead of tabs
" set expandtab
" set autoindent
" set smartindent
" set tabstop=2
" set shiftwidth=2
" set showmatch

" set ruler
" set incsearch
" set hls
" set backspace=indent,eol,start

" set splitbelow
" set splitright
" command Ts :sp | terminal
" command Tv :vs | terminal
" command! -nargs=* T split | terminal <args>
" command! -nargs=* VT vsplit | terminal <args>

let mapleader = "," " the <Leader> in docs, default is \

" auto resize when tmux zoom in/out
if exists('$TMUX')
  au VimResized * wincmd =
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set timeoutlen=300

" map te :tabe
" map tn :tabn<CR>
" map tp :tabp<CR>
" map tc :tabc<CR>

imap <C-L> <right>
" imap <C-H> <left>
imap <C-J> <down>
imap <C-K> <up>
imap <BackSpace> <left><del>
imap jj <ESC>
nnoremap j gj
nnoremap k gk

" inoremap ( ()<ESC>i
" inoremap (( (
" inoremap < <><ESC>i
" inoremap << <<
" inoremap [ []<ESC>i
" inoremap { {}<ESC>i

" inoremap " ""<ESC>i
" inoremap ' ''<ESC>i

" Jump to the end of current line in the insert mode.
" You can jump to the end of current line without switching to normal mode
inoremap <C-e> <C-o>$


" map <F7> :!g++ %:t -o -std=c++11 -Wall %:r<Enter>
" map <F8> :!./%:r<enter>

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
" function! Terminal_MetaMode(mode)
"     set ttimeout
"     if $TMUX != ''
"         set ttimeoutlen=30
"     elseif &ttimeoutlen > 80 || &ttimeoutlen <= 0
"         set ttimeoutlen=80
"     endif
"     if has('nvim') || has('gui_running')
"         return
"     endif
"     function! s:metacode(mode, key)
"         if a:mode == 0
"             exec "set <M-".a:key.">=\e".a:key
"         else
"             exec "set <M-".a:key.">=\e]{0}".a:key."~"
"         endif
"     endfunc
"     for i in range(10)
"         call s:metacode(a:mode, nr2char(char2nr('0') + i))
"     endfor
"     for i in range(26)
"         call s:metacode(a:mode, nr2char(char2nr('a') + i))
"         call s:metacode(a:mode, nr2char(char2nr('A') + i))
"     endfor
"     if a:mode != 0
"         for c in [',', '.', '/', ';', '[', ']', '{', '}']
"             call s:metacode(a:mode, c)
"         endfor
"         for c in ['?', ':', '-', '_']
"             call s:metacode(a:mode, c)
"         endfor
"     else
"         for c in [',', '.', '/', ';', '{', '}']
"             call s:metacode(a:mode, c)
"         endfor
"         for c in ['?', ':', '-', '_']
"             call s:metacode(a:mode, c)
"         endfor
"     endif
" endfunc
"
" call Terminal_MetaMode(0)

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
" Plug 'octol/vim-cpp-enhanced-highlight'
" Plug 'tomasr/molokai'
" Plug 'scrooloose/nerdcommenter'
" Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'ludovicchabant/vim-gutentags'
" Plug 'preservim/nerdtree'
" Plug 'inkarkat/vim-ingo-library'
" depends on vim-ingo-library
" Plug 'inkarkat/vim-mark'
" Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
" Plug 'vim-scripts/a.vim'
" Plug 'kana/vim-textobj-user'
" Plug 'sgur/vim-textobj-parameter'
" Plug 'AndrewRadev/linediff.vim'
" Plug 'tpope/vim-abolish'
" Plug 'Yggdroot/indentLine'
" Plug 'tpope/vim-surround'
" Plug 'sheerun/vim-polyglot'
" Plug 'NLKNguyen/papercolor-theme'
" Plug 'vim-airline/vim-airline'
" Plug 'liuchengxu/vista.vim'
" Plug 'sillybun/vim-repl'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'jackguo380/vim-lsp-cxx-highlight'
" Plug 'tpope/vim-fugitive'
" Plug 'easymotion/vim-easymotion'
" Plug 'luochen1990/rainbow'
" Plug 'skywind3000/asynctasks.vim'
" Plug 'skywind3000/asyncrun.vim'

" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope.nvim'

" Plug 'neovim/nvim-lspconfig'
" Plug 'stevearc/aerial.nvim'
" Plug 'ray-x/lsp_signature.nvim'
call plug#end()

" colorscheme
" set background=dark
" colors molokai
" colors PaperColor

" telescope
" Find files using Telescope command-line sugar.
" nnoremap <leader>ff <cmd>Telescope find_files<cr>
" nnoremap <leader>fg <cmd>Telescope live_grep<cr>
" nnoremap <leader>fb <cmd>Telescope buffers<cr>
" nnoremap <leader>fh <cmd>Telescope help_tags<cr>
" nnoremap <leader>fw <cmd>Telescope grep_string<cr>
" nnoremap <m-p> <cmd>Telescope commands<cr>
" nnoremap <leader>fk <cmd>Telescope keymaps<cr>

" nnoremap <leader>gc <cmd>Telescope git_commits<cr>
" nnoremap <leader>gst <cmd>Telescope git_status<cr>
" nnoremap <leader>gsl <cmd>Telescope git_stash<cr>


" asynctasks & asyncrun
" let g:asyncrun_open=20
" let g:asynctasks_term_pos = 'bottom'
" let g:asynctasks_term_focus = 0
" cnoreabbrev ta AsyncTask
" let g:asynctasks_extra_config = [
"         \ '~/.asynctasks.ini'
"       \ ]

" nerdcommenter
" let g:NERDSpaceDelims = 1
" let g:NERDCompactSexyComs = 1
" let g:NERDDefaultAlign = 'left'

" Taglist
" let Tlist_Exit_OnlyWindow = 1 "when only the taglist window is open, exit vim
" let Tlist_Use_Right_Window = 1 "let the taglist window show at the right of the window
" let Tlist_WinWidth = 35 "set the width of taglist window, default is 30
" nnoremap <silent> <F9> :TlistToggle<cr>

" ctags
" set tags+=./tags;,tags " './tags;' means find tags in cur file dir or dir above recursively
" map <C-N> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
" map <C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
" Ctrl+N : open the def in a new tab
" Ctrl+\ : open the def in a vertical split

" nerd-tree
" let NERDTreeWinPos='left'
" let NERDTreeAutoCenter=1
" let NERDTreeShowLineNumber=1
" map <F6> :NERDTreeToggle<CR>
" " close vim if the only window left is a NERDTree
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"
" " nerdtree-git-plugin
" let g:NERDTreeGitStatusIndicatorMapCustom = {
"     \ "Modified"  : "✹",
"     \ "Staged"    : "✚",
"     \ "Untracked" : "✭",
"     \ "Renamed"   : "➜",
"     \ "Unmerged"  : "═",
"     \ "Deleted"   : "✖",
"     \ "Dirty"     : "✗",
"     \ "Clean"     : "✔︎",
"     \ "Unknown"   : "?"
"     \ }

" echodoc
" set noshowmode " not show current mode, leave space for echodoc
" set cmdheight=2

" vim-mark
" cannot use noremap for Leader
let g:mw_no_mappings = 1
" must be map instead of nmap to support visual mapping
" map <Leader>m <Plug>MarkSet
" nmap <Leader>j <Plug>MarkSearchOrCurNext
" nmap <Leader>k <Plug>MarkSearchOrCurPrev
" nmap <Leader>c <Plug>MarkAllClear<CR>
" nmap n <Plug>MarkSearchAnyOrDefaultNext
" nmap N <Plug>MarkSearchAnyOrDefaultPrev

" vim-matchup
" let g:matchup_matchparen_deferred = 1
" let g:matchup_matchparen_hi_surround_always = 1
"
" "vim-fugitive
" "" support git diff --staged
" command Gd :Gvdiff
" command Gds :Git! diff --staged
" command Gc :Git commit


" Coc Configs, not suitable for residing in Lua

let g:coc_disable_transparent_cursor=1

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction


" use <ctrl-p> to toggle auto-completion
inoremap <silent><expr> <c-p> coc#refresh()
" use <cr>/enter to auto-select first and format
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

inoremap <silent> ,s <C-r>=CocActionAsync('showSignatureHelp')<CR>


" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

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

source ~/.specific_vimrc
