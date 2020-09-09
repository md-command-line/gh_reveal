#!/usr/bin/env bash
source ./credential.sh
install(){
    curl -fsSL -o /usr/local/bin/reveal https://raw.githubusercontent.com/md-command-line/gh_reveal/master/bin/reveal &&
    chmod +x /usr/local/bin/reveal
}
check_bin_folder_and_authenticate install &&
    printf "\u2714 Successfully installed /usr/local/bin/reveal!\n" ||
    printf "\u2718 usr/local/bin/reveal uninstall failed.\n" >&2
