hash -d http=/usr/share/nginx/http
hash -d bin=$HOME/bin
if [ -d /mnt/files ]; then
    hash -d videos=/mnt/files/videos
    hash -d music=/mnt/files/music
fi
