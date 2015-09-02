mkcd () {
    mkdir "$@" && cd "${@[-1]}"
}
compdef mkcd=mkdir

sshrc () {
    local SSHHOME=${SSHHOME:-$HOME}
    if [ -f $SSHHOME/.sshrc ]; then
        local files=.sshrc
        # Add extra files to send to remote
        [ -d $SSHHOME/.sshrc.d ] && files="$files .sshrc.d"

        local rebuild=0
        if [ -f $SSHHOME/sshrc.tar.gz ]; then
            for f in $=files; do
                [ -n "$(find -L $SSHHOME/$f -newer $SSHHOME/sshrc.tar.gz)" ] && rebuild=1
            done
        else
            rebuild=1
        fi
        if [ "$rebuild" = "1" ]; then
            echo "Rebuilding config cache"
            tar czf $SSHHOME/sshrc.tar.gz -h -C $SSHHOME $=files
        fi
        scp $SSHHOME/sshrc.tar.gz "${@[-1]}:sshrc.tar.gz"
        ssh -t "$@" "
        export SSHHOME=\$(mktemp -d -t .$(whoami).XXXX)
        tar xmz -C \$SSHHOME -f \$HOME/sshrc.tar.gz
        ZDOTDIR=\$SSHHOME/.sshrc.d zsh
        rm -rf \$SSHHOME \$HOME/sshrc.tar.gz
        "
    else
        echo "No such file: $HOME/.sshrc"
    fi
}
compdef _ssh_hosts sshrc
