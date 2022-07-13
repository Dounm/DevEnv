local fn = vim.fn

-- Automatically install packer
-- install into /root/.local/share/nvim/site/pack/packer/start/packer.nvim
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "git@github.com:wbthomason/packer.nvim.git",
    -- "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
-- autocmd BufWritePost plugins.lua source <afile> | PackerSync
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile>
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  git = { clone_timeout = 288, default_url_format = "git@github.com:%s" },
  max_jobs = 50,
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "single" }) -- single rounded
    end,
  },
})

-- Install your plugins here
return packer.startup(function(use)
  use 'wbthomason/packer.nvim' -- Manage itself

  -- My plugins here
  use {
    'nvim-telescope/telescope.nvim',
    config = function() require 'telescope_conf' end,
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  -- Outline
  use {
    'stevearc/aerial.nvim',
    config = function()
      require('aerial').setup();
      require('aerial_conf')
    end,
  }
  use {
    'liuchengxu/vista.vim',
    config = function()
      require('vista_conf')
    end
  }

  -- LSP configs
  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
  use({ "williamboman/nvim-lsp-installer" }) -- simple to use language server installer
  -- No use ?
  use({
    "ray-x/lsp_signature.nvim",
    -- event = "BufRead",
    config = function()
      require("lsp_signature_conf").config()
    end,
  })


  use("kyazdani42/nvim-web-devicons")

  use({ "nvim-lualine/lualine.nvim",
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require 'lualine_conf'
    end })

  use({
    "kyazdani42/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeOpen" },
    config = function()
      require("nvim-tree_conf")
    end,
  })

  use({
    "itchyny/vim-cursorword",
    event = { "BufReadPre", "BufNewFile" },
    -- disable = not builtin.plugins.cursorWord.active,
  })

  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require("treesitter_conf")
    end,
  })

  use({
    "nvim-treesitter/nvim-treesitter-textobjects",
    before = "nvim-treesitter",
  })

  use({
    "p00f/nvim-ts-rainbow",
    after = "nvim-treesitter",
  })
  -- use({
  --   "luochen1990/rainbow",
  --   config = function()
  --     require "rainbow_conf"
  --   end,
  -- }) -- use this rainbow instead of nvim-ts-rainbow

  use({
    "numToStr/Comment.nvim",
    config = function()
      require("comment_conf")
    end,
    event = "BufRead",
  })

  use { 'akinsho/bufferline.nvim',
    tag = "v2.*",
    requires = {
      { 'kyazdani42/nvim-web-devicons' },
      { 'Asheq/close-buffers.vim' },
    },
    config = function()
      require("bufferline_conf")
    end,
  }

  use {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup {}
    end
  }

  use({
    "lukas-reineke/indent-blankline.nvim",
    -- event = "BufRead",
    config = function()
      require("indentline_conf")
    end,
    -- disable = not builtin.plugins.indent_line.active,
  })


  -- Improve startup time for Neovim
  use("lewis6991/impatient.nvim")
  use("nathom/filetype.nvim")
  use("antoinemadec/FixCursorHold.nvim") -- This is needed to fix lsp doc highlight

  -- Store all <leader> commands
  use({
    "folke/which-key.nvim",
    config = function()
      require("whichkey_conf")
    end,
    event = "BufWinEnter",
  })

  -- ToggleTerm, use with whichkey_conf.lua
  use({
    "akinsho/toggleterm.nvim",
    event = "BufWinEnter",
    config = function()
      require("toggleterm_conf")
    end,
  })

  -- Colorschemes
  use({ 'tomasr/molokai' })
  use({ 'NLKNguyen/papercolor-theme' })
  use({ "Leiyi548/monokai.nvim" })

  -- Use coc-snippets insteads!
  -- Snippets
  -- use({
  --   "L3MON4D3/LuaSnip",
  --   after = "nvim-cmp",
  --   config = function()
  --     require("luasnip_conf")
  --   end,
  -- }) --snippet engine
  -- use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

  -- Project, use with telescope
  use({
    "ahmedkhalf/project.nvim", -- ahmedkhalf/project.nvim
    config = function()
      require("project_conf")
    end,
    -- disable = not builtin.plugins.telescope_project,
  })

  -- Bookmarks, use with telescope
  use("MattesGroeger/vim-bookmarks")
  use({ "tom-anders/telescope-vim-bookmarks.nvim",
    config = function()
      require("bookmarks_conf")
    end,
    requires = { { 'MattesGroeger/vim-bookmarks' } }
  })

  -- Coc
  use { 'neoclide/coc.nvim',
    branch = 'release',
    config = function()
      require("coc_conf")
    end,
  }

  -- Miscs
  use({
    "dstein64/vim-startuptime",
    cmd = "Startuptime",
  })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
