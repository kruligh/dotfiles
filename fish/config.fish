set -g -x fish_greeting 'dont be shellfish'

# ----- Alias
alias v 'vim'
alias vf 'vim (fzf)'
alias g 'git'
alias gs 'git status'
alias gc 'git checkout'
alias xcp 'xclip -selection c'

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /home/kruligh/src/veri/ipfs-data/node_modules/tabtab/.completions/serverless.fish ]; and . /home/kruligh/src/veri/ipfs-data/node_modules/tabtab/.completions/serverless.fish
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /home/kruligh/src/veri/ipfs-data/node_modules/tabtab/.completions/sls.fish ]; and . /home/kruligh/src/veri/ipfs-data/node_modules/tabtab/.completions/sls.fish

source /home/kruligh/anaconda3/etc/fish/conf.d/conda.fish


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval (eval /home/kruligh/anaconda3/bin/conda "shell.fish" "hook")
# <<< conda initialize <<<

set PATH /home/kruligh/anaconda3/bin/ $PATH
set PATH /home/linuxbrew/.linuxbrew/bin/ $PATH

# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[ -f /home/kruligh/src/secuvy/backend/cognito/node_modules/tabtab/.completions/slss.fish ]; and . /home/kruligh/src/secuvy/backend/cognito/node_modules/tabtab/.completions/slss.fish

