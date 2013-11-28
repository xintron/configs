local -a MPLAYER FEH

MPLAYER=(avi flac flv mkv mov mp3 mp4 mpeg mov mpg wmv)
FEH=(bmp gif ico jpeg jpg png svg)

alias -s $^MPLAYER='mplayer --'
alias -s $^FEH='feh --'
