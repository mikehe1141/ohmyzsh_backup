local ret_status="%(?:%{$fg_bold[green]%}➜:%{$fg_bold[red]%}➜)"
PROMPT=$'%{$fg[green]%}mike %{$reset_color%}%{$BG[234]%}%{$FG[003]%}%1d%{$reset_color%} %{$FG[006]%}$(git_prompt_info)%{$reset_color%}
${ret_status}%{$reset_color%} '

PROMPT2="%{$fg_blod[black]%}%_> %{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[006]%}) %{$FG[001]%}Δ%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$FG[006]%})"
