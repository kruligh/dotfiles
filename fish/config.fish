set -g -x fish_greeting 'dont be shellfish'

# ----- Alias
alias v 'vim'
alias vf 'vim (fzf)'
alias g 'git'
alias gs 'git status'
alias gc 'git checkout'
alias xcp 'xclip -selection c'


# ------ Path
set PATH /home/kruligh/development/flutter/bin $PATH
set PATH /home/kruligh/development/bin $PATH

function tt
    set -l title $argv[1]
    function fish_title --inherit-variable title
        echo "$title"
    end
end
