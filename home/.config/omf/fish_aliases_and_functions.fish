function da
  docker start $ ;and docker attach $1
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
