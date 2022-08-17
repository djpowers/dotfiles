-- plugin installation
require 'plugins'

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

-- Set up lualine
require('lualine').setup()

-- Set up colorizer
vim.opt.termguicolors = true
require'colorizer'.setup()

-- Set up nvim-comment
require('nvim_comment').setup()
--" " Automatic vim-plug installation
--" if empty(glob('~/.vim/autoload/plug.vim'))
--"   silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
--"         \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
--"   autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
--" endif
--" 
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
--" " Use filetype detection, as well as indent and plugins
--" if has('autocmd')
--"   filetype plugin indent on
--" endif
--" " Use syntax highlighting
--" if has('syntax') && !exists('g:syntax_on')
--"   syntax enable
--" endif
--" 
--" set nocompatible              " Explicitly set nocompatible
--" set number                    " Show current line number
--" set relativenumber            " Show relative line numbers
--" set listchars=tab:>-,trail:-  " Set character used to indicate unwanted spaces
--" set list                      " Enable displaying unwanted spaces
--" set smartindent               " Automatically inserts one extra level of indentation in some cases
--" set tabstop=2                 " Width of hard tabstop measured in 'spaces' (maximum width of an actual tab character)
--" set shiftwidth=2              " Size of an 'indent' measured in spaces
--" set expandtab                 " Tab key (in insert mode) inserts spaces instead of tab characters
--" set ruler                     " Show line number, column number, and virtual column number on right side of status bar
--" set laststatus=2              " Always display the status line
--" set backspace=2               " Backspace deletes like most programs in insert mode
--" 
--" set incsearch                 " Start searching before pressing enter
--" set hlsearch                  " Highlight all search pattern matches
--" 
--" set visualbell                " Use visual flash instead of beep on error
--" set noswapfile                " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
--" set updatetime=250            " Set faster update time (for vim-gitgutter)
--" 
--" " Mappings to edit and source vimrc file
--" nnoremap <leader>ev :vsplit $MYVIMRC<cr>
--" nnoremap <leader>sv :source $MYVIMRC<cr>
--" 
--" " Move up and down by physical lines if using a count, otherwise by visible lines
--" nnoremap <expr> j v:count ? 'j' : 'gj'
--" nnoremap <expr> k v:count ? 'k' : 'gk'
--" 
--" " Open new split panes to right and bottom, which feels more natural
--" set splitbelow
--" set splitright
--" 
--" " Hide Netrw banner by default (toggle with `I`); add mapping to open one directory up
--" let g:netrw_banner = 0
--" nnoremap - :e %:h<cr>
--" 
--" " Use <C-L> to clear the highlighting of :set hlsearch.
--" if maparg('<C-L>', 'n') ==# ''
--"   nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
--" endif
--" 
--" " Add mapping to show highlight groups at current cursor position
--" nnoremap <leader>sp :call <SID>SynStack()<CR>
--" function! <SID>SynStack()
--"   if !exists("*synstack")
--"     return
--"   endif
--"   echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
--" endfunc
--" 
--" " Open browser
--" let g:netrw_nogx = 1 " disable netrw's gx mapping.
--" nmap gx <Plug>(openbrowser-smart-search)
--" vmap gx <Plug>(openbrowser-smart-search)
--" 
--" " Ensure that EditorConfig works well with fugitive
--" let g:EditorConfig_exclude_patterns = ['fugitive://.*']
--" 
--" " Remap fzf.vim keybindings
--" nnoremap <C-p> :Files<CR>
--" nnoremap <Leader>b :Buffers<CR>
--" nnoremap <Leader>h :History<CR>
--" 
--" " Spell-check Markdown files and Git Commit Messages
--" autocmd FileType markdown setlocal spell
--" autocmd FileType gitcommit setlocal spell
--" 
--" " Enable dictionary auto-completion in Markdown files and Git Commit Messages
--" autocmd FileType markdown setlocal complete+=kspell
--" autocmd FileType gitcommit setlocal complete+=kspell
--" 
--" " Set Emmet to apply jsx settings to javascript.jsx filetype
--" let g:user_emmet_settings = {
--"       \  'javascript.jsx' : {
--"       \      'extends' : 'jsx',
--"       \  },
--"       \}
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
--" " Have Python use 'fork' instead of default 'spawn'
--" let g:autotagStartMethod='fork'
--" 
--" " Disable automatic comment insertion
--" autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
--" 
--" " Open quickfix window after any grep invocation
--" autocmd QuickFixCmdPost *grep* cwindow
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
