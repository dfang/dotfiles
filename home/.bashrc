alias ebp='$EDITOR ~/.bash_profile'
alias rbp='source ~/.bash_profile'
alias ebrc='$EDITOR ~/.bashrc'
alias rbrc='source ~/.bashrc'
alias eba='$EDITOR ~/.bash_aliases'
alias rba='source ~/.bash_aliases'
alias evrc='$EDITOR ~/.vimrc'

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias la='ls -a'
alias ll='ls -l'

# add direnv support
eval "$(direnv hook bash)"

if [ -f "$HOME/.aliases" ]; then
  . "$HOME/.aliases"
fi
export PATH=/opt/chefdk/embedded/bin:/Users/dfang/google-cloud-sdk/bin:/usr/local/heroku/bin:./bin:/usr/local/share/npm/bin:/Users/dfang/.rbenv/shims:/Users/dfang/bin:/usr/local/bin:~/bin:/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/go/bin:/Users/dfang/go/bin
