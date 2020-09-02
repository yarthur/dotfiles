source $ZSH/themes/agnoster.zsh-theme

prompt_dir(){
  git_root=$PWD
  while [[ $git_root != / && ! -e $git_root/.git ]]; do
    git_root=$git_root:h
  done
  if [[ $git_root = / ]]; then
    unset git_root
    prompt_short_dir=%~
  else
    parent=${git_root%\/*}
    prompt_short_dir=${PWD#$parent/}
  fi
  prompt_segment blue black $prompt_short_dir
}

git_ref_status(){
    local git_state=""
    local git_prompt_ahead="+"
    local git_prompt_behind="-"
    local num_ahead="$(git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' ')"
    local num_behind="$(git log --oneline ..@{u} 2> /dev/null | wc -l | tr -d ' ')"

    if [ "$num_ahead" -gt 0 ]; then
        git_state=${git_state}${git_prompt_ahead}${num_ahead}

        if [ "$num_behind" -gt 0 ]; then
            git_state=$git_state/
        fi
    fi

    if [ "$num_behind" -gt 0 ]; then
        git_state=${git_state}${git_prompt_behind}${num_behind}
    fi

    if [[ ! -z $git_state ]]; then
        git_state="[${git_state}]"
    fi

    echo -n $git_state
}


# Git: branch/detached head, dirty status
prompt_git() {
  (( $+commands[git] )) || return
  local PL_BRANCH_CHAR
  () {
    local LC_ALL="" LC_CTYPE="en_US.UTF-8"
    PL_BRANCH_CHAR=$'\uf418'         # 
  }
  local ref dirty mode repo_path git_remote_status
  repo_path=$(git rev-parse --git-dir 2>/dev/null)

  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    dirty=$(parse_git_dirty)
    ref=$(git symbolic-ref HEAD 2> /dev/null) || ref="\uf417 $(git rev-parse --short HEAD 2> /dev/null)"         # 
    if [[ -n $dirty ]]; then
      prompt_segment yellow black
    else
      prompt_segment green black
    fi

    if [[ -e "${repo_path}/BISECT_LOG" ]]; then
      mode=" <B>"
    elif [[ -e "${repo_path}/MERGE_HEAD" ]]; then
      mode=" \uf419"         # 
    elif [[ -e "${repo_path}/rebase" || -e "${repo_path}/rebase-apply" || -e "${repo_path}/rebase-merge" || -e "${repo_path}/../.dotest" ]]; then
      mode=" >R>"
    fi

	local git_state=" $(git_ref_status)"

    setopt promptsubst
    autoload -Uz vcs_info

    zstyle ':vcs_info:*' enable git
    zstyle ':vcs_info:*' get-revision true
    zstyle ':vcs_info:*' check-for-changes true
    zstyle ':vcs_info:*' stagedstr ' \uf44d'         # 
    zstyle ':vcs_info:*' unstagedstr ' \uf444'         # 
    zstyle ':vcs_info:*' formats '%u%c'
    zstyle ':vcs_info:*' actionformats '%u%c'
    vcs_info
    echo -n "${ref/refs\/heads\//$PL_BRANCH_CHAR }${git_state}${vcs_info_msg_0_%% }${mode}"
  fi
}

