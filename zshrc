export CLICOLOR=1

export VISUAL=vim
export EDITOR="$VISUAL"

alias ll='ls -al'

eval "$(starship init zsh)"
eval "$(rbenv init -)"

export NVM_LAZY_LOAD=true

source /usr/local/opt/zinit/zinit.zsh
zinit light lukechilds/zsh-nvm

# initialize fzf and configure to use ripgrep
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --follow --hidden'

# case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

autoload -Uz compinit && compinit
