#!/usr/bin/env bash
source ./credential.sh
uninstall(){
  rm -rf /usr/local/bin/reveal && echo "/usr/local/bin/reveal successfully uninstalled." || echo "usr/local/bin/reveal uninstall failed" >&2
}

check_bin_folder_and_authenticate uninstall
