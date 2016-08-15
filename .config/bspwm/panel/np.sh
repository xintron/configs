#!/bin/bash

limit="$1"
status=$(playerctl status)
if [[ $? == 1 ]] || [[ "$status" == "Paused" ]]; then
    printf "\uf04c"
else
    np="\uf001 $(playerctl metadata artist) - $(playerctl metadata title)"
    [ "${#np}" -gt "$limit" ] && printf "%s\u2026" "${np:0:$limit}" || printf "%s" "${np}"
fi
