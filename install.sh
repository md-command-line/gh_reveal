source ./credential.sh
install(){
  curl -fsSL -o /usr/local/bin/reveal https://raw.githubusercontent.com/MenkeTechnologies/gh_reveal/master/reveal.sh &&
  echo 'reveal "$@"' >> /usr/local/bin/reveal &&
  chmod +x /usr/local/bin/reveal;
}
check_bin_folder_and_authenticate install
