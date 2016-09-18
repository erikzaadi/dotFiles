#based on bira

function theme_precmd {
     local TERMWIDTH
    (( TERMWIDTH = ${COLUMNS} - 1 ))

    MAC_HAND="✊"
    LINUX_CARET="➜"
    CARET_PREFIX=$LINUX_CARET

    #return_code="%(?..%{$fg[red]%}%? ↵ %{$reset_color%})"

    if [[ "$(uname)" = "Darwin" ]]
        then
            CARET_PREFIX=$MAC_HAND
    fi
    if [[ "$(which random_emoticon > /dev/null || echo 'NOT')" != "NOT" ]]
       then
            CARET_PREFIX="${CARET_PREFIX}  $(random_emoticon)"
    fi


    ###
    # Truncate the path if it's too long.

    PR_PWDLEN=""

    local promptsize=${#${(%):--()--}}
    local pwdsize=${#${(%):-%~}}

    if [[ "$promptsize + $pwdsize" -gt $TERMWIDTH ]]; then
      ((PR_PWDLEN=$TERMWIDTH - $promptsize))
    else
      PR_FILLBAR="\${(l.(($TERMWIDTH - ($promptsize + $pwdsize)))...)}"
    fi

}


setopt extended_glob
theme_preexec () {
    if [[ "$TERM" == "screen" ]]; then
	local CMD=${1[(wr)^(*=*|sudo|-*)]}
	echo -n "\ek$CMD\e\\"
    fi
}


setprompt () {
    ###
    # Need this so the prompt will work.

    setopt prompt_subst


    ###
    # See if we can use colors.

    autoload colors zsh/terminfo
    if [[ "$terminfo[colors]" -ge 8 ]]; then
        colors
    fi
    for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE GREY; do
        eval PR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
        eval PR_LIGHT_$color='%{$fg[${(L)color}]%}'
        (( count = $count + 1 ))
    done
    PR_NO_COLOUR="%{$terminfo[sgr0]%}"

    ###
    # Modify Git prompt
    ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}("
    ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
    ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg[green]%}"
    ZSH_THEME_GIT_PROMPT_UNTRACKED=" %{$fg[cyan]%}✭"
    ZSH_THEME_GIT_PROMPT_SEPARATOR=" |"
    ZSH_THEME_GIT_PROMPT_STAGED=" %{$fg[yellow]%}%{● %G%}"
    ZSH_THEME_GIT_PROMPT_CONFLICTS=" %{$fg[red]%}%{✖ %G%}"
    ZSH_THEME_GIT_PROMPT_CHANGED=" %{$fg[green]%}%{✚ %G%}"
    ZSH_THEME_GIT_PROMPT_BEHIND=" %{$fg[red]↓ ${%G%}"
    ZSH_THEME_GIT_PROMPT_AHEAD=" %{$fg[magenta]↑ %G%}"
    ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}%{✔ %G%}"

    ###
    # See if we can use extended characters to look nicer.

    typeset -A altchar
    set -A altchar ${(s..)terminfo[acsc]}
    PR_SET_CHARSET="%{$terminfo[enacs]%}"
    PR_SHIFT_IN="%{$terminfo[smacs]%}"
    PR_SHIFT_OUT="%{$terminfo[rmacs]%}"

    ###
    # Decide whether to set a screen title
    if [[ "$TERM" == "screen" ]]; then
	PR_STITLE=$'%{\ekzsh\e\\%}'
    else
	PR_STITLE=''
    fi


    ###
    # Finally, the prompt.

    PROMPT='$PR_SET_CHARSET$PR_STITLE${(e)}\
$PR_CYAN$PR_SHIFT_IN$PR_SHIFT_OUT$PR_WHITE(\
$PR_GREEN%$PR_PWDLEN<...<%~%<<\
$PR_WHITE)$PR_CYAN$PR_SHIFT_IN${(e)PR_FILLBAR}$PR_SHIFT_OUT$PR_GREY$PR_CYAN$PR_SHIFT_IN$PR_SHIFT_OUT\

$PR_CYAN$PR_SHIFT_IN$PR_BLUE$PR_SHIFT_OUT\
$PR_LIGHT_BLUE%{$reset_color%}`git_super_status`$PR_BLUE $PR_CYAN$PR_SHIFT_IN\
$PR_SHIFT_IN$PR_SHIFT_OUT\
$CARET_PREFIX$PR_NO_COLOUR '

    # display exitcode on the right when >0
    return_code="%(?..%{$fg[red]%}%? ↵ %{$reset_color%})"
    RPROMPT='`virtualenv_prompt_info` $return_code'

    PS2='$PR_CYAN$PR_SHIFT_IN$PR_SHIFT_OUT\
$PR_BLUE$PR_SHIFT_IN$PR_SHIFT_OUT(\
$PR_LIGHT_GREEN%_$PR_BLUE)$PR_SHIFT_IN$PR_SHIFT_OUT\
$PR_CYAN$PR_SHIFT_IN$PR_SHIFT_OUT$PR_NO_COLOUR '
}

setprompt

autoload -U add-zsh-hook
add-zsh-hook precmd  theme_precmd
add-zsh-hook preexec theme_preexec
