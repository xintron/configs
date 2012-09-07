#!/usr/bin/env sh

max_len=40
data=`dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify / org.freedesktop.MediaPlayer2.GetMetadata 2>/dev/null`
if [ "$?" -eq 0 ] && [ -n "$data" ]; then
    state=$(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'PlaybackStatus' | grep -o 'Playing')
    if [ -n "$state" ]; then
        artist=$(echo "$data" | sed -n '/xesam:artist/,+2 {/xesam/d; s/^.*string "\([^"]\+\)".*$/\1/p}')
        title=$(echo "$data" | sed -n '/xesam:title/,+1 s/^.*variant.*string "\([^"]\+\)".*$/\1/p')
        meta="${artist} - ${title}"
        if [ "$(echo "$meta" | wc -m)" -gt "$max_len" ]; then
            echo -n "np: $(echo -n "$meta" | cut -c1-"$max_len")..."
        else
            echo -n "np: ${artist} - ${title}" | cut -c1-"$max_len"
        fi
    fi
fi
