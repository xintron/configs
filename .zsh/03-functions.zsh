mkcd () {
    mkdir "$@" && cd "${@[-1]}"
}
compdef mkcd=mkdir

gfp () {
    git fetch "$1" "pull/$2/head:pr-$2"
}
compdef _git gfp=git-fetch
