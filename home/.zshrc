# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
# themes = (gozilla af-magic kolo bira wedisagree mgutz kennethreitz lambda imajes crcandy dstufft ys theunraveler frisk)
ZSH_THEME="ys"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
DISABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git)
plugins=(homesick git brew gem knife history history-substring-search node npm bower vagrant themes berks extract)

# amend the path, for more http://daniel.hepper.net/blog/2011/02/change-order-of-path-entries-on-mac-os-x/
# you can edit /etc/paths file manually, or amend path here
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

source $ZSH/oh-my-zsh.sh

[[ -f $HOME/.exports ]] && source $HOME/.exports
[[ -f $HOME/.zsh_aliases ]] && source $HOME/.zsh_aliases
[[ -f $HOME/.ssh_aliases ]] && source $HOME/.ssh_aliases

# PATH for rbenv, see env | grep PATH
# no matter how installed rbenv(by git clone or brew), first make sure which rbenv is executable
# then make sure shims comes before rbenv command in PATH
# add support for Homebrew installed rbenv, it does # export PATH="$HOME/.rbenv/shims:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# add npm support
export PATH="/usr/local/share/npm/bin:$PATH"

# this loads NVM
# [[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh
[[ -s $(brew --prefix nvm)/nvm.sh ]] && source $(brew --prefix nvm)/nvm.sh # this loads brew-installed nvm

# this loads fasd
eval "$(fasd --init auto)"

# add completion for brew-installed aws cli
[[ -f /usr/local/share/zsh/site-functions/_aws ]] && source /usr/local/share/zsh/site-functions/_aws
export AWS_CONFIG_FILE="~/.AWS_Config"

# set PS1 in macvim, http://stackoverflow.com/questions/12942781/zsh-correct-shell-input-output-inside-vim-macvim
if [[ $TERM == 'dumb' ]]; then
  export RPS1="\n\w\n\u $ "
fi
