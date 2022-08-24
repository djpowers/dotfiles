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
require "user.gitsigns"
require "user.null-ls"
require "user.autocommands"
require "user.plugin-setups"
--" " Specify a directory for plugins
--" call plug#begin('~/.vim/plugged')
--" " Make sure you use single quotes
--" Plug 'dense-analysis/ale'
--" " Initialize plugin system
--" call plug#end()
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
