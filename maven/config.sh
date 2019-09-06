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

#########MAIN########
PROGRAM_NAME=Maven
#Configuration settings
#echo "Setting up ${PROGRAM_NAME}"

#Shortcut for editing this file
MAVENRC=${SOURCE}
alias edit-programrc="${EDITOR} ${MAVENRC}"
alias edit-mvn-settings="${EDUTIR} ${HOME}/.m2/settings.xml"

#Configurations

alias mvn-install="mvn install -T 1.8C"
alias mvn-cleaninstall="mvn clean install -T 1.8C"
alias mvn-install-skip="mvn install -DskipTests -T 1.8C"
alias mvn-cleaninstall-skip="mvn clean install -DskipTests -T 1.8C"

alias run-target="java -jar ./target/*-dependencies.jar"
#Assuming the log levels exist
alias run-target-log="java -jar ./target/*-dependencies.jar --console-level DEBUG"
alias run-target-logfile="java -jar ./target/*-dependencies.jar --console-level DEBUG --file-level DEBUG"
alias run-target-debug="java -Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=8007 -jar ./target/*-dependencies.jar --consolde-level DEBUG"
#Log Levels:
#DEBUG|INFO|WARN|ERROR|OFF, Default is WAR

#Cleanup
unset SOURCE
unset DIR
unset SCRIPTHOME
unset PROGRAM_NAME
set +o xtrace

