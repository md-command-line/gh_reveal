#!/usr/bin/env bash
source ./credential.sh
uninstall(){
  rm -rf /usr/local/bin/reveal 
}

check_bin_folder_and_authenticate uninstall &&
    printf "\u2714 /usr/local/bin/reveal successfully uninstalled.\n" ||
    printf "\u2718 /usr/local/bin/reveal uninstall failed.\n" >&2
