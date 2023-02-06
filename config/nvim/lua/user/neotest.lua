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

-- Jump to previous/next test failure (adapted from :h neotest.jump)
vim.api.nvim_set_keymap('n', '[n', [[<cmd>lua require("neotest").jump.prev({ status = "failed" })<CR>]], { noremap = true })
vim.api.nvim_set_keymap('n', ']n', [[<cmd>lua require("neotest").jump.next({ status = "failed" })<CR>]], { noremap = true })
