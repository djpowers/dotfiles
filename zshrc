export CLICOLOR=1

export VISUAL=vim
export EDITOR="$VISUAL"

alias ll='ls -al'

eval "$(thefuck --alias)"
eval "$(rbenv init -)"

# run `git clone git@github.com:starcraftman/zsh-git-prompt.git ~/.zsh-git-prompt`
if [ -f ~/.zsh-git-prompt/zshrc.sh ]; then
  source ~/.zsh-git-prompt/zshrc.sh
  PROMPT='%(?.%F{green}√%f.%F{red}?%?%f) %F{yellow}%~%f $(git_super_status)
%F{7}%T%f %# '
else
  PROMPT='%(?.%F{green}√%f.%F{red}?%?%f) %F{yellow}%~%f
  %F{7}%T%f %# '
fi

# case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

autoload -Uz compinit && compinit

# Add every binary that requires nvm, npm or node to run to an array of node globals
NODE_GLOBALS=(`find ~/.nvm/versions/node -maxdepth 3 -type l -wholename '*/bin/*' | xargs -n1 basename | sort | uniq`)
NODE_GLOBALS+=("node")
NODE_GLOBALS+=("nvm")

# Lazy-loading nvm + npm on node globals call
load_nvm () {
  export NVM_DIR=~/.nvm
  [ -s "$(brew --prefix nvm)/nvm.sh" ] && . "$(brew --prefix nvm)/nvm.sh"
}

# Making node global trigger the lazy loading
for cmd in "${NODE_GLOBALS[@]}"; do
  eval "${cmd}(){ unset -f ${NODE_GLOBALS}; load_nvm; ${cmd} \$@ }"
done
