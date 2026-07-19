#!/bin/bash

SESSION=home
ROOT=~

tmux has-session -t $SESSION 2>/dev/null && exec tmux attach -t $SESSION

tmux new-session -d -s $SESSION -n root
tmux send-keys -t $SESSION:root "cd $ROOT" C-m

tmux new-window -t $SESSION -n local-llm
tmux split-window -t $SESSION:local-llm -h
tmux send-keys -t $SESSION:local-llm.1 "cd $ROOT" C-m
tmux send-keys -t $SESSION:local-llm.1 "ollama serve" C-m
tmux send-keys -t $SESSION:local-llm.2 "cd $ROOT" C-m
tmux send-keys -t $SESSION:local-llm.2 "ollama ls"
