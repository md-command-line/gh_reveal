#!/usr/bin/env bash

echo $SHELL | grep -qi bash && shellrc=.bashrc
echo $SHELL | grep -qi zsh && shellrc=.zshrc

{
cat<<\EOF
reveal() {
    [[ ! -d .git ]] && echo "Not git dir" >&2 && return 1
    open "$(git remote -v | grep fetch | awk '{print $2}' | sed 's/.git$//')"
}
EOF
} >> ~/$shellrc

source ~/$shellrc
