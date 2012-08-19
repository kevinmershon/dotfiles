#!/bin/bash
tmux new-session -d -s irc

tmux new-window -t irc:1 -n 'IRC' irssi
tmux kill-window -t irc:0

tmux select-window -t irc:1
