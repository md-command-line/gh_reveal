#!/usr/bin/env bash
source ./credential.sh
install(){
  curl -fsSL -o /usr/local/bin/reveal https://raw.githubusercontent.com/michaeldimmitt/gh_reveal/master/bin/reveal &&
  chmod +x /usr/local/bin/reveal;
}
check_bin_folder_and_authenticate install
