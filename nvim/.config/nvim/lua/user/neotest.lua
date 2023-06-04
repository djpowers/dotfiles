  -- Setup neotest
  local status_ok, neotest = pcall(require, "neotest")
  if not status_ok then
    return
  end

  local status_ok_test, neotest_rspec = pcall(require, "neotest-rspec")
  if not status_ok_test then
    return
  end

  neotest.setup({
    adapters = {
      neotest_rspec
    }
  })

-- Run the nearest test
vim.api.nvim_set_keymap('n', 'tn', [[<cmd>lua require("neotest").run.run()<CR>]], { noremap = true })
-- Run the current file
vim.api.nvim_set_keymap('n', 'tf', [[<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<CR>]], { noremap = true })
-- Run full suite (all)
vim.api.nvim_set_keymap('n', 'ta', [[<cmd>lua require('neotest').run.run(vim.fn.getcwd())<CR>]], { noremap = true })
-- Re-run the last position
vim.api.nvim_set_keymap('n', 'tl', [[<cmd>lua require("neotest").run.run_last()<CR>]], { noremap = true })
-- Stop a running process (cancel)
vim.api.nvim_set_keymap('n', 'tc', [[<cmd>lua require('neotest').run.stop()<CR>]], { noremap = true })
-- Open the output of a test result
vim.api.nvim_set_keymap('n', 'to', [[<cmd>lua require("neotest").output.open()<CR>]], { noremap = true })
-- Toggle the summary window
vim.api.nvim_set_keymap('n', 'ts', [[<cmd>lua require("neotest").summary.toggle()<CR>]], { noremap = true })

-- Jump to previous/next test failure (adapted from :h neotest.jump)
vim.api.nvim_set_keymap('n', '[n', [[<cmd>lua require("neotest").jump.prev({ status = "failed" })<CR>]], { noremap = true })
vim.api.nvim_set_keymap('n', ']n', [[<cmd>lua require("neotest").jump.next({ status = "failed" })<CR>]], { noremap = true })
