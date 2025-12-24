#!/bin/bash

SESSION=home
ROOT=~

tmux has-session -t $SESSION 2>/dev/null && exec tmux attach -t $SESSION

tmux new-session -d -s $SESSION -n root
tmux send-keys -t $SESSION:root "cd $ROOT" C-m

tmux attach -t $SESSION
