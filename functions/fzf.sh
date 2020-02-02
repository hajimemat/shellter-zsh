# FZFを利用した関数
function s() {
    local layout
    layout=$(ls -1 ~/.screenlayout | fzf --prompt='Layout >')
    sh ~/.screenlayout/$layout
    sh ~/.config/polybar/launch.sh 2> /dev/null 1> /dev/null
}
alias cdf='fzf-cdr'
function fzf-cdr() {
    target_dir=`cdr -l | sed 's/^[^ ][^ ]*  *//' | fzf`
    target_dir=`echo ${target_dir/\~/$HOME}`
    if [ -n "$target_dir" ]; then
        cd $target_dir
    fi
}
# agの結果をfzfで絞り込み選択するとvimで開く
alias agf="_agAndVim"
function _agAndVim() {
    if [ -z "$1" ]; then
        echo 'Usage: agf PATTERN'
        return 0
    fi
    result=`ag $1 | fzf`
    line=`echo "$result" | awk -F ':' '{print $2}'`
    file=`echo "$result" | awk -F ':' '{print $1}'`
    if [ -n "$file" ]; then
        vim $file +$line
    fi
}
# git checkout branchをfzfで選択
alias co='git checkout $(git branch -a | tr -d " " |fzf --height 100% --prompt "CHECKOUT BRANCH>" --preview "git log --color=always {}" | head -n 1 | sed -e "s/^\*\s*//g" | perl -pe "s/remotes\/origin\///g")'

alias sshf="_fzf_ssh"
function _fzf_ssh() {

	result=`cat ~/.ssh/config | grep Host\  | awk '{print $2}' | fzf`
	if [ -n "$result" ]
	then
		ssh $result
	fi
}
function f() {
  local project dir repository session current_session
  project=$(ghq list | fzf --prompt='Project >')

  if [[ $project == "" ]]; then
    return 1
  fi
  dir=$(ghq root)/${project}
  cd $dir
}

# TmuxSessionJump
function t() {
  local session
  session=$(tmux list-session | fzf --prompt='Session >' | awk -F: '{print $1}')
  if [[ ! -z ${TMUX} ]]; then
      tmux switch-client -t $session
  else
      tmux a -t $session
  fi
}
# TmuxSessionCreate
function tm() {
    local session
    session=${${1:-$(pwd)}//./-}
    tmux list-sessions | cut -d":" -f1 | grep -e "^$session\$" > /dev/null
    if [[ $? != 0 ]]; then
        tmux new-session -d -c $(pwd) -s $session
    fi
    tmux switch-client -t $session
}

function pacf() {
    local pac

    if [ -z "$1" ]; then
        echo 'Usage: pacf PATTERN'
        return 0
    fi
    result=`yay -Ss $1 | fzf`
    if [ -n "$result" ]; then
        yay -S $(echo $result | awk '{print $1}')
    fi
}

function vif() {
    local file

    result=`fzf`
    if [ -n "$result" ]; then
        vi $result
    fi
}
