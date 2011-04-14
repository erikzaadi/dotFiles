export TERM="xterm-color"
alias ls="ls -G"
alias la="ls -a"
alias ll="ls -lh"
alias gitpsh="git push"
alias gitac="git add. && git commit -a"
alias gitc="git commit -a"
alias bim="vim" #FixUberFailingRepetiveTypo
# Source the git bash completion file
if [ -f ~/.git-completion.bash ]; then
	    source ~/.git-completion.bash
	    export GIT_PS1_SHOWDIRTYSTATE=true
	    txtylw='\033[1;33m' # Yellow
	    fgcolor="\033[0m"    # unsets color to term's fg color
	    twolevelprompt='$([ "$PWD" != "${PWD%/*/*/*}" ] && echo "/...${PWD##${PWD%/*/*}}" || echo "$PWD")'
	    gitprompt='$(__git_ps1 "[%s]")'
	    export PS1="\[$txtylw\] $PWD\[$fgcolor\]$gitprompt"'\ $ '
	    fi

export PS1
