ZSH=$HOME/.oh-my-zsh
# themes = (gozilla af-magic kolo bira wedisagree mgutz kennethreitz lambda imajes crcandy dstufft ys theunraveler frisk)
ZSH_THEME="ys"

# CASE_SENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
DISABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

# include osx plugin to support open same directory in teminal http://goo.gl/vM76Gy
plugins=(homesick osx git brew gem knife history history-substring-search node npm bower vagrant themes berks extract)

# amend the path, for more http://daniel.hepper.net/blog/2011/02/change-order-of-path-entries-on-mac-os-x/
# you can edit /etc/paths file manually, or amend path here
export PATH="~/bin:/usr/local/bin:/usr/local/sbin:$PATH"

source $ZSH/oh-my-zsh.sh

[[ -f $HOME/.exports ]] && source $HOME/.exports
[[ -f $HOME/.zsh_aliases ]] && source $HOME/.zsh_aliases
[[ -f $HOME/.ssh_aliases ]] && source $HOME/.ssh_aliases

# PATH for rbenv, see env | grep PATH
# no matter how installed rbenv(by git clone or brew), first make sure which rbenv is executable
# then make sure shims comes before rbenv command in PATH
# add support for Homebrew installed rbenv, it does # export PATH="$HOME/.rbenv/shims:$PATH"
# add --no-rehash to speedup coderwall.com/p/j6cjnq
if which rbenv > /dev/null; then eval "$(rbenv init - --no-rehash)"; fi

# add npm support
export PATH="/usr/local/share/npm/bin:$PATH"

# this loads brew-installed nvm
[[ -s $(brew --prefix nvm)/nvm.sh ]] && source $(brew --prefix nvm)/nvm.sh
export NVM_DIR=~/.nvm

# this loads fasd
eval "$(fasd --init auto)"

# add completion for brew-installed aws cli
[[ -f /usr/local/share/zsh/site-functions/_aws ]] && source /usr/local/share/zsh/site-functions/_aws
export AWS_CONFIG_FILE="~/.AWS_Config"

# set PS1 in macvim, http://stackoverflow.com/questions/12942781/zsh-correct-shell-input-output-inside-vim-macvim
if [[ $TERM == 'dumb' ]]; then
  export RPS1="\n\w\n\u $ "
fi

# http://github.com/sstephenson/rbenv/wiki/Understanding-binstubs#adding-project-specific-binstubs-to-path
#export PATH="$PWD/bin:$PATH"
#hash -r 2>/dev/null || true

export PATH="./bin:$PATH"

# add direnv support
# eval "$(direnv hook zsh)"

alias capd='cap deploy && sleep 20 && cap deploy:reindex'
alias csdpl='cap staging db:pull'
alias csdps='cap staging db:push'
export VISUAL='sb'

function check()
{
   echo ……… Check video integrity using ffmpeg ………….
   ffmpeg -v 5 -i $1 -f null
}

export DOCKER_HOST=tcp://:4243
alias d='docker'
alias bd='boot2docker'

source ~/.autoenv/activate.sh

# http://stackoverflow.com/questions/9872411/how-to-open-terminal-at-last-open-directory
# defaults write com.apple.Terminal NSQuitAlwaysKeepsWindows -bool true

export DOCKER_HOST=tcp://192.168.59.103:2375

function letsgo(){
mkdir -p src pkg bin
export GOPATH=$PWD
export PATH=$PATH:$GOPATH/bin
mkdir -p $GOPATH/src/github.com/dfang/main
touch $GOPATH/src/github.com/dfang/main/main.go
(cat << EOF
package main
import "fmt"

func main(){
  fmt.Printf("Hello, world.\n")
}
EOF
) > $GOPATH/src/github.com/dfang/main/main.go
}

