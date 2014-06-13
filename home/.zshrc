# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias rm="rm -i"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13
export EDITOR=subl

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/bin:$PATH:/Users/Dave/.rvm/gems/ruby-2.0.0-p247/bin:/Users/Dave/.rvm/gems/ruby-2.0.0-p247@global/bin:/Users/Dave/.rvm/rubies/ruby-2.0.0-p247/bin:/Users/Dave/.rvm/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

# migrate, rollback, migrate, prepare tests
alias mrm="rake db:migrate && rake db:rollback && rake db:migrate"

# create new directory and cd into it
function mcd() {
  mkdir -p "$1" && cd "$1";
}

# jason new rails app template
function rails_new() { rails new $1 -T -B -d=postgresql && cd $1 && echo $1 > .ruby-gemset && echo 2.1.2 > .ruby-version && cd .. && cd $1 && bundle install && git init && git add . && git commit -m  'initial commit' }

# hub alias setup
eval "$(hub alias -s)"

# added by travis gem
[ -f /Users/Dave/.travis/travis.sh ] && source /Users/Dave/.travis/travis.sh

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
