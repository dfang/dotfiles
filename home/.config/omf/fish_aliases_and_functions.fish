# use fasd plugin for oh-my-fish

alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias z='fasd_cd -d'     # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # cd with interactive selection
alias j=z
alias jj=zz


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
