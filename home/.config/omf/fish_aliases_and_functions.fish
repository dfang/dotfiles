# use osx plugin for oh-my-fish
alias rm='trash'

# use fasd plugin for oh-my-fish
alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias z=j


alias gfl="git fetch ;and git lg" # Git fetch and show log

# search in all bundled paths
function ags
  # ag -S "$@" `bundle show --paths`
end

# make a directory and cd into it
function mdc
  echo "make a new directory $1, then cd into it"
  mkdir -p "$1" ;and cd "$1"
end
alias mcd=mdc

# copy database.yml.example to database.yml
function copy_database_yml
  cp config/database.yml.example config/database.yml
end



function da
  docker start $1 ;and docker attach $1
end

function newbox
  docker run --name $1 --volumes-from=volume_container -it -v /var/run/docker.sock:/var/run/docker.sock -e BOX_NAME=$1 nathanleclaire/devbox
end

function xcode
  open -a Xcode $1
end

function sb
  open -a Sublime\ Text $1
end

function bra
  open -a Brackets $1
end

function xcode
  open -a Xcode $1
end

function docsets
  cd ~/Dropbox/PREFRENCES/Dash/docsets/;
  open ~/Dropbox/PREFRENCES/Dash/docsets/;
end
