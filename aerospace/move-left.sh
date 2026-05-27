#!/usr/bin/env bash

if [[ \
    "$(aerospace list-windows --focused --format '%{app-name}')" == "kitty" \
    && \
    "$(tmux display-message -p '#{pane_at_left}')" == "0" \
]]
then
    tmux select-pane -L
else
    aerospace focus left
fi
