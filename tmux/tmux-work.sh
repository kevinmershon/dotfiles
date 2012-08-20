#!/bin/bash
tmux new-session -d -s work

tmux new-window -t work:1 -n 'Vim' vim
tmux new-window -t work:2 -n 'Bash' bash
tmux new-window -t work:3 -n 'IRC' "ssh home-server -t 'tmux -2 attach-session -t irc'"
tmux kill-window -t work:0

tmux join-pane -h -s work:2 -t work:1
tmux join-pane -v -s work:3 -t work:1
tmux select-window -t work:1
tmux -2 attach-session -t work
