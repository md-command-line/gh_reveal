reveal() {
    OS="$(uname -s)"
    case "$OS" in
        Linux*)     open_cmd=xdg-open;;
        Darwin*)    open_cmd=open;;
        CYGWIN*)    open_cmd=cygstart;;
        MINGW*)     open_cmd=start;;
        *)          echo "Your OS: $OS is unsupported..." >&2 && return 2;;
    esac

    [[ ! -d .git ]] && echo "Not a git directory" >&2 && return 1

    command git remote -v | command grep "$1" | command grep 'heroku' | command grep fetch | command grep -o -E ':.*' | \
    cut -c 19- | command awk '{print $1}' | command sed 's@.git$@@' | \
    command xargs -I {} "$open_cmd" https://dashboard.heroku.com/apps/{} https://{}.herokuapp.com

  {
    command git remote -v | command grep "$1" | command grep '@'  | command grep -o -E '@.*' | cut -c 2-
    command git remote -v | command grep "$1" | command grep '//' | command grep -o -E ':.*' | cut -c 4- | command grep -v 'heroku'
  } | command grep fetch | command sed 's@:/\\@@g' | command awk '{print $1}' | sed 's@.git$@@' | command xargs -I {} "$open_cmd" https://www.{}
}
