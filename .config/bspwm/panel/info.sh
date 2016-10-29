#!/bin/bash
PANEL_FIFO=${PANEL_FIFO:-/tmp/panel-fifo}

function battery() {
    while :; do
        batc=/sys/class/power_supply/BAT0/capacity
        bat=""
        if [ -f "$batc" ]; then
            case "$(cat /sys/class/power_supply/BAT0/status)" in
                "Charging" | "Full") bat="\uf0e7 ${bat}" ;;
                "Discharging") bat="\uf241 ${bat}" ;;
            esac
            bat="${bat}$(<$batc)"
            echo "SB$bat"
        fi

        sleep 10
    done
}

function clock() {
    while :; do
        echo "SD$(date +'%b %d')" > "$PANEL_FIFO"
        echo "ST$(date +'%H:%M:%S')" > "$PANEL_FIFO"
        sleep 1
    done
}

function load() {
    while :; do
        echo "SL$(cut -d' ' -f 1 /proc/loadavg)"
        sleep 3
    done
}

function music() {
    while :; do
        printf "SM%s\n" "$("$HOME"/.config/bspwm/panel/np.sh)"
        sleep 1
    done
}

function volume() {
    while :; do
        # This returns exit code 0 when muted and 1 when not muted. That's not
        # neat.
        ponymix is-muted
        [ "$?" -eq 1 ] && vol="\uf028" || vol="\uf026"
        echo "SV${vol} $(ponymix get-volume)%"
        sleep 1
    done
}

function checkUpdates() {
    while :; do
        pacman=$(checkupdates | wc -l)
        aur=$(pacaur -k | wc -l)
        out=""
        [ "$pacman" -gt 0 ] && out="${out}P: ${pacman} "
        [ "$aur" -gt 0 ] && out="${out}A: ${aur} "
        echo "SU${out%?}"
        sleep 120
    done
}


clock &
load > "$PANEL_FIFO" &
battery > "$PANEL_FIFO" &
music > "$PANEL_FIFO" &
volume > "$PANEL_FIFO" &
checkUpdates > "$PANEL_FIFO" &
