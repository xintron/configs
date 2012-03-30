local -a VIM MPLAYER FEH

VIM=(bash c cfg conf cpp css csv diff git gitignore go h hs htm html info ini java js json lisp log lua markdown md mkd nfo pacnew patch php pid PKGBUILD pl py rb sed sh tex theme txt vim xml zsh)
MPLAYER=(avi flac flv mkv mov mp3 mp4 mpeg mov mpg wmv)
FEH=(bmp gif ico jpeg jpg png svg)

alias -s $^VIM='vim --'
alias -s $^MPLAYER='mplayer --'
alias -s $^FEH='feh --'
