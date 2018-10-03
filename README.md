# reveal_brew
in terminal, quickly open the git project in default browser.

![reveal gif](https://github.com/MichaelDimmitt/gh_reveal/blob/master/assets/how_reveal_works_my_environment.gif)

## Simple installation:
### posix compliant attempt
put the below in your terminal and you are all set up.

## Installation

```bash
temp_shell=$(echo $0 | sed 's/-//')
{
cat<<\EOF
unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=xdg-open;;
    Darwin*)    machine=open;;
    CYGWIN*)    machine=cygstart;;
    MINGW*)     machine=start;;
    *)          machine="UNKNOWN:${unameOut}"
esac
reveal() {
  [[ ! -d .git ]] && echo "Not git dir" >&2 && return 1;
  echo "$(
    git remote -v | grep 'heroku' | grep fetch | grep -o -E ':.*' | 
    cut -c 19- | awk '{print $1}' | sed 's/.git$//' | 
    xargs -I {} open https://dashboard.heroku.com/apps/{} https://{}.herokuapp.com
  )"
  echo "$(
    git remote -v | grep '@'  | grep -o -E '@.*' | cut -c 2-;
    git remote -v | grep '//' | grep -o -E ':.*' | cut -c 4- | grep -v 'heroku';
  )" | grep fetch |  sed -e $'s/:/\\//g' |  awk '{print $1}' | sed 's/.git$//' | xargs -I {} open https://www.{}
}
EOF
} >> ~/."$temp_shell"rc
source ~/."$temp_shell"rc

```

## Implementation

`reveal`

<b>want to reveal all of your projects in a given directory?</b><br/>
`for d in ./*/ ; do (cd "$d" && echo "$d" && reveal); done`<br/>
<b>or as with my environment  maybe all of your projects are in a folder that is subdivided by category folders.</b><br/>
`for d in ./*/ ; do (cd "$d" && echo "$d" &&  for p in ./*/ ; do (cd "$p" && echo "$p" && reveal); done); done`


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
```git remote -v```
gather's all <b>remotes</b> for project 
<br>and proceeds to  filter the output into url's
<br>piping each as a unique url opens all the stuff.
