export CLICOLOR=1
alias ll='ls -al'

eval "$(hub alias -s)"
eval "$(thefuck --alias)"
eval "$(rbenv init -)"

# run `git clone git@github.com:starcraftman/zsh-git-prompt.git`
if [ -f "zsh-git-prompt/zshrc.sh" ]; then
  source "zsh-git-prompt/zshrc.sh"
  PROMPT='%(?.%F{green}√%f.%F{red}?%?%f) %F{yellow}%~%f $(git_super_status)
%F{7}%T%f %# '
else
  PROMPT='%(?.%F{green}√%f.%F{red}?%?%f) %F{yellow}%~%f
  %F{7}%T%f %# '
fi

# case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

autoload -Uz compinit && compinit
