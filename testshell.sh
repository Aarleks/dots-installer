#!/usr/bin/env bash


i3-msg "workspace 5; append_layout /home/alex/.config/i3/thing.json"

sleep 1
i3-msg "workspace 5; exec st -e bash -c 'vim .config/i3/config && bash'"

sleep 0.5
i3-msg "workspace 5; exec st -e bash -c 'neofetch && bash'"

sleep 0.5
i3-msg "workspace 5; exec st -e bash -c 'cmatrix && bash'"
