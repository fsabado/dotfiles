#!/bin/bash

set -x
export SPACK_ROOT=${HOME}/spack

#Clone to home directory if doesn't exist
if [[ ! -d ${SPACK_ROOT} ]]; then
	prev_dir = $(pwd)
	cd ${HOME}
	git clone https://github.com/spack/spack.git
	cd ${prev_dir}
fi

if [ -e "${SPACK_ROOT}" ]; then
	. $SPACK_ROOT/share/spack/setup-env.sh
fi
