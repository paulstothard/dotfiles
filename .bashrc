#Platform
unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac

#Prompt
White='\[\033[0;37m\]'
BRed='\[\033[1;31m\]'
BIRed='\[\033[1;91m\]'
BYellow='\[\033[1;33m\]'
Color_Off='\[\033[0m\]'
export PS1="\n${White}[${BIRed}\h${White}:${BYellow}\w${White}]${Color_Off}\n\$ "

#Colors
if [[ $machine == 'Linux' ]]; then
  export LS_COLORS="di=1;34;1:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
  alias ls='ls --color=auto'
elif [[ $machine == 'Mac' ]]; then
  export CLICOLOR=1
  export LSCOLORS=ExFxCxDxBxegedabagacad
  alias ls='ls -G'

  #opens current directory in Mac OS Finder
  alias f='open -a Finder ./'
  alias DT='tee ~/Desktop/terminalOut.txt'
  trash () { command mv "$@" ~/.Trash ; }

  #cdf: cd to frontmost window of Mac OS Finder
  cdf () {
      currFolderPath=$( /usr/bin/osascript <<EOT
          tell application "Finder"
              try
          set currFolder to (folder of the front window as alias)
              on error
          set currFolder to (path to desktop folder as alias)
              end try
              POSIX path of currFolder
          end tell
EOT
      )
      echo "cd to \"$currFolderPath\""
      cd "$currFolderPath"
  }

fi

#Navigation
set -o vi

#Paths
export PATH="$PATH:~/bin"

#Editor
export EDITOR=/usr/bin/vim

#Alias
alias myip='curl checkip.dyndns.org'
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | more'
alias lra='ls -Ra | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | more'
alias ll='ls -FGlAhp'
alias c='clear'
alias ...='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'
alias .6='cd ../../../../../../'
alias tmuxn='tmux new -s analysis'
alias tmuxa='tmux attach -t analysis'
alias tmuxd='tmux detach'
alias light='salloc --time=2:0:0 --ntasks=1 --account=def-stothard --mem=2000M'
alias heavy='salloc --time=2:0:0 --ntasks=16 --account=def-stothard --mem=32000M'
alias finished='sacct -s CD --format=JobID,JobName,MaxRSS,ReqMem,Elapsed,End,State,NodeList'

#Functions
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

my_ps() { ps $@ -u $USER -o pid,%cpu,%mem,start,time,bsdtime,command ; }

mcd () { mkdir -p "$1" && cd "$1"; }
