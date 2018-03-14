  url=$(git remote -v | grep "$1" | grep fetch | cut -c 8- | sed '/\n/!G;s/\(.\)\(.*\n\)/&\2\1/;//D;s/.//' | cut -c 13- | sed '/\n/!G;s/\(.\)\(.*\n\)/&\2\1/;//D;s/.//')
  open $url
