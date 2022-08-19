require "user.options"
require "user.keymaps"
-- plugin installation
require 'user.plugins'

-- Set colorscheme
vim.cmd[[colorscheme nord]]

-- Telescope find file functions
vim.api.nvim_set_keymap('n', '<leader>ff', [[<cmd>lua require('telescope.builtin').find_files()<CR>]], { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fg', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fb', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fh', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], { noremap = true })

-- Set up treesitter
require('nvim-treesitter.configs').setup {
  -- A list of parser names, or "all"
  ensure_installed = { "lua", "ruby", "typescript" },
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  -- Automatically install missing parsers when entering buffer
  auto_install = true,
  highlight = {
    enable = true
  }
}

-- Set up nvim-cmp (completion)
require("luasnip/loaders/from_vscode").lazy_load()

-- Set up mason (lsp)
require("mason").setup()
require('mason-lspconfig').setup()

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

require("mason-lspconfig").setup_handlers {
  function (server_name)
    require("lspconfig")[server_name].setup {
      capabilities = capabilities,
    }
  end,
}

local cmp = require'cmp'

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' }, -- For luasnip users.
    { name = 'buffer' },
    { name = 'path' },
  })
})

-- Set up lualine
require('lualine').setup()

-- Set up colorizer
vim.opt.termguicolors = true
require'colorizer'.setup()

-- Set up nvim-comment
require('nvim_comment').setup()

-- Set up leap
require('leap').set_default_keymaps()
--" " Specify a directory for plugins
--" call plug#begin('~/.vim/plugged')
--" " Make sure you use single quotes
--" Plug 'tpope/vim-surround'
--" Plug 'tpope/vim-repeat'
--" Plug 'tpope/vim-rails'
--" Plug 'tpope/vim-fugitive'
--" Plug 'tpope/vim-rhubarb'
--" Plug 'tpope/vim-endwise'
--" Plug 'ludovicchabant/vim-gutentags'
--" Plug 'mattn/emmet-vim'
--" Plug 'dense-analysis/ale'
--" Plug 'jeffkreeftmeijer/vim-numbertoggle'
--" Plug 'mcasper/vim-infer-debugger'
--" Plug 'tyru/open-browser.vim'
--" Plug 'arcticicestudio/nord-vim'
--" Plug 'suy/vim-context-commentstring'
--" " Initialize plugin system
--" call plug#end()
--" 
--" " Mappings to edit and source vimrc file
--" nnoremap <leader>ev :vsplit $MYVIMRC<cr>
--" nnoremap <leader>sv :source $MYVIMRC<cr>
--" 
--" " Hide Netrw banner by default (toggle with `I`); add mapping to open one directory up
--" let g:netrw_banner = 0
--" nnoremap - :e %:h<cr>
--" 
--" " Ensure that EditorConfig works well with fugitive
--" let g:EditorConfig_exclude_patterns = ['fugitive://.*']
--" 
--" " Spell-check Markdown files and Git Commit Messages
--" autocmd FileType markdown setlocal spell
--" autocmd FileType gitcommit setlocal spell
--" 
--" " Enable dictionary auto-completion in Markdown files and Git Commit Messages
--" autocmd FileType markdown setlocal complete+=kspell
--" autocmd FileType gitcommit setlocal complete+=kspell
--" 
--" " Set ALE fixers
--" let g:ale_fixers = {
--"       \   'ruby': ['rubocop'],
--"       \   'javascript': ['prettier', 'eslint'],
--"       \   'vue': ['prettier', 'eslint', 'stylelint'],
--"       \   'html': ['prettier'],
--"       \   'css': ['prettier'],
--"       \   'markdown': ['prettier'],
--"       \   'json': ['prettier'],
--"       \}
--" 
--" " Override the invoked Rubocop binary (to run bundled version)
--" let g:ale_ruby_rubocop_executable = 'bundle'
--" 
--" " Have ALE fix files automatically on save
--" let g:ale_fix_on_save = 1
--" 
--" " Show ALE suggestions during typing
--" let g:ale_completion_enabled = 1
--" 
--" " Use ALE's function for omnicompletion
--" set omnifunc=ale#completion#OmniFunc
--" 
--" " Add mappings for vim-infer-debugger calls
--" nnoremap <leader>P :call AddDebugger("O")<cr>
--" nnoremap <leader>p :call AddDebugger("o")<cr>
--" nnoremap <leader>d :call RemoveAllDebuggers()<cr>
--" 
--" " Overwrite vim-infer-debugger default settings
--" let g:user_debugger_dictionary = {
--"       \ '\.rb': 'binding.pry',
--"       \ '\.erb': '<% binding.pry %>',
--"       \ '\.vue': 'debugger',
--"       \ }
