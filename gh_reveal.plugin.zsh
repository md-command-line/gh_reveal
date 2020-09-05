0="${${0:#$ZSH_ARGZERO}:-${(%):-%N}}"
0="${${(M)0:#/*}:-$PWD/$0}"

fpath+="${0:h}/bin"
autoload -Uz reveal
