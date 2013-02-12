#!/bin/bash
eval tmux has-session -t work > /dev/null 2>&1
if [ $? != 1 ]; then
    tmux -2 attach -t work
    exit
fi
tmux new-session -d -s work

kernel=`uname`
if [ "$kernel" == "Linux" ]; then
    tmux new-window -t work:1 -n 'Vim' "gvim -v"
elif [ "$kernel" == "Darwin" ]; then
    tmux new-window -t work:1 -n 'Vim' "mvim -v"
fi
tmux new-window -t work:2 -n 'Bash' bash
tmux new-window -t work:3 -n 'IRC' "ssh home-server -t 'tmux -2 attach-session -t irc'"
tmux kill-window -t work:0

tmux join-pane -h -s work:2 -t work:1
tmux join-pane -v -s work:3 -t work:1
tmux select-window -t work:1
tmux -2 attach-session -t work
