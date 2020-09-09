#!/usr/bin/env bash
source ./credential.sh
install(){
    curl -fsSL -o /usr/local/bin/reveal https://raw.githubusercontent.com/md-command-line/gh_reveal/master/bin/reveal &&
    chmod +x /usr/local/bin/reveal &&
    echo "Successfully installed /usr/local/bin/reveal!" ||
    echo "usr/local/bin/reveal uninstall failed" >&2
}
check_bin_folder_and_authenticate install
