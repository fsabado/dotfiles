#!/usr/bin/env bash

set -e

DOTFILES_HOME=${HOME}/dotfiles
DOTBOT_HOME=${DOTFILES_HOME}/.dotbot
export PATH=${PATH}:${DOTFILES_HOME}/.dotbot/bin

getActualDir() {

    USAGE='
Usage: getActualDir ${BASH_SOURCE[0]}
'
    if [ "$#" -lt 1 ]; then
        echo "${USAGE}"
        return
    fi

    #Get current path
    #    SOURCE="${BASH_SOURCE[0]}"
    SOURCE=$1
    while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
        DIR="$(cd -P "$(dirname "$SOURCE")" >/dev/null 2>&1 && pwd)"
        SOURCE="$(readlink "$SOURCE")"
        [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
    done
    DIR="$(cd -P "$(dirname "$SOURCE")" >/dev/null 2>&1 && pwd)"
    echo "${DIR}"

    #Reference
    #https://stackoverflow.com/questions/35006457/choosing-between-0-and-bash-source
}

dbot_install() {
    USAGE='
installDotbotConfig ${BASH_SOURCE[0]} <pathToConfig>
'
    SOURCE=$1; shift
    CONFIG=$1; shift
    BASEDIR="$(getActualDir ${BASH_SOURCE[0]})"
    cd "${BASEDIR}"
    if [ ! -f "${DOTBOT_HOME}/bin/dotbot" ]; then
        echo "Updating dotbot"
        git submodule update --init --recursive "${DOTBOT_DIR}"
    fi
    "${DOTBOT_HOME}/bin/dotbot" -d "${BASEDIR}" -c "${CONFIG}" "${@}"
}
