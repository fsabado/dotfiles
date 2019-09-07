#!/bin/bash

#How to run
# * create custom session
#startdesktop.sh gnome
#startdesktop.sh gnome-classic
#startdesktop.sh kde

#set -x
# Place or link to /usr/bin/ directory path
DESKTOP=${1}
case ${DESKTOP} in
    lxde | LXDE)
        sessionCmd="/usr/bin/startlxde"
        ;;
    xfce | XFCE)
        sessionCmd="/usr/bin/startxfce4"
        ;;
    kde | KDE)
        sessionCmd="/usr/bin/startkde"
        ;;
    mate | MATE)
        sessionCmd="/usr/bin/mate-session"
        ;;
    cinnamon | CINNAMON)
        sessionCmd="/usr/bin/cinnamon-session-cinnamon"
        ;;
    gnome-classic | GNOME-CLASSIC)
        sessionCmd="env GNOME_SHELL_SESSION_MODE=classic gnome-session -session gnome-classic"
        ;;
    gnome | GNOME)
        sessionCmd="gnome-session"
        ;;
    *)
        echo -n "Unknown"
        ;;
esac

${sessionCmd}
/bin/kill -s SIGTERM $PPID
