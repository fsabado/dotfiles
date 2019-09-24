#/usr/bin/env bash

#Script Pre-setup
#Print bash commands
#https://stackoverflow.com/questions/5750450/how-can-i-print-each-command-before-executing
#https://wiki.bash-hackers.org/scripting/debuggingtips#use_shell_debug_output
if [ ! -z ${TRACE+x} ]; then 
	set -o xtrace 
fi
#Get current path
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"

SCRIPTHOME=$DIR

#Set path variables here

#Pycharm Configuration
PYCHARM_HOME=${HOME}/software/pycharm-community-2019.2.2

#Docs
#${PYCHARM_HOME}/Install-Linux-tar.txt

export PATH=${PYCHARM_HOME}/bin:${PATH}
#export LD_LIBRARY_PATH=${SCRIPTHOME}/lib:${LD_LIBRARY_PATH}

#Cleanup
unset SOURCE
unset DIR
unset SCRIPTHOME
unset PROGRAM_NAME
set +o xtrace


#PyCharm
#INSTALLATION INSTRUCTIONS
#===============================================================================
#
#  Linux Installation Instructions
#  ------------------------------------------------------------------------------
#  1. Unpack the PyCharm distribution archive that you downloaded to
#     where you wish to install the program. We will refer to this destination
#     location as your {installation home} below.
#
#  2. Open a console and cd into "{installation home}/bin" and type:
#
#       ./pycharm.sh
#
#     to start the application. As a side effect, this will initialize various
#     configuration files in the ~/.PyCharmCE2019.2 directory.
#
#  3. [OPTIONAL] Add "{installation home}/bin" to your PATH environment
#     variable so that you may start PyCharm from any directory.
#
#  4. [OPTIONAL] To adjust the value of the JVM heap size, create
#      ~/.PyCharmCE2019.2/config/pycharm.vmoptions (or pycharm64.vmoptions
#      if using a 64-bit JDK), and set the -Xms and -Xmx parameters. To see how
#      to do this, you can reference the vmoptions file under
#      "{installation home}/bin" as a model.
#
#  [OPTIONAL] Changing the location of "config" and "system" directories
#  ------------------------------------------------------------------------------
#  By default, PyCharm stores all your settings under the ~/.PyCharmCE2019.2/config
#  directory and uses ~/.PyCharmCE2019.2/system as a data cache.
#  If you want to change these settings,
#
#  1. Open a console and cd into ~/.PyCharmCE2019.2/config
#
#  2. Create the file "idea.properties" and open it in an editor. Set the
#     idea.system.path and/or idea.config.path variables as desired, for
#     example:
#
#     idea.system.path=~/custom/system
#     idea.config.path=~/custom/config
#
#  3. Note that we recommend to store data cache ("system" directory) on a disk
#     with at least 1GB of free space.
#
#
#Enjoy!
#
#-PyCharm Development Team



