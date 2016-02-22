#!/bin/bash

spacing='   '

function battery() {
    batc=/sys/class/power_supply/BAT0/capacity
    if [ -f "$batc" ]; then
        bat='\uf0e7 '
        case "$(cat /sys/class/power_supply/BAT0/status)" in
            "Charging") bat="${bat}+" ;;
            "Discharging") bat="${bat}-" ;;
        esac
        bat="${bat}$(<$batc)"
        printf '%%{F#222}%%{B#03a9f4}%s%s%s%%{B-}%%{F-}' \
            "$spacing" "$bat" "$spacing"
    fi
}

function clock() {
    printf '%%{F#222}%%{B#f44336}%s\uf017 %s%s%%{B-}%%{F-}' \
        "$spacing" "$(date +'%b %d, %H:%M:%S')" "$spacing"
}

function load() {
    printf '%%{F#222}%%{B#8bc34a}%s\uf0ae %s%s%%{B-}%%{F-}' \
        "$spacing" "$(cut -d' ' -f 1-3 /proc/loadavg)" "$spacing"
}


while :; do
    buf="S"
    i=0
    for f in "load" "battery" "clock"; do
        buf="${buf}$(eval "$f")"
        i=$((i + 1))
    done
    echo "$buf"
    sleep 1
done
