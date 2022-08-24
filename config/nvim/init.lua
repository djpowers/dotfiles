require "user.options"
require "user.keymaps"
require "user.plugins"
require "user.colorscheme"
require "user.cmp"
require "user.lsp"
require "user.telescope"
require "user.treesitter"
require "user.autopairs"
require "user.comment"

-- Set up lualine
require('lualine').setup()

-- Set up colorizer
require'colorizer'.setup()

-- Set up leap
require('leap').set_default_keymaps()

-- Set up gitlinker
require"gitlinker".setup()
--" " Specify a directory for plugins
--" call plug#begin('~/.vim/plugged')
--" " Make sure you use single quotes
--" Plug 'tpope/vim-rails'
--" Plug 'ludovicchabant/vim-gutentags'
--" Plug 'mattn/emmet-vim'
--" Plug 'dense-analysis/ale'
--" Plug 'jeffkreeftmeijer/vim-numbertoggle'
--" Plug 'mcasper/vim-infer-debugger'
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
