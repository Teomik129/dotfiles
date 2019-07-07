alias reload!='. ~/.zshrc'

# ls
alias ls='ls --color=auto' # Colorize the ls output
alias la='ls -A' # List all
alias ll='ls -lA' # Use a long listing format
alias l.='ls -d .* --color=auto' # Show hidden files

# Directory
alias mkdir='mkdir -pv'
alias md='mkdir'
alias rd='rmdir'

# Helpers
alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'

# vim ftw
alias vim=nvim
alias vi=vim
alias svi='sudo nvim'
alias vis='vim "+set si"'
alias edit='vim'


# wget
alias wget='wget -c'

# sudo
alias _="sudo"

# Tree
if [ ! -x "$(which tree 2>/dev/null)" ]
then
  alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
fi


# Display whatever file is regular file or folder
catt() {
  for i in "$@"; do
    if [ -d "$i" ]; then
      ls "$i"
    else
      cat "$i"
    fi
  done
}


speedtest() {
  for i in $(seq 1 10); do
    time zsh -i -c exit;
  done
}
