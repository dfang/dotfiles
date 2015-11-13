# Customize Oh My Fish installation path(~/.local/share/omf by default)
# set -gx OMF_PATH {{OMF_PATH}}
set -gx OMF_PATH ~/.oh-my-fish

# Customize Oh My Fish configuration path(~/.config/omf by default)
set -gx OMF_CONFIG ~/.config/omf

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

if test -e ~/.aliases
  source ~/.aliases
end


# Prepend a path to $PATH
set -x PATH ~/bin $PATH
set -x PATH ~/.bin $PATH
set -x PATH ./bin $PATH

# comment out here because oh my fish rbenv plugin support this
# set PATH /usr/local/bin $PATH
# set PATH ~/.rbenv/shims $PATH

set PATH $HOME/.meteor $PATH
set -gx NVM_DIR (brew --prefix nvm)
