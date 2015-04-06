# Press cmd+k, cmd+1 to collapse all in Atom Editor

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



function list_changed_files_in_commit(){
  git diff-tree --no-commit-id --name-only -r $1
}


function list_changed_files_in_commit(){
  git ls-tree --name-only -r $1
}


# rsync 的用法
#
# 用rsync -R copy会保持目录结构
# 如 rsync -R db/database.yml tmp, tmp目录下保持相同的结果, 目录不存在, 会自动创建的
# cp 或 cp -R 则会把所有的文件都copy到tmp跟目录了
#
# 一般情况下这样用rsync -avP 足够, 如果需要保持目录结构, 那就 rsync -avPR
#
# rsync 最重要的几个参数
# -a archive mode, -rlptgoD
# -v verbose mode, a single -v for a brief summary, two -v flags for more
# -P --partial --progress
# -R relative mode
# -n, --dry-run  dry-run mode
#
# -b, --backup            make backups (see --suffix & --backup-dir)
# -z, --compress          compress file data during the transfer
# -h, --human-readable    output numbers in a human-readable format
# --log-file=FILE         log what we're doing to the specified FILE
# -u, --update            skip files that are newer on the receiver
# --inplace               update destination files in-place
# --existing              skip creating new files on receiver
# --ignore-existing       skip updating files that exist on receiver
# --delete-before         receiver deletes before transfer (default)
# --delete-during         receiver deletes during xfer, not before
# --delete-after          receiver deletes after transfer, not before
# --delete-excluded       also delete excluded files from dest dirs
# --ignore-errors         delete even if there are I/O errors
# --exclude=PATTERN       exclude files matching PATTERN
# --exclude-from=FILE     read exclude patterns from FILE
# --include=PATTERN       don't exclude files matching PATTERN
# --include-from=FILE     read include patterns from FILE
# --files-from=FILE       read list of source-file names from FILE
#


# useful git workflows
#
# git config --list
# git config --global alias.d 'diff'
# 
# how to show whatchanged ?
# git whatchanged
#
# merge but no commit. no fast forward
# git merge --no-commit --no-ff temp
# http://stackoverflow.com/questions/8640887/git-merge-without-auto-commit
