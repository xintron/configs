# Author: Marcus Carlsson <hi@xintron.se>

# Variables
ZDOTDIR=${ZDOTDIR:-$HOME}
ZSH_HOME=$ZDOTDIR/.zsh
ZSH_THEME=minimal.theme

OSX=0
# Set the OSX flag
[ `uname` = 'Darwin' ] && OSX=1

# Stop OSX insanity!
[ $OSX -gt 0 ] && export LC_ALL=en_US.UTF-8

if [ -f $HOME/.dircolors ] && [ -n "$(command -v "dircolors")" ]; then
    eval $(dircolors -b $HOME/.dircolors)
else
    export LS_COLORS='rs=0:di=00;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=38;5;046;1:*.sh=00;32:*.csh=00;32:*.zsh=00;32:*.bash=00;32:*.tar=00;31:*.tgz=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.lzma=00;31:*.zip=00;31:*.z=00;31:*.Z=00;31:*.dz=00;31:*.gz=00;31:*.bz2=00;31:*.bz=00;31:*.tbz2=00;31:*.tz=00;31:*.deb=00;31:*.rpm=00;31:*.jar=00;31:*.rar=00;31:*.ace=00;31:*.zoo=00;31:*.cpio=00;31:*.7z=00;31:*.rz=00;31:*.xz=00;31:*.jpg=00;35:*.JPG=00;35:*.jpeg=00;35:*.gif=00;35:*.bmp=00;35:*.pbm=00;35:*.pgm=00;35:*.ppm=00;35:*.tga=00;35:*.xbm=00;35:*.xpm=00;35:*.tif=00;35:*.tiff=00;35:*.png=00;35:*.svg=00;35:*.svgz=00;35:*.mng=00;35:*.pcx=00;35:*.CR2=00;35:*.mov=00;36:*.mpg=00;36:*.mpeg=00;36:*.m2v=00;36:*.mkv=00;36:*.ogm=00;36:*.mp4=00;36:*.m4v=00;36:*.mp4v=00;36:*.vob=00;36:*.qt=00;36:*.nuv=00;36:*.wmv=00;36:*.asf=00;36:*.rm=00;36:*.rmvb=00;36:*.flc=00;36:*.avi=00;36:*.fli=00;36:*.flv=00;36:*.gl=00;36:*.dl=00;36:*.xcf=00;36:*.xwd=00;36:*.yuv=00;36:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.xm=00;36:*.it=00;36:*.mod=00;36:*.c=38;5;112:*.cpp=38;5;112:*.h=38;5;112:*.o=38;5;112:*.py=38;5;112:*.pyc=38;5;112:*.rb=38;5;112:*.js=38;5;112:*.css=38;5;112:*.html=38;5;112:*.less=38;5;112:*.php=38;5;112:*.pl=38;5;112:*.java=38;5;112:*.xml=38;5;112:*.vim=38;5;242:*Makefile=00;35:*~=01;30:*LICENSE=01;31:*README=01;31:';
    if [ $OSX -gt 0 ]; then
        export CLICOLOR=1
    fi
fi

for f in $ZSH_HOME/[0-9][0-9]*.zsh; do
    [[ $DEBUG -gt 0 ]] && echo "zsh: sourcing $f"
    source $f
done

[[ $HOME/.zsh.local ]] && source $HOME/.zsh.local