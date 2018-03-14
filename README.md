# reveal_brew
will quickly open the github repo from the remote passed in or default to origin

how to see all three executions at work.

## Simple installation:

```bash
echo 'reveal() { url=$(git remote -v | grep "$1" | grep fetch | cut -c 8- | rev | cut -c 13- | rev );open $url;}; alias reveal="reveal ' >> ~/.bashrc; source ~/.bashrc
```


## Old school posix compliant Installation and implementation to run all three conditions.
```bash
git clone https://github.com/MichaelDimmitt/reveal_brew.git;
```

```bash
cd reveal_brew;
```

```bash
chmod 777 remote_script.sh;
```

```bash
pathtofile=pwd; echo "alias reveal='$($pathtofile)/./remote_script.sh origin'" >> ~/.bashrc; source ~/.bashrc;
```

## Implementation
```bash 
cd project;
reveal;
```
