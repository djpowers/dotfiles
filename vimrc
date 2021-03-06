" Automatic vim-plug installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')
" Make sure you use single quotes
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-endwise'
Plug 'sheerun/vim-polyglot'
Plug 'flazz/vim-colorschemes'
Plug 'craigemery/vim-autotag'
Plug 'mattn/emmet-vim'
Plug 'dense-analysis/ale'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'ap/vim-css-color'
Plug 'mcasper/vim-infer-debugger'
Plug 'tyru/open-browser.vim'
" Initialize plugin system
call plug#end()

colorscheme cobalt2
highlight Comment term=italic cterm=italic gui=italic
highlight htmlArg term=italic cterm=italic gui=italic

" Syntax highlighting customizations not natively supported by colorscheme
highlight jsFuncParens ctermfg=Yellow guifg=Yellow
highlight htmlArg ctermfg=Yellow guifg=Yellow
highlight htmlString ctermfg=LightGreen guifg=LightGreen

highlight graphqlStructure ctermfg=Green guifg=Green
highlight graphqlName ctermfg=Green guifg=Green
highlight graphqlBraces ctermfg=Green guifg=Green

highlight jsxComponentName ctermfg=LightGreen guifg=LightGreen

highlight SpellBad ctermfg=DarkRed guifg=DarkRed

highlight link jsxOpenPunct htmlTag
highlight link jsxClosePunct htmlTag
highlight link jsxCloseString htmlTag
highlight link jsxEqual htmlTag
highlight link jsxTagName htmlTagName
highlight link jsObjectKey htmlTagName
highlight link jsxAttrib htmlArg
highlight link jsString htmlString

" Use filetype detection, as well as indent and plugins
if has('autocmd')
  filetype plugin indent on
endif
" Use syntax highlighting
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

set nocompatible              " Explicitly set nocompatible
set number                    " Show current line number
set relativenumber            " Show relative line numbers
set listchars=tab:>-,trail:-  " Set character used to indicate unwanted spaces
set list                      " Enable displaying unwanted spaces
set smartindent               " Automatically inserts one extra level of indentation in some cases
set tabstop=2                 " Width of hard tabstop measured in 'spaces' (maximum width of an actual tab character)
set shiftwidth=2              " Size of an 'indent' measured in spaces
set expandtab                 " Tab key (in insert mode) inserts spaces instead of tab characters
set ruler                     " Show line number, column number, and virtual column number on right side of status bar
set laststatus=2              " Always display the status line
set backspace=2               " Backspace deletes like most programs in insert mode

set incsearch                 " Start searching before pressing enter
set hlsearch                  " Highlight all search pattern matches

set visualbell                " Use visual flash instead of beep on error
set noswapfile                " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set updatetime=250            " Set faster update time (for vim-gitgutter)

" Mappings to edit and source vimrc file
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Move up and down by physical lines if using a count, otherwise by visible lines
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Hide Netrw banner by default (toggle with `I`); add mapping to open one directory up
let g:netrw_banner = 0
nnoremap - :e %:h<cr>

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

" Add mapping to show highlight groups at current cursor position
nnoremap <leader>sp :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Open browser
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

" Ensure that EditorConfig works well with fugitive
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" Remap fzf.vim keybindings
nnoremap <C-p> :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>h :History<CR>

" Spell-check Markdown files and Git Commit Messages
autocmd FileType markdown setlocal spell
autocmd FileType gitcommit setlocal spell

" Enable dictionary auto-completion in Markdown files and Git Commit Messages
autocmd FileType markdown setlocal complete+=kspell
autocmd FileType gitcommit setlocal complete+=kspell

" Set Emmet to apply jsx settings to javascript.jsx filetype
let g:user_emmet_settings = {
      \  'javascript.jsx' : {
      \      'extends' : 'jsx',
      \  },
      \}

" Set ALE fixers
let g:ale_fixers = {
      \   'ruby': ['rubocop'],
      \   'javascript': ['prettier', 'eslint'],
      \   'html': ['prettier'],
      \   'css': ['prettier'],
      \   'markdown': ['prettier'],
      \   'json': ['prettier'],
      \}

" Override the invoked Rubocop binary (to run bundled version)
let g:ale_ruby_rubocop_executable = 'bundle'

" Have ALE fix files automatically on save
let g:ale_fix_on_save = 1

" Show ALE suggestions during typing
let g:ale_completion_enabled = 1

" Use ALE's function for omnicompletion
set omnifunc=ale#completion#OmniFunc

" Have Python use 'fork' instead of default 'spawn'
let g:autotagStartMethod='fork'

" Disable automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Open quickfix window after any grep invocation
autocmd QuickFixCmdPost *grep* cwindow

" Use previous default color scheme for GitGutter
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1

" Add mappings for vim-infer-debugger calls
nnoremap <leader>P :call AddDebugger("O")<cr>
nnoremap <leader>p :call AddDebugger("o")<cr>
nnoremap <leader>d :call RemoveAllDebuggers()<cr>

" Overwrite vim-infer-debugger default settings
let g:user_debugger_dictionary = {
      \ '\.rb': 'binding.pry',
      \ '\.erb': '<% binding.pry %>',
      \ }
