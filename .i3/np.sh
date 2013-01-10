#!/usr/bin/env zsh

max_len=42
np=$(mpc --format "np: [[[%artist%] - ][%title%][ - #[[%album%] ##[%track%]#]]]|[%file%]" | head -n1)
if [ -n "$np" -a ! "${np:0:6}" = "volume" ]; then
    if [ ${#np} -gt $max_len ]; then
        echo -n "${np:0:$max_len}..."
    else
        echo -n $np
    fi
fi
