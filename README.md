# reveal_brew
in terminal, quickly open the git project in default browser.

## Simple installation:
put the below in your terminal and you are all set up.
```bash
echo 'reveal() { open $(git remote -v | grep fetch | awk '"'"'{print $2}'"'"' | sed '"'"'s/.git$//'"'"'); };' >> ~/.bashrc; source ~/.bashrc
```

## Implementation
```
reveal
```

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
