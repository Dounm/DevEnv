local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

-- Define mappings in which_key.lua
-----Mapping-----
-- local opts = { noremap = true, silent = true }
-- local keymap = vim.api.nvim_set_keymap
--
-- keymap("n", "<leader>ff", '<cmd>Telescope find_files<cr>', opts)
-- keymap("n", "<leader>fg", '<cmd>Telescope live_grep<cr>', opts)
-- keymap("n", "<leader>fb", '<cmd>Telescope buffers<cr>', opts)
-- keymap("n", "<leader>fh", '<cmd>Telescope help_tags<cr>', opts)
-- keymap("n", "<leader>fw", '<cmd>Telescope grep_string<cr>', opts)
-- keymap("n", "<leader>fk", '<cmd>Telescope keymaps<cr>', opts)
-- keymap("n", "<m-p>", '<cmd>Telescope commands<cr>', opts)
--
--
-- keymap("n", "<leader>gc", '<cmd>Telescope git_commits<cr>', opts)
-- keymap("n", "<leader>gs", '<cmd>Telescope git_status<cr>', opts)
-- keymap("n", "<leader>gl", '<cmd>Telescope git_stash<cr>', opts)


-----Conf-----
local actions = require("telescope.actions")

telescope.setup {
  path_display = { "truncate" }, -- hidden tail absolute smart shorten truncate
  dynamic_preview_title = true, -- 动态更改预览窗口的名称 例如:预览窗口可以显示完整的文件名
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    preview = {
      -- filesize_limit:The maximum file size in MB attempted to be previewed.
      -- Set to false to attempt to preview any file size.
      -- Default: 25
      filesize_limit = 5,
      -- timeout:Timeout the previewer if the preview did not
      -- complete within `timeout` milliseconds.
      -- Set to false to not timeout preview.
      -- Default: 250
      timeout = 300,
      treesitter = true,
    },
    history = {
      -- path:The path to the telescope history as string. default: stdpath("data")/telescope_history
      -- path = defaults (~/.local/share/nvim/telescope_history)
      -- limit:   The amount of entries that will be written in the history.
      limit = 100,
    },
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,

        ["<C-f>"] = actions.preview_scrolling_down,
        ["<C-b>"] = actions.preview_scrolling_up,

        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-]>"] = actions.select_vertical,

        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
      },
      n = {
        ["j"] = actions.move_selection_next,
        ["k"] = actions.move_selection_previous,
        ["H"] = actions.move_to_top,
        ["M"] = actions.move_to_middle,
        ["L"] = actions.move_to_bottom,
        ["gg"] = actions.move_to_top,
        ["G"] = actions.move_to_bottom,

        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-]>"] = actions.select_vertical,

        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,

        ["?"] = actions.which_key,
      }
    }
  },
  pickers = {
    grep_string = {
      use_regex = true,
    }

    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}
