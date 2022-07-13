" set termguicolors
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" nnoremap <leader>at <cmd>AerialToggle<cr>

lua << EOF

require('options')
require('plugins')

require('aerial').setup({})


EOF
