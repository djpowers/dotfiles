-- Telescope find file functions
vim.api.nvim_set_keymap('n', '<leader>ff', [[<cmd>lua require('telescope.builtin').find_files()<CR>]], { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fg', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fb', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fh', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], { noremap = true })

-- Search for string under cursor (find word)
vim.api.nvim_set_keymap('n', '<leader>fw', [[<cmd>lua require('telescope.builtin').grep_string()<CR>]], { noremap = true })

-- Open the previous picker (find resume)
vim.api.nvim_set_keymap('n', '<leader>fr', [[<cmd>lua require('telescope.builtin').resume()<CR>]], { noremap = true })

-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end
telescope.load_extension "file_browser"

vim.api.nvim_set_keymap(
  "n",
  "<leader>fe",
  [[<cmd>lua require "telescope".extensions.file_browser.file_browser()<CR>]],
  { noremap = true }
)
