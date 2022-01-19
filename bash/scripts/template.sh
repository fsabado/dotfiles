#!/bin/bash

#Templates
# https://github.com/natelandau/shell-scripts/blob/master/scriptTemplate.sh

# Provide a variable with the location of this script.
scriptPath="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

progname=$(basename $0)
cmd_line="$*"

ERROR="${progname}::ERROR:"


# trapCleanup Function
# -----------------------------------
# Any actions that should be taken if the script is prematurely
# exited.  Always call this function at the top of your script.
# -----------------------------------
function trapCleanup() {
  echo ""
  # Delete temp files, if any
  if is_dir "${tmpDir}"; then
    rm -r "${tmpDir}"
  fi
  die "Exit trapped. In function: '${FUNCNAME[*]}'"
}

# safeExit
# -----------------------------------
# Non destructive exit for when script exits naturally.
# Usage: Add this function at the end of every script.
# -----------------------------------
function safeExit() {
  # Delete temp files, if any
  if is_dir "${tmpDir}"; then
    rm -r "${tmpDir}"
  fi
  trap - INT TERM EXIT
  exit
}


# Set Flags
# -----------------------------------
# Flags which can be overridden by user input.
# Default values are below
# -----------------------------------
quiet=false
printLog=false
verbose=false
force=false
strict=false
debug=false
args=()

#TODO: document what this means
#https://www.mkssoftware.com/docs/man1/getopts.1.asp
#https://sookocheff.com/post/bash/parsing-bash-script-arguments-with-shopts/
#https://linuxconfig.org/how-to-use-getopts-to-parse-a-script-options
OPTLIST="r:#g%th"

usage(){
    echo -n"<name.sh> - program description
Usage: $progname [-$OPTLIST] iron time_dir
 Options:
 -# | -g  : debug mode for script (no execute)
 -% | -t : trace mode for script
 -h : print usage
 Arguments:
 arg1 : description1
 arg2 : description2
"
}


while getopts $OPTLIST opt
do
	case $opt in
		\# | \g) DEBUG=true;;
		\% | \t) TRACE=true;;
		\r) rate=$OPTARG;;
		\h) usage
			exit 0;;
		*)  usage
			exit 2;;
	esac
done

shift $(($OPTIND - 1))


# Trap bad exits with your cleanup function
trap trapCleanup EXIT INT TERM


# Run in debug mode, if set
if ${debug}; then set -x ; fi

# Exit on empty variable
if ${strict}; then set -o nounset ; fi

#Set variables
arg1=value1
arg22=value2

if [ "$DEBUG" -a "$TRACE" ]; then
	echo -e $USAGE
	echo "  $ERROR Trace mode and Debug mode are mutually exclusive"
	exit 2
fi

arg1=$1
if [ $arg1 ]; then
	shift
else
	arg1=defaultVal
fi

arg2=$1
if [ $arg2 ]; then
	shift
else
	arg2=defaultVal
fi

#Building long commands with options
if [ $TRACE ]; then
    python_command="${python_command} -m pdb"
    python_command="${python_command} python.py"
else
    python_command="${python_command} -m ${python_module}"
fi

#https://stackoverflow.com/questions/13086109/check-if-bash-variable-equals-0
if [ "$depth" -eq "0" ]; then
   echo "false";
   exit;
fi

python_command="${python_command} -p option"
python_command="${python_command} ${arg1}"
python_command="${python_command} -c option2"

command1="script1.sh  ${MODE}"
command2="script2.sh  ${MODE}"
command3="script3.sh  ${MODE} ${arg1} ${arg2}"

echo "Starting script1"
${command1} &
echo "Starting script2"
${command2} &
echo "Starting script3"
${command3} &

#Running command
xterm -hold -sl 1000 -geometry 200x50 -T "${progname}" -e ${python_command}


###Post Processing###

    python_cmdPID=$!
    if [ $TRACE ]; then
            echo "    $progname      Spawned Command PID = '${python_cmdPID}'"
    fi

    # Wait to receive an interrupt to this parent script and then kill the child PID.
    # If the child PID is stopped externally, exit this parent script.
    trap 'echo "Caught trap to terminate PID ${python_cmdPID}, terminating command ==> ${python_command}"; kill ${python_cmdPID}; exit 1' INT TERM HUP QUIT KILL
    while [ $TRACK ]
    do
            if ps -p ${python_cmdPID} > /dev/null; then
                    if [ $TRACE ]; then
                            echo "The Child PID ${python_cmdPID} is currently running."
                    fi
                    sleep 4
            else
                    echo "Child PID ${python_cmdPID} is no longer running, exiting dl_overseer."
                    break
            fi
    done


exit 0
