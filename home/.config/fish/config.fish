# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Theme
set fish_theme robbyrussell

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-fish/plugins/*)
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Example format: set fish_plugins autojump bundler
set fish_plugins z

# Path to your custom folder (default path is $FISH/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

alias reload='source ~/.config/fish/config.fish'
alias r='rails'
alias g='git'
alias o='open'
alias b='bundle'
alias v='vagrant'

alias sl='ls' # fix typo
alias l='ls -alh'

alias capd="cap stating deploy"
alias cappd="cap production deploy"
alias capsd="cap staging deploy"

# -------------------------------------------------------------------
# Git aliases
# -------------------------------------------------------------------
alias g='git'
alias gcl='git clone'
alias ga='git add'
alias gl='git log'
alias gs='git status'
alias gst='git status'
alias gsh='git show'
alias gd='git diff'
alias gdw='git diff --word-diff'
alias gdc='git diff --cached'
alias gds='git diff --stat'
alias gdh='git diff HEAD'
alias gb='git branch'
alias gba='git branch -a'
alias gco='git checkout'
alias gci='git commit'
alias gm='git commit -m'
alias gma='git commit -am'
alias gr='git remote'
alias grv='git remote -v'
alias gpl='git pull'
alias gps='git push'
alias gsl='git stash list'
alias gss='git stash save'
alias gsp='git stash pop'

alias grc='git rebase --continue'
alias grs='git rebase --skip'
alias gra='git rebase --abort'

alias gitx='open -a GitX .'
alias glast='git log -n 1'

alias glo="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
