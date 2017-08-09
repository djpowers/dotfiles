" Automatic vim-plug installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')
" Make sure you use single quotes
Plug 'ctrlpvim/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'sheerun/vim-polyglot'
Plug 'flazz/vim-colorschemes'
Plug 'craigemery/vim-autotag'
" Initialize plugin system
call plug#end()

colorscheme cobalt2

syntax enable                 " Use syntax highlighting
set nu                        " Display line numbers beside buffer
set listchars=tab:>-,trail:-  " Set character used to indicate unwanted spaces
set list                      " Enable displaying unwanted spaces
set smartindent               " Automatically inserts one extra level of indentation in some cases
set tabstop=2                 " Width of hard tabstop measured in 'spaces' (maximum width of an actual tab character)
set shiftwidth=2              " Size of an 'indent' measured in spaces
set expandtab                 " Tab key (in insert mode) inserts spaces instead of tab characters
set ruler                     " Show line number, column number, and virtual column number on right side of status bar
set laststatus=2              " Always display the status line
set backspace=2               " Backspace deletes like most programs in insert mode

set visualbell                " Use visual flash instead of beep on error
set noswapfile                " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set updatetime=250            " Set faster update time (for vim-gitgutter)

" Move up and down by visible lines if current line is wrapped
nmap j gj
nmap k gk

let g:EditorConfig_exclude_patterns = ['fugitive://.*']
autocmd BufNewFile,BufRead *.json,.jshintrc,*.jsd set ft=javascript

" Make CtrlP use ag for listing the files. Way faster and no useless files.
let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
let g:ctrlp_use_caching = 0
