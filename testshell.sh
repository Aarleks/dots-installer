#!/usr/bin/env bash


i3-msg "workspace 7; append_layout ~/.config/dotfiles/thing.json"

sleep 1
i3-msg "workspace 7; exec urxvt -e bash -c 'cmatrix && bash'"

sleep 0.5
i3-msg "workspace 7; exec urxvt -e bash -c 'neofetch && bash'"

sleep 0.5
i3-msg "workspace 7; exec urxvt -e bash -c 'ranger && bash'"
