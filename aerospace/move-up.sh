#!/usr/bin/env bash

if [[ \
    "$(aerospace list-windows --focused --format '%{app-name}')" == "kitty" \
    && \
    "$(tmux display-message -p '#{pane_at_top}')" == "0" \
]]
then
    tmux select-pane -U
else
    aerospace focus up
fi
