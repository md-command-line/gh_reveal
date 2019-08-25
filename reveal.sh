#!/usr/bin/env bash
reveal() {
  find_open_command_from_Operating_System() {
    local OS="$(uname -s)"
    case "$OS" in
      Linux*)     open_cmd=xdg-open;;
      Darwin*)    open_cmd=open;;
      CYGWIN*)    open_cmd=cygstart;;
      MINGW*)     open_cmd=start;;
      *)          echo "Your OS: $OS is unsupported..." >&2 && return 2;;
    esac
    echo $open_cmd
  }

  function no_git_dir_no_args() { # length of "$1" is zero and is not a git directory.
    if [[ -z "$1" ]] && ! command git rev-parse --git-dir 2> /dev/null 1>&2; then
      return 0
    else
      return 1
    fi
  }

  function no_git_dir_yes_args() { # length of "$1" is not zero and is not a git directory.
    if ! [[ -z "$1" ]] && ! command git rev-parse --git-dir 2> /dev/null 1>&2; then
      return 0
    else
      return 1
    fi
  }

  local open_cmd=$(find_open_command_from_Operating_System)
  local name=$(git config user.name)

  if no_git_dir_no_args $1; then
    "$open_cmd" "https://github.com/$name?tab=repositories"
    return 0
  elif no_git_dir_yes_args $1; then
    for dir in "$@" ; do ( builtin cd "$dir" && reveal; ) done
    return 0
  fi
    argValues="$*";
    command git remote -v | command grep -E "$(echo ${argValues/ /|})" | command grep 'heroku' | command grep fetch | command grep -o -E ':.*' | \
        cut -c 19- | command awk '{print $1}' | command sed 's@.git$@@' | \
        command xargs -I {} "$open_cmd" https://dashboard.heroku.com/apps/{} https://{}.herokuapp.com
    {
        command git remote -v | command grep -E "$(echo ${argValues/ /|})" | command grep '@'  | command grep -o -E '@.*' | cut -c 2-
        command git remote -v | command grep -E "$(echo ${argValues/ /|})" | command grep '//' | command grep -o -E ':.*' | cut -c 4- | command grep -v 'heroku'
    } | command grep fetch | command sed 's@:@\/@g' | command awk '{print $1}' | sed 's@.git@@' | command xargs -I {} "$open_cmd" https://www.{}
  echo 'reached'
}
