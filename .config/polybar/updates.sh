#!/bin/sh
pacman=$(checkupdates 2>/dev/null | wc -l)
aur=$(pacaur -k 2>/dev/null | wc -l)
out=""
out="${out}P: ${pacman} "
out="${out}A: ${aur} "
echo "${out%?}"
