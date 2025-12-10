_fishy_collapsed_wd() {
  if [[ $PWD = $HOME ]]; then
    echo "~"
  else
    echo "${PWD:t}"
  fi
}

precmd() {
  print -n -- "\e[5 q"
}

local user_color='green'; [ $UID -eq 0 ] && user_color='red'
local host_color='white'; [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ] && host_color='yellow'
PROMPT='%{$fg[$user_color]%}$(_fishy_collapsed_wd)%{$reset_color%}%(!.#. >) '
PROMPT2='%{$fg[red]%}\ %{$reset_color%}'
local return_status="%{$fg_bold[red]%}%(?..%?)%{$reset_color%}"
RPROMPT="${RPROMPT}"'${return_status}$(git_prompt_info)$(git_prompt_status)%{$reset_color%}'
ZSH_THEME_GIT_PROMPT_PREFIX=" "
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[green]%}!"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_ADDED=""
ZSH_THEME_GIT_PROMPT_MODIFIED=""
ZSH_THEME_GIT_PROMPT_DELETED=""
ZSH_THEME_GIT_PROMPT_RENAMED=""
ZSH_THEME_GIT_PROMPT_UNMERGED=""
ZSH_THEME_GIT_PROMPT_UNTRACKED=""
