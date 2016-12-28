#!/bin/sh
pacman=$(checkupdates 2>/dev/null | wc -l)
aur=$(pacaur -k 2>/dev/null | wc -l)
out=""
[ "$pacman" -gt 0 ] && out="${out}P: ${pacman} "
[ "$aur" -gt 0 ] && out="${out}A: ${aur} "
echo "${out%?}"
