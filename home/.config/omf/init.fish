if test -e $OMF_CONFIG/fish_aliases_and_functions.fish
  source $OMF_CONFIG/fish_aliases_and_functions.fish
end

if test -e ~/.aliases
  source ~/.aliases
end

set PATH $HOME/.meteor $PATH

# https://github.com/chef/chef-dk, run chef shell-init
eval (chef shell-init fish)

# Prepend a path to $PATH
set -x PATH ~/bin $PATH
set -x PATH ~/.bin $PATH
set -x PATH ./bin $PATH

# comment out here because oh my fish rbenv plugin support this
# set PATH /usr/local/bin $PATH
# set PATH ~/.rbenv/shims $PATH
# set -gx NVM_DIR (brew --prefix nvm)

# set -gx PATH /usr/local/bin $PATH


set -gx GOPATH $HOME/go

