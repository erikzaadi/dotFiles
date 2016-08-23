export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ ! -f ~/.antigen/antigen.zsh ] && git clone https://github.com/zsh-users/antigen ~/.antigen
[ ! -f ~/.zsh-theme/erikzaadi.zsh-theme ] && mkdir ~/.zsh-theme && curl -s https://raw.githubusercontent.com/erikzaadi/dotFiles/master/zsh/remote.zsh-theme ~/.zsh-theme/erikzaadi.zsh-theme

autoload -U compinit
compinit
autoload -U bashcompinit
bashcompinit

source ~/.antigen/antigen.zsh

antigen use oh-my-zsh
# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen-bundles <<EOBUNDLES
zsh-users/zsh-syntax-highlighting
zsh-users/zsh-completions src
git
ssh-agent
docker
aws
command-not-found
cp
extract
redis-cli

EOBUNDLES

# Load my theme.
antigen-theme ~/.zsh-theme erikzaadi

antigen-apply


alias chuck='sudo'

export TERM=xterm-256color
export EDITOR=vim
autoload -U zmv
alias mmv='noglob zmv -W'
alias :q=exit #https://coderwall.com/p/fdtaia?&p=2&q=
alias :e=vim
alias edit=vim
alias e=vim

fpath=(/usr/local/share/zsh-completions $fpath)

# Solarized FZF
export FZF_DEFAULT_OPTS='
--bind ctrl-f:page-down,ctrl-b:page-up
--color dark,hl:33,hl+:37,fg+:235,bg+:136,fg+:254
--color info:254,prompt:37,spinner:108,pointer:235,marker:235
'

source /etc/profile.d/tmuxify.sh

