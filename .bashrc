#Prompt
if [[ -z "$CONDA_DEFAULT_ENV" ]]; then
  PS1="\u@\h$ "
else
  PS1="(${CONDA_DEFAULT_ENV}) \u@\h$ ";
fi

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

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
alias ...='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'
alias .6='cd ../../../../../../'
alias tmuxn='tmux new -s analysis'
alias tmuxa='tmux attach -t analysis'
alias light='salloc --time=2:0:0 --ntasks=1 --account=def-stothard --mem=2000M'
alias heavy='salloc --time=2:0:0 --ntasks=16 --account=def-stothard --mem=32000M'
alias finished='sacct -s CD --format=JobID,JobName,MaxRSS,ReqMem,Elapsed,End,State,NodeList'
alias f='open -a Finder ./'

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
