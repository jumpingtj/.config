#!/usr/bin/env bash

if [[ \
    "$(aerospace list-windows --focused --format '%{app-name}')" == "kitty" \
    && \
    "$(tmux display-message -p '#{pane_at_right}')" == "0" \
]]
then
    tmux select-pane -R
else
    aerospace focus right
fi
