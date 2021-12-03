function git_prompt_info() {
  # If we are on a folder not tracked by git, get out.
  # Otherwise, check for hide-info at global and local repository level
  if ! __git_prompt_git rev-parse --git-dir &> /dev/null \
     || [[ "$(__git_prompt_git config --get oh-my-zsh.hide-info 2>/dev/null)" == 1 ]]; then
    return 0
  fi

  local ref
  ref=$(__git_prompt_git symbolic-ref --short HEAD 2> /dev/null) \
  || ref=$(__git_prompt_git rev-parse --short HEAD 2> /dev/null) \
  || return 0

  # ====================== CUSTOM CODE ======================
  # Truncate the git branch name if longer than the value set on the global Git config
  # for oh-my-zsh.max-branch-length. If not set the default is 40.
  local max_length
  max_length=$(__git_prompt_git config --get oh-my-zsh.max-branch-length 2>/dev/null)

  if [[ -z ${max_length} ]]; then
    max_length=40
  fi

  local ref_length
  ref_length=${#ref}

  if [[ ${ref_length} -gt ${max_length} ]]; then
    ref="${ref:0:$max_length}..."
  fi
  # ==================== END CUSTOM CODE ====================

  # Use global ZSH_THEME_GIT_SHOW_UPSTREAM=1 for including upstream remote info
  local upstream
  if (( ${+ZSH_THEME_GIT_SHOW_UPSTREAM} )); then
    upstream=$(__git_prompt_git rev-parse --abbrev-ref --symbolic-full-name "@{upstream}" 2>/dev/null) \
    && upstream=" -> ${upstream}"
  fi

  echo "${ZSH_THEME_GIT_PROMPT_PREFIX}${ref}${upstream}$(parse_git_dirty)${ZSH_THEME_GIT_PROMPT_SUFFIX}"
}
