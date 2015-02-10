hash -d http=/usr/share/nginx/http
hash -d bin=$HOME/bin
[ -d /data/backups/ ] && hash -d backups=/data/backups
[ -d /data/main/ ] && hash -d data=/data/main
[ -d $HOME/code/work ] && hash -d work=$HOME/code/work
