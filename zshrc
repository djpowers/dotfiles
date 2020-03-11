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

# lazy load nvm for faster shell start
nvm() {
    unset -f nvm
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
    nvm "$@"
}

node() {
    unset -f node
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
    node "$@"
}

npm() {
    unset -f npm
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
    npm "$@"
}

npx() {
  unset -f npx
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
  npx "$@"
}
