export PATH=$(brew --prefix)/bin:$PATH

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES='verbose'
export GIT_PS1_DESCRIBE_STYLE='branch'
export GIT_PS1_SHOWUPSTREAM='verbose'

PS1='\n\[\e[32m\]\u\[\e[0m\]@\[\e[34m\]\H\[\e[0m\] at \[\e[35m\]\w\[\e[0m\]'
if type -t __git_ps1 | grep -q '^function$' 2>/dev/null; then
    PS1=$PS1'$(__git_ps1)'
fi
export PS1=$PS1'\n[\[\e[36m\]\D{%Y-%m-%d %T}\[\e[0m\]]\$ '

alias ls='ls -G'
alias ll='ls -la'

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
