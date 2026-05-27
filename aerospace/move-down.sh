#!/usr/bin/env bash

if [[ \
    "$(aerospace list-windows --focused --format '%{app-name}')" == "kitty" \
    && \
    "$(tmux display-message -p '#{pane_at_bottom}')" == "0" \
]]
then
    tmux select-pane -D
else
    aerospace focus down
fi
