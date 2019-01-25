#!/usr/bin/env bash
source ./credential.sh
uninstall(){
  rm -rf /usr/local/bin/reveal
}

check_bin_folder_and_authenticate uninstall
