reveal() {
    set -x
    OS="$(uname -s)"
    case "$OS" in
        Linux*)     open_cmd=xdg-open;;
        Darwin*)    open_cmd=open;;
        CYGWIN*)    open_cmd=cygstart;;
        MINGW*)     open_cmd=start;;
        *)          open_cmd="UNKNOWN:$OS"
        echo "Your OS: $OS is unsupported..." >&2 && return 2;;
    esac

    [[ ! -d .git ]] && echo "Not a git directory" >&2 && return 1

    git remote -v | \grep "$1" | \grep 'heroku' | \grep fetch | \grep -o -E ':.*' | \
    cut -c 19- | awk '{print $1}' | sed 's@.git$@@' | \
    xargs -I {} "$open_cmd" https://dashboard.heroku.com/apps/{} https://{}.herokuapp.com

  {
    git remote -v | \grep "$1" | \grep '@'  | \grep -o -E '@.*' | cut -c 2-;
    git remote -v | \grep "$1" | \grep '//' | \grep -o -E ':.*' | cut -c 4- | \grep -v 'heroku';
  } | \grep fetch | sed 's@:/\\@@g' | awk '{print $1}' | sed 's@.git$@@' | xargs -I {} "$open_cmd" https://www.{}

set +x
}
