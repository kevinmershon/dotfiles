#!/bin/bash
. ~/.bashrc
eval tmux has-session -t work > /dev/null 2>&1
if [ $? != 1 ]; then
    tmux -2 attach -t work
    exit
fi
cd ~/workspace
login # from bashrc
tmux new-session -d -s work
tmux set -g base-index 1
tmux new-window -t work:1 -n 'Bash' bash
tmux kill-window -t work:0

kernel=`uname`
if [ "$kernel" == "Linux" ]; then
    tmux new-window -t work:2 -n 'Vim' "gvim -v"
elif [ "$kernel" == "Darwin" ]; then
    tmux new-window -t work:2 -n 'Vim' "vim"
fi

tmux join-pane -v -s work:2 -t work:1
tmux select-window -t work:1
tmux select-pane -t 1
tmux -2 attach-session -t work \; resize-pane -t 0 -y 12
