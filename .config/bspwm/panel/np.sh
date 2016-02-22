#!/bin/bash

limit="$1"
if [ ! "$(playerctl status 2>&1 >/dev/null)" ]; then
    np="$(playerctl metadata artist) - $(playerctl metadata title)"
    [ "${#np}" -gt "$limit" ] && printf "%s\u2026" "${np:0:$limit}" || printf "%s" "${np}"
fi
