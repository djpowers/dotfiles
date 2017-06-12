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
" Initialize plugin system
call plug#end()

syntax enable                 " Use syntax highlighting
set nu                        " Display line numbers beside buffer
set listchars=tab:>-,trail:-  " Set character used to indicate unwanted spaces
set list                      " Enable displaying unwanted spaces
set smartindent               " Automatically inserts one extra level of indentation in some cases
set tabstop=2                 " Width of hard tabstop measured in 'spaces' (maximum width of an actual tab character)
set shiftwidth=2              " Size of an 'indent' measured in spaces
set expandtab                 " Tab key (in insert mode) inserts spaces instead of tab characters
set ruler                     " Show line number, column number, and virtual column number on right side of status bar
set backspace=2               " More powerful backspacing

set visualbell                " Use visual flash instead of beep on error
set noswapfile                " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set updatetime=250            " Set faster update time (for vim-gitgutter)

autocmd BufNewFile,BufRead *.json,.jshintrc,*.jsd set ft=javascript
