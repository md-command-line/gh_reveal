default_first_alphebetical() {
  url=$(git remote -v | sed -n 1p | grep fetch | cut -c 8- | sed '/\n/!G;s/\(.\)\(.*\n\)/&\2\1/;//D;s/.//' | cut -c 13- | sed '/\n/!G;s/\(.\)\(.*\n\)/&\2\1/;//D;s/.//')
  open $url
}
pass_in_remote() {
  url=$(git remote -v | grep "$1" | grep fetch | cut -c 8- | sed '/\n/!G;s/\(.\)\(.*\n\)/&\2\1/;//D;s/.//' | cut -c 13- | sed '/\n/!G;s/\(.\)\(.*\n\)/&\2\1/;//D;s/.//')
  open $url
}
default_to_origin() {
  url=$(git remote -v | grep origin | grep fetch | cut -c 8- | sed '/\n/!G;s/\(.\)\(.*\n\)/&\2\1/;//D;s/.//' | cut -c 13- | sed '/\n/!G;s/\(.\)\(.*\n\)/&\2\1/;//D;s/.//')
  open $url
}

default_first_alphebetical
pass_in_remote
default_to_origin
