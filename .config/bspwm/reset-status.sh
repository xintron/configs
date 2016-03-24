#!/bin/bash

pkill stalonetray
pkill lemonbar

( cd $HOME/.config/bspwm/panel && ./panel & )
