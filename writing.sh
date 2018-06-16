#!/usr/bin/env bash


i3-msg "workspace 9; append_layout ~/.config/dotfiles/thing.json"

sleep 0.5
i3-msg "workspace 9; exec urxvt -e bash -c 'vim && bash'"

sleep 0.2
i3-msg "workspace 9; exec urxvt -e bash -c 'vim ~/Dropbox/WritingTools/zotero-library.bib && bash'"

sleep 0.2
i3-msg "workspace 9; exec urxvt -e bash -c 'ranger && bash'"
