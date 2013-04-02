autoload -Uz colors
colors
setopt prompt_subst

autoload -Uz vcs_info
zstyle ":vcs_info:*" formats "%r(%b)"
zstyle ":vcs_info:*" actionformats "%r(%b|%a)"
precmd () {
  psvar=()
  LANG=en_US.UTF-8 vcs_info
  [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

PROMPT="%{${fg[cyan]}%}%n %B%{${fg[red]}%}%~ %{${fg[yellow]}%}%1v%{${reset_color}%}%b
%{${fg[green]}%}%(!.#.$)%{${reset_color}%} "
RPROMPT=""

autoload -U compinit
compinit

HISTFILE=${HOME}/.zsh-history
HISTSIZE=1000000
SAVEHIST=1000000
setopt hist_ignore_dups
setopt extended_history
setopt share_history

alias g=git
alias ls="ls -G"

function gg() {
  git grep -n $1
}

export PATH="/usr/local/sbin:$HOME/.rbenv/bin:$PATH"
export RSENSE_HOME=$HOME/.vim/ref/rsense-0.3
export SVN_SSH="ssh -i ~/.ssh/id_rsa -p 10022"
export GIT_EDITOR="/usr/bin/vim"
eval "$(rbenv init -)"
