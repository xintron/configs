#!/bin/bash

status=$(playerctl status)
if [[ $? == 0 ]] && [[ "$status" == "Playing" ]]; then
    echo "$(playerctl metadata artist) - $(playerctl metadata title)"
fi
