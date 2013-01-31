#!/bin/bash
socket="$HOME/`whoami`-shared"

eval tmux has-session -t shared > /dev/null 2>&1
if [ $? != 1 ]; then
    tmux -S $socket attach
    exit
fi

tmux -S $socket new-session -d "ssh workstation -t 'tmux -2 attach'"
tmux -S $socket set -g status off

tmux -S $socket attach-session
