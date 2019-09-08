# set up bash-completion if available
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# set up bash-git-prompt if available
if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
  source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi

export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
