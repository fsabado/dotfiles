# Nomachine README

# Documentation

https://www.nomachine.com/knowledge-base


# Client settings
C:/User/<User>/.nx

(Might be hidden)


# Configurations

/usr/NX/etc/server.cfg
/usr/NX/etc/node.cfg

Make Changes to the Default Configuration Effective
Changes will be effective with the next new connection without the need to restart the server if not otherwise specified.


# Shortcuts

Ctrl + Alt + 0 : Shows settings on NX client

# Installation directory

/usr/NX


# Allow other desktop dessions

/usr/NX/etc/server.cfg: ConnectPolicy autocreate=1,autoconnect=1,automigrate=1,desktop=1,dialog=0

# Desktop Session

#Retrieve available sessions
/etc/NX/nxserver --resourcelist --class session

Class     Type                       Value
--------- -------------------------- ------
session    unix-console               yes
session    nxvfb                      no
session    unix-gnome                 yes
session    vms                        no
session    unix-remote-custom         yes
session    unix-xsession-default      no
session    vnc                        no
session    windows                    no
session    unix-remote                yes
session    unix-desktop               yes
session    nx-console                 no
session    unix-cde                   no
session    shadow                     yes
session    unix-kde                   yes
session    unix-application           yes
session    nx-console-shadow          no
session    unix-default               yes
session    unix-xdm                   yes
session    physical-desktop           yes
session    virtual-desktops-limit     no
session    connections-limit          no
session    unix-script                no

## Session Descriptions

Session type : Description

physical-desktop : Connect to the physical desktop of the Terminal Server host.

unix-xsession-default : Run the default virtual desktop as set on the system.

shadow : Connect to a virtual desktop session (desktop sharing/collaboration).

unix-console : Run a virtual Unix console application.
It can be embedded into the client session window or be a floating window console depending on the user's choice: run or not the custom session in a virtual desktop

unix-desktop : Run a virtual custom application embedded into the player session window.

unix-application : Run a virtual custom application.
It can be embedded into the client session window or be a floating window application depending on the user's choice: run or not the command in a virtual desktop.

unix-gnome : Run a virtual GNOME desktop.
The ConnectPolicy key in the server configuration must have 'desktop=1' set.

unix-kde : Run a virtual KDE desktop.
The ConnectPolicy key in the server configuration must have 'desktop=1' set.

unix-xdm : Run a virtual desktop through the X Desktop Manager.

unix-default : Run a virtual session by using the default X client script on server.

unix-script : Run a virtual session by using the X client script on server as specified by path.

windows : Run a RDP session encapsulated in a virtual session.

vnc : Run a VNC session encapsulated in a virtual session.


# Modify Run Sessions scripts

DefaultDesktopCommand "/usr/bin/mate-session"

CommandStartGnome ""
CommandStartKDE ""


# Check Desktop Sessions installed

ls /usr/share/xsessions

grep ^Exec /usr/share/xsessions/gnome.desktop


## Desktop	Command
LXDE : DefaultDesktopCommand "/usr/bin/startlxde"
XFCE : DefaultDesktopCommand "/usr/bin/startxfce4"
KDE : DefaultDesktopCommand "/usr/bin/startkde"
MATE : DefaultDesktopCommand "/usr/bin/mate-session"
CINNAMON : DefaultDesktopCommand "/usr/bin/cinnamon-session-cinnamon"
UNITY : DefaultDesktopCommand "/etc/X11/Xsession 'gnome-session -session=ubuntu' "
GNOME-CLASSIC (on RHEL 7/CentOS 7) : DefaultDesktopCommand "env GNOME_SHELL_SESSION_MODE=classic gnome-session -session gnome-classic"
GNOME : DefaultDesktopCommand "gnome-session"

# Default Gnome 3 Session
/usr/bin/gnome-session

# Gnome 3 Session fallback

env GNOME_SHELL_SESSION_MODE=classic gnome-session --session gnome-classic

# KDE
/usr/bin/startkde


# Mate : Fork of Gnome 2
/usr/bin/mate-session

# XFCE4

/usr/bin/startxfce4


# To add and enable sessions must add to

/usr/NX/etc/server.conf
/usr/NX/etc/node.conf

AvailableSessionTypes physical-desktop,shadow,unix-application,unix-default,unix-console,unix-desktop,unix-remote,unix-remote-custom,,unix-xsession-default,unix-gnome,unix-kde,unix-xdm


# Virtualgl

https://www.nomachine.com/AR05P00982

## Enabling VirtualGL

sudo /etc/NX/nxserver --virtualgl-install
sudo /etc/NX/nxserver --virtualgl yes
/usr/NX/etc/node.cfg: EnableVirtualGLSupport 1

## Uninstall VirtualGl

sudo /etc/NX/nxserver --virtualgl-uninstall




# Checking if VirtualGL is in use
glxinfo | grep -i "renderer\|vendor"


if you need to run the OpenGL application in a NoMachine custom session, pre-pend:

/usr/NX/scripts/vgl/vglrun

to the command specified in the 'Run the following command' field of the client User's Interface.
