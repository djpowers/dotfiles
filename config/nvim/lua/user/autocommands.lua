vim.api.nvim_create_augroup("bufcheck", { clear = true })

-- Spell-check Markdown files and Git Commit Messages
vim.api.nvim_create_autocmd("FileType", {
  group = "bufcheck",
  pattern = { "gitcommit", "gitrebase" },
  command = "setlocal spell",
})

-- Enable dictionary auto-completion in Markdown files and Git Commit Messages
vim.api.nvim_create_autocmd("FileType", {
  group = "bufcheck",
  pattern = { "gitcommit", "gitrebase" },
  command = "setlocal complete+=kspell",
})
