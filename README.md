# reveal_brew
in terminal, quickly open the git project in default browser.

## Install with Homebrew (macintosh computers):
```
brew tap michaeldimmitt/reveal &&
brew install reveal;
```

## Implementation

`reveal`

<b>want to reveal all of your projects in a given directory?</b><br/>
`for d in ./*/ ; do (cd "$d" && echo "$d" && reveal); done`<br/>

<b>or as with my environment  maybe all of your projects are in a folder that is subdivided by category folders.</b><br/>
`for d in ./*/ ; do (cd "$d" && echo "$d" &&  for p in ./*/ ; do (cd "$p" && echo "$p" && reveal); done); done`

![reveal gif](https://github.com/MichaelDimmitt/assets_used_by_other_repos/blob/master/assets/how_reveal_works_my_environment.gif)

## Additional Examples
Reveal takes a <b>single command line argument</b>.
<br>This argument is the <b>remote</b> you would like to open for the current directory git project.
<br>If no <b>remote</b> is specified it will reveal all remotes on the project in the browser.
<br>For most users this is just the one <b>remote</b> either <b>gitlab</b> or github (<b>origin</b>).

1) `reveal origin`
2) `reveal gitlab`
3) `reveal <your remote name here>`

Not sure what <b>remote</b> means? (context .git)
<br>cd into your git project and type `git remote -v`


## How does it work?
through the use of command:
```
git remote -v
```
gather's all <b>remotes</b> for project
<br>and proceeds to  filter the output into url's
<br>piping each as a unique url opens all the stuff.

## Install as oh-my-zsh plugin
```bash
git clone https://github.com/MichaelDimmitt/gh_reveal.git ~/.oh-my-zsh/custom/plugins/gh_reveal
```
add gh_reveal to plugins array in `~/.zshrc` like so
`plugins=(gh_reveal git zsh-more-completions)`


## Alternative install/uninstall experience:
Clone and cd into the project:
```bash
git clone https://github.com/MichaelDimmitt/gh_reveal.git && cd gh_reveal;
```

install
```bash
./install.sh;
```

uninstall
```bash
./uninstall.sh
```

