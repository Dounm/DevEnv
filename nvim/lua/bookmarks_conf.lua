-- local tele_status_ok, telescope = pcall(require, "telescope")
-- if not tele_status_ok then
--   return
-- end
--
-- telescope.load_extension('vim_bookmarks')
--

local options = {
  bookmark_no_default_key_mappings = 1, -- disable default keymapping "mm, mi", use which_key
  -- bookmark_annotation_sign = "A"
  bookmark_display_annotation = 1, -- disaplay annotation on status line

  bookmark_auto_save = 1,
  -- bookmark_auto_save_file = vim.fn.stdpath("data"), -- ignored when bookmark_save_per_working_dir=1
  -- bookmark_manage_per_buffer = 1, -- save bookmarks when leaving a buffer, load when entering one
  bookmark_save_per_working_dir = 1, -- Save bookmarks per working dir, the folder you opened vim from

  bookmark_highlight_lines = 1,
  -- bookmark_auto_close = 1, -- Automatically close bookmarks split when jumping to a bookmark
}

for k, v in pairs(options) do
  vim.g[k] = v
end
