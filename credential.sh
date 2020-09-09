check_bin_folder_and_authenticate(){
if [ -d /usr/local/bin ]; then $1 > /dev/null 2>&1 ||
  (echo "$(whoami), permission was denied. Credentials required for sudo command." &&  [ "$UID" -eq 0 ] || exec sudo -k "$0" "$@") || return 1
else
  echo 'dir not present, please open an issue on github https://github.com/MichaelDimmitt/gh_reveal, thanks!'
  return 1
fi
}
