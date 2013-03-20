mkcd () {
    mkdir "$@" && cd "${@[-1]}"
}
compdef mkcd=mkdir
