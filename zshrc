export CLICOLOR=1

export VISUAL=vim
export EDITOR="$VISUAL"

alias ll='ls -al'

eval "$(starship init zsh)"
eval "$(rbenv init -)"

export NVM_LAZY_LOAD=true

# account for different Homebrew install paths
[ -f /usr/local/opt/zinit/zinit.zsh ] && source /usr/local/opt/zinit/zinit.zsh
[ -f /opt/homebrew/opt/zinit/zinit.zsh ] && source /opt/homebrew/opt/zinit/zinit.zsh

zinit light lukechilds/zsh-nvm

# initialize fzf and configure to use ripgrep
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --follow --hidden'

# allow you to select in a menu
zstyle ':completion:*' menu select
zmodload zsh/complist

# use the vi navigation keys in menu completion
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

autoload -Uz compinit && compinit

# enable history search with up and down arrows, cursor at end
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end

timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}
