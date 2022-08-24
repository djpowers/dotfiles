#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory

# list of files/folders to symlink in homedir
files="
  config/nvim/init.lua
  config/nvim/lua/user/options.lua
  config/nvim/lua/user/keymaps.lua
  config/nvim/lua/user/plugins.lua
  config/nvim/lua/user/colorscheme.lua
  config/nvim/lua/user/cmp.lua
  config/nvim/lua/user/lsp.lua
  config/nvim/lua/user/telescope.lua
  config/nvim/lua/user/treesitter.lua
  config/nvim/lua/user/autopairs.lua
  config/nvim/lua/user/comment.lua
  config/nvim/lua/user/gitsigns.lua
  config/nvim/lua/user/null-ls.lua
  config/nvim/lua/user/autocommands.lua
  config/nvim/lua/user/plugin-setups.lua
  config/starship.toml
  rbenv/default-gems
  nvm/default-packages
  ctags
  gitconfig
  gitignore_global
  vimrc
  zshrc
"

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mkdir -p ~/.$file
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done
