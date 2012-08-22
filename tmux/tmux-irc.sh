#!/bin/bash
if [ `tmux list-sessions | grep irc | wc -l` == "1" ]; then
    tmux -2 attach -t irc
    exit
fi
tmux new-session -d -s irc

tmux new-window -t irc:1 -n 'IRC' irssi
tmux kill-window -t irc:0

tmux select-window -t irc:1
