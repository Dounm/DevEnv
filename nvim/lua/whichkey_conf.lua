local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local setup = {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  -- operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  window = {
    border = "single", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 20,
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

local opts = {
}

local n_mappings = {
  -- no prefix mapping
  ["/"] = { "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", " Comment" },
  -- ["h"] = { "<cmd>nohl<cr>", "Highlight" },
  -- ["H"] = { "<cmd>TSHighlightCapturesUnderCursor<cr>", "Ts Highlight" },

  ["e"] = { "<cmd>NvimTreeToggle<cr>", " Explorer" },
  ["o"] = { "<cmd>AerialToggle<cr>", " Outline" },
  ["v"] = { "<cmd>Vista!!<cr>", " Vista Outline" },

  ["T"] = { "<cmd>Twilight<cr>", "Focus on current code" },
  ["z"] = { "za", "Toggle Fold" },

  ["x"] = { "<cmd>x!<cr>", " Save" },
  ["q"] = { "<cmd>cclose<cr>", "Close Quickfix" },
  -- ["S"] = { "<cmd>Startify<cr>", "舘Startify" },
  -- ["z"] = { "<cmd>ZenMode<cr>", " ZenMode" },
  -- Whichkey-p
  p = {
    name = " Packer",
    C = { "<cmd>PackerClean<cr>", "Clean" },
    c = { "<cmd>PackerCompile<cr>", "Compile" },
    i = { "<cmd>PackerInstall<cr>", "Install" },
    s = { "<cmd>PackerSync<cr>", "Sync" },
    S = { "<cmd>PackerStatus<cr>", "Status" },
    u = { "<cmd>PackerUpdate<cr>", "Update" },
  },

  h = {
    name = "Highlight",
    s = { "<cmd>Hi +<cr>", "Highlight cur word" },
    e = { "<cmd>Hi -<cr>", "Erase cur word" },
    C = { "<cmd>Hi Clear<cr>", "Clear All Highlight" },
    p = { "<cmd>Hi<<cr>", "Jump to Pre highlight of current" },
    n = { "<cmd>Hi><cr>", "Jump to Next highlight of current" },
    P = { "<cmd>Hi{<cr>", "Jump to Pre highlight of all" },
    N = { "<cmd>Hi}<cr>", "Jump to Next highlight of all" },
    S = { "<cmd>Hi save ./.highlights<cr>", "Store to ./.highlights" },
    L = { "<cmd>Hi load ./.highlights<cr>", "Load from ./.highlights" },
  },

  -- Whichkey-F
  -- F = {
  --   name = " Custom Find",
  --   f = { "<cmd>lua require('fancy_telescope_conf').curbuf()<cr>", "Current Buffer" },
  --   g = { "<cmd>lua require('fancy_telescope_conf').git_files()<cr>", "Git Files" },
  --   s = { "<cmd>lua require('fancy_telescope_conf').git_status()<cr>", "Git Status" },
  -- },
  -- Whichkey-f
  f = {
    name = " Find",
    B = { "<cmd>lua require('fancy_telescope_conf').builtin()<cr>", "Builtin" },
    -- s = { "<cmd>lua require('fancy_telescope_conf').git_status()<cr>", "Git Status" },
    e = { "<cmd>Telescope file_browser<cr>", "File_browser" },
    d = { "<cmd>lua require('fancy_telescope_conf').findDotfile()<cr>", "Dotfiles" },
    f = { "<cmd>Telescope find_files<cr>", "Files" },
    g = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
    w = { "<cmd>Telescope grep_string<cr>", "Grep Cur Word" },
    c = { "<cmd>Telescope commands<cr>", "Commands" },
    C = { "<cmd>lua require('fancy_telescope_conf').colorscheme()<cr>", " Colorschemes" },
    p = { "<cmd>Telescope projects<cr>", "Project" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    H = { "<cmd>Telescope highlights<cr>", "Highlight" },
    h = { "<cmd>Telescope help_tags<cr>", "Helps" },
    S = { "<cmd>Telescope search_history<cr>", "Search History" },
    -- N = { "<cmd>Telescope notify<cr>", "View notify" },
    r = {
      "<cmd>lua require'telescope.builtin'.oldfiles()<cr>",
      "Recent File",
    },
    j = {
      "<cmd>lua require'telescope.builtin'.jumplist(require('telescope.themes').get_dropdown({}))<cr>",
      "Jumplist",
    },
    R = { "<cmd>Telescope registers<cr>", "Registers" },
    m = {
      "<cmd>lua require'telescope.builtin'.marks(require('telescope.themes').get_dropdown({}))<cr>",
      "Marks",
    },
    -- n = {
    --   "<cmd>lua require('fancy_telescope_conf').find_notes()<cr>",
    --   "Notes",
    -- },
    -- b = { "<cmd>Telescope vim_bookmarks all<cr>", "All Bookmarks" },
    -- b = { "<cmd>Telescope vim_bookmarks current_file<cr>", "Bookmarks of Cur File" },
  },

  -- Whichkey-b
  b = {
    name = "﩯Buffer",
    ["1"] = { "<Cmd>BufferLineGoToBuffer 1<CR>", "goto 1" },
    ["2"] = { "<Cmd>BufferLineGoToBuffer 2<CR>", "goto 2" },
    ["3"] = { "<Cmd>BufferLineGoToBuffer 3<CR>", "goto 3" },
    ["4"] = { "<Cmd>BufferLineGoToBuffer 4<CR>", "goto 4" },
    ["5"] = { "<Cmd>BufferLineGoToBuffer 5<CR>", "goto 5" },
    ["6"] = { "<Cmd>BufferLineGoToBuffer 6<CR>", "goto 6" },
    ["7"] = { "<Cmd>BufferLineGoToBuffer 7<CR>", "goto 7" },
    ["8"] = { "<Cmd>BufferLineGoToBuffer 8<CR>", "goto 8" },
    ["9"] = { "<Cmd>BufferLineGoToBuffer 9<CR>", "goto 9" },
    f = { "<cmd>lua require('fancy_telescope_conf').findBuffer()<cr>", "Find" },
    d = { "<cmd>Bdelete this<cr>", "Delete current" },
    C = { "<cmd>Bdelete other<cr>", "Clear other buffer" },
    c = { "<Cmd>BufferLinePickClose<CR>", "delete pick buffer" },
    p = { "<Cmd>BufferLinePick<CR>", "pick buffer" },
    l = { "<cmd>BufferLineCloseLeft<cr>", "Close left buffer" },
    r = { "<cmd>BufferLineCloseRight<cr>", "Close right buffer" },
    v = { "<cmd>lua require('vscode').change_style('light')<cr>", "Light theme" },
    -- l = { "<cmd>Telescope buffers<cr>", "Buffers" },
  },
  -- Whichkey-r
  r = {
    name = " Run",
    -- a = { "<cmd>RnvimrToggle<cr>", "Ranger" },
    r = { "<cmd>AsyncTask file-run<cr>", "Run on Terminal" },
    n = { "Rename file" },
    f = { "<cmd>AsyncTask file-run-floaterm<cr>", "Run on floaterm" },
  },

  -- Whichkey-g
  g = {
    name = " Git",
    -- g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", " Lazygit" },
    -- n = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", " Next Hunk" },
    -- p = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", " Prev Hunk" },
    -- l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", " Blame" },
    -- p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", " Preview Hunk" },
    -- r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", " Reset Hunk" },
    -- R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", " Reset Buffer" },
    -- S = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", " Stage Hunk" },
    -- u = {
    --   "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
    --   " Undo Stage Hunk",
    -- },
    -- d = {
    --   "<cmd>Gitsigns diffthis HEAD<cr>",
    --   "Diff",
    -- },
    s = { "<cmd>Telescope git_status<cr>", " Git Status" },
    b = { "<cmd>Telescope git_branches<cr>", " Branchs" },
    c = { "<cmd>Telescope git_commits<cr>", " Commits" },
    p = { "<Plug>(coc-git-prevchunk)", "Pre Chunk" },
    n = { "<Plug>(coc-git-nextchunk)", "Next Chunk" },
  },

  -- Whichkey-l
  l = {
    name = "  LSP",
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "  Code Action" },
    d = {
      "<cmd>Telescope lsp_document_diagnostics<cr>",
      "  Document Diagnostics",
    },
    w = {
      "<cmd>Telescope lsp_workspace_diagnostics<cr>",
      "  Workspace Diagnostics",
    },
    f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "  Format" },
    -- i = { "<cmd>LspInfo<cr>", "  Info" },
    I = { "<cmd>LspInstallInfo<cr>", "  Install Info" },
    i = { "<cmd>LspInfo<cr>", "  Info" },
    j = {
      "<cmd>lua vim.diagnostic.goto_next()<cr>",
      " Next Diagnostic",
    },
    k = {
      "<cmd>lua vim.diagnostic.goto_prev()<cr>",
      " Prev Diagnostic",
    },
    l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "  CodeLens Action" },
    q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "  Quickfix" },
    r = { name = "Rename" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "  Document Symbols" },
    S = {
      "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
      "  Workspace Symbols",
    },
  },

  -- whichkey -d
  d = {
    name = " Debug",
    t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
    b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
    c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
    C = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run To Cursor" },
    d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
    g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
    i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
    o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
    u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
    p = { "<cmd>lua require'dap'.pause.toggle()<cr>", "Pause" },
    r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
    s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
    q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
  },
  -- Whichkey-s
  -- s = {
  --   name = " Search",
  --   b = { "<cmd>Telescope git_branches<cr>", " Checkout branch" },
  --   h = { "<cmd>Telescope help_tags<cr>", " Help" },
  --   M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
  --   t = { "<cmd>TodoQuickFix<cr>", "Todo" },
  --   r = { "<cmd>Telescope registers<cr>", "Registers" },
  --   k = { "<cmd>Telescope keymaps<cr>", " Keymaps" },
  --   c = { "<cmd>lua require('fancy_telescope_conf').colorscheme()<cr>", " Colorschemes" },
  --   C = { "<cmd>Telescope commands<cr>", "Commands" },
  -- },

  -- Whichkey-t
  t = {
    name = " Terminal",
    n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
    p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
    g = { "<cmd>lua _GOTOP_TOGGLE()<CR>", "gotop" },
    f = { "<cmd>ToggleTerm direction=float<cr>", " Float" },
    h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", " Horizontal" },
    v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", " Vertical" },
    t = { "<cmd>ToggleTerm direction=tab<cr>", "New Tab" },
  },

  -- WhichKey-c
  c = {
    name = "Coc",
    e = { "<cmd>CocList extensions<cr>", "Extensions" },
    c = { "<cmd>CocList commands<cr>", "Commands" },
    s = { "<cmd>CocList -I symbols<cr>", "Symbols" },
    D = { "<cmd>CocList diagnostics<cr>", "Diagnostics" },
    j = { "<cmd>CocNext<cr>", "CocNext" },
    k = { "<cmd>CocPrev<cr>", "CocPrev" },
    r = { "<cmd>CocListResume<cr>", "List Resume" },
    y = { "<cmd>CocList -A --normal yank <cr>", "Yanks" },
    R = { "<Plug>(coc-rename)", "Rename" }, -- break lualine ?
    -- R = { "<cmd>call CocActionAsync('rename')<cr>", "Rename" },

    C = { "<cmd>CocConfig<cr>", "Open Configs" },
    L = { "<cmd>CocLocalConfig<cr>", "Open Local Configs" },
  },

  -- whichkey-i
  i = {
    name = " Insert",
    -- i = { "<cmd>PasteImg<cr>", "PasteImg" },
    s = {
      "<cmd>lua require('telescope').extensions.luasnip.luasnip(require('telescope.themes').get_cursor({}))<cr>",
      "Snippet",
    },
    -- m = { "<cmd>PasteImg<cr>", "Image" },
  },

  m = {
    name = "BookMarks",
    m = { "<Plug>BookmarkToggle", "Toggle Mark" },
    a = { "<Plug>BookMarkAnnotate", "Insert Annotations" },
    n = { "<Plug>BookmarkNext", "Next Bookmark" },
    p = { "<Plug>BookmarkPrev", "Prev Bookmark" },
    l = { "<Plug>BookmarkShowAll", "Show All Bookmarks" },
    C = { "<Plug>BookmarkClearAll", "Clear All Bookmarks" },
    -- c = { "<Plug>BookmarkClear", "Clear Cur Bookmark" },
    -- s = { "<Plug>BookmarkSave ./.bookmarks ", "Save All Bookmarks" },
    -- l = { "<Plug>BookmarkLoad ./.bookmarks ", "Load All Bookmarks" },
  },

}

which_key.setup(setup)
which_key.register(n_mappings, {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
})

local v_mappings = {
  h = {
    name = "Highlight",
    s = { "HiSet", "Highlight cur word" },
    e = { "<cmd>Hi -x<cr>", "Erase cur word" },
  }
}

which_key.register(v_mappings, {
  mode = "v", -- Visual mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
})

local move_mappings = {
  -- m = {
  -- name = "Move&Jump",
  w = { "<cmd>HopWord<cr>", "Jump to word" },
  W = { "<cmd>HopWordMW<cr>", "Jump to word in multi window" },
  c = { "<cmd>HopChar1<cr>", "Jump to char" },
  C = { "<cmd>HopChar1MW<cr>", "Jump to char in multi window" },
  p = { "<cmd>HopPattern<cr>", "Jump to pattern" },
  P = { "<cmd>HopPatternMW<cr>", "Jump to pattern in multi window" },
  l = { "<cmd>HopLineStart<cr>", "Jump to line" },
  L = { "<cmd>HopLineStartMW<cr>", "Jump to line in multi window" },
  -- },
}

which_key.register(move_mappings, {
  mode = "n",
  prefix = "m",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
})
