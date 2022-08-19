local options = {
  number = true,          -- show current line number
  relativenumber = true,  -- show relative line numbers
  list = true,            -- show unwanted spaces
  smartindent = true,     -- automatically insert one extra level of indentation in some cases
  expandtab = true,       -- tab key (in insert mode) inserts spaces instead of tab characters
  tabstop = 2,            -- width of hard tabstop measured in 'spaces' (maximum width of an actual tab character
  shiftwidth = 2,         -- size of an 'indent' measured in spaces
  splitbelow = true,      -- force all horizontal splits to go below current window
  splitright = true,     -- force all vertical splits to go to the right of current window
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
