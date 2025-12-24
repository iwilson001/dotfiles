#!/bin/bash

SESSION=nvim-config
ROOT=~/.config/nvim/

tmux has-session -t $SESSION 2>/dev/null && exec tmux attach -t $SESSION

tmux new-session -d -s $SESSION -n root
tmux send-keys -t $SESSION:root "cd $ROOT" C-m

tmux new-window -t $SESSION -n vim
tmux send-keys -t $SESSION:vim "cd $ROOT && nvim" C-m

tmux attach -t $SESSION
