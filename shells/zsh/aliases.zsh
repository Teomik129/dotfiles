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

# npm
alias ni='npm install'
alias nis='npm install --save'
alias nid='npm install --save-dev'
alias nit='npm install-test'
alias nits='npm install-test --save'
alias nitd='npm install-test --save-dev'
alias nu='npm uninstall'
alias nus='npm uninstall --save'
alias nusd='npm uninstall --save-dev'
alias np='npm publish'
alias nup='npm unpublish'
alias nlk='npm link'
alias nod='npm outdated'
alias nrb='npm rebuild'
alias nud='npm update'
alias nr='npm run'
alias nls='npm list --depth=0 2>/dev/null'
alias nlsg='npm list -g --depth=0 2>/dev/null'


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
