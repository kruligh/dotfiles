set -g -x fish_greeting 'dont be shellfish'

# ----- Alias
alias v 'vim'
alias vf 'vim (fzf)'
alias g 'git'
alias gs 'git status'
alias gc 'git checkout'
alias grc 'git rebase --continue'
alias xcp 'xclip -selection c'

alias tf 'terraform'
alias tfa 'terraform apply'
alias tfp 'terraform plan'

alias tf12 'terraform12'
alias tf12a 'terraform12 apply'
alias tf12p 'terraform12 plan'

# ------ Path
set PATH /home/kruligh/development/flutter/bin $PATH
set PATH /home/kruligh/development/bin $PATH

function tt
    set -l title $argv[1]
    function fish_title --inherit-variable title
        echo "$title"
    end
end
