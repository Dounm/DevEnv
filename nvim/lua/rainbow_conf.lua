vim.cmd(
  [[
let g:rainbow_active = 1
let g:rainbow_conf = {
\  'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
\  'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\  'operators': '_,_',
\  'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\  'separately': {
\    '*': {},
\    'cmake': 0,
\    'python': {
\       'ctermfgs': ['red', 'yellow', 'green', 'blue'],
\    },
\    'cpp': {
\       'ctermfgs': ['red', 'yellow', 'green', 'blue'],
\       'parentheses': ['start=/(/ end=/)/ fold', 'start=/{/ end=/}/ fold'],
\    },
\    'tex': {
\      'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\    },
\    'lisp': {
\      'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\    },
\    'vim': {
\      'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\    },
\  }
\}
  ]]
)
