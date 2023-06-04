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

-- Disable automatic comment insertion
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function() vim.opt.formatoptions = vim.opt.formatoptions - { "c","r","o" } end,
})

-- Set Jb files to use Ruby FileType
vim.api.nvim_create_autocmd(
  { "BufRead", "BufNewFile" },
  { pattern = { "*.jb" }, command = "setlocal filetype=ruby" }
)
