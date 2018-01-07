export PATH=$(brew --prefix)/bin:$PATH

# include .bashrc if it exists
if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi

# set up bash-completion if available
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# set up bash-git-prompt if available
if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
  source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi

eval "$(hub alias -s)"

alias ls='ls -G'
alias ll='ls -la'
alias reload='source ~/.bash_profile'

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
