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

alias k 'kubectl'
alias gcp 'gcloud'

# ------ Path
set PATH /home/kruligh/development/flutter/bin $PATH
set PATH /home/kruligh/development/bin $PATH
set PATH /home/kruligh/dotfiles/fish/scripts $PATH
set PATH /home/kruligh/dotfiles/bin $PATH
set PATH /home/linuxbrew/.linuxbrew/bin $PATH

# ------ Completions

set fish_complete_path /home/kruligh/dotfiles/fish/completions $fish_complete_path

# ------ terminal title
function tt
    set -l title $argv[1]
    function fish_title --inherit-variable title
        echo "$title"
    end
end

# ------ aws-bastion-ip
 function get-fargate-ssh-ip
   aws ec2 describe-network-interfaces --network-interface-ids (aws ecs describe-tasks --cluster $argv[1] --tasks (aws ecs list-tasks --cluster $argv[1] --query "taskArns" --output text --service-name ssh-server) --query "tasks[].attachments[].details[?name==`networkInterfaceId`].value" --output text) --query   "NetworkInterfaces[].Association.PublicIp" --output text
 end

function pr 
  set github_url (git remote -v | awk '/fetch/{print $2}' | sed -Ee 's#(git@|git://)#https://#' -e 's@com:@com/@' -e 's%\.git$%%' | awk '/github/');
  set branch_name (git symbolic-ref HEAD | cut -d"/" -f 3,4);
  set pr_url "$github_url/compare/master...$branch_name"
  echo "$pr_url"
  open $pr_url;
end


# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
