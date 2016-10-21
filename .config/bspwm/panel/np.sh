#!/bin/bash

status=$(playerctl status 2>/dev/null)
if [[ $? == 0 ]] && [[ "$status" == "Playing" ]]; then
    echo "$(playerctl metadata artist) - $(playerctl metadata title)"
fi
