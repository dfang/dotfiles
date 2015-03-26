# search in all bundled gems, very useful when hacking source code
# http://stackoverflow.com/questions/20044173/there-a-way-to-search-all-bundled-gems-project-directories
# http://andre.arko.net/2013/05/10/hack-your-bundle-for-fun-and-profit/
# ags 'pattern'  search in bundled gem source code(source code in current project folder is not included)
# ag 'pattern'  search only in current project
# ag is case sensitive by default, so use -S(smart case)
function ags () {
  ag -S "$@" `bundle show --paths`
}

# one command to extract all. alias.sh/most-popular/usage
extract () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

# use rails 4 binstubs
function use_rails4_bin(){
  bundle config --delete bin    # Turn off Bundler's stub generator
  rake rails:update:bin         # Use the new Rails 4 executables
  git add bin                   # Add bin/ to source control
}

# make directory and change to it
function mdc(){
  echo "make a new directory $1, then cd into it"
  mkdir -p "$1" && cd "$1"
}
alias mcd=mdc

# copy database.yml.example to database.yml
function copy_database_yml(){
  cp config/database.yml.example config/database.yml
}

# quick-convert ERB files to Haml using html2haml
function h2h(){
  echo 'run html2haml in current folder ....'
  for i in `find . -name '*.erb'` ; do html2haml -e $i ${i%erb}haml ; done
  echo 'done !'
}
function h2h_and_remove_erb() {
  echo 'run html2haml in current folder && remove erb files ....'
  for i in `find . -name '*.erb'` ; do html2haml -e $i ${i%erb}haml ; rm $i ; done
  echo 'done !'
}
function h2h_all_erb_files(){
  echo 'run html2haml in app/views && remove erb files ....'
  for i in `find app/views -name '*.erb'` ; do html2haml -e $i ${i%erb}haml ; rm $i ; done
  echo 'done !'
}
alias html2haml_in_this_folder=h2h

# curl with JSON
function jsoncurl(){
  curl -H "Content-type: application/json" -H "Accept: application/json" $*
}

# check video file integrity using ffmpeg
function check_integrity_of_video_file()
{
   echo ……… Check video integrity using ffmpeg ………….
   ffmpeg -v 5 -i $1 -f null
}

# Copy public key to remote machine (dependency-less)
function authme() {
  ssh "$1" 'mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys' \
    < ~/.ssh/id_dsa.pub
}
alias upload_public_key=authme

# get my ip
function myip(){
  echo 'your local ip is :'
  ifconfig | grep 'inet ' | grep -v 127.0.0.1 | cut -d\  -f2
  echo 'your external ip is :'
  curl icanhazip.com
  echo ''
}
alias ip=myip
alias getmyip=ip

# how to download a youtube video
function download_youtube_video() {
  # first brew install youtube-dl
  # then youtube-dl -v --write-sub --sub-lang en https://www.youtube.com/watch?v=hG-ARy0oqjI
  # you can create an alias like this youtube-dl='youtube-dl -v --write-sub --sub-lang en'
  youtube-dl -v --write-sub --sub-lang en $1
}
alias youtube-dl='youtube-dl -v --write-sub --sub-lang en'

# create a go boilerplate
function letsgo(){
  mkdir -p src pkg bin
  export GOPATH=$PWD:$GOPATH
  export GOBIN=$GOPATH/bin
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
