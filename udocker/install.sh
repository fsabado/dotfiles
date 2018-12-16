#!/bin/bash

#udocker is also available as a tarball in certain repositories such as:

#https://download.ncg.ingrid.pt/webdav/udocker/
#http://repo.indigo-datacloud.eu/

#This installation method contains statically compiled binaries and is built to be used across different hosts and OS distributions. Please check the repositories for the latest release.

#Install or upgrade of udocker v1.1.2:

VERSION=1.1.3

curl https://download.ncg.ingrid.pt/webdav/udocker/udocker-${VERSION}.tar.gz > udocker-tarball.tgz
export UDOCKER_TARBALL=$(pwd)/udocker-tarball.tgz
tar xzvf $UDOCKER_TARBALL udocker
./udocker install
mkdir -p $HOME/bin
mv ./udocker $HOME/bin/   # move the executable to your preferred location for binaries

#When using the setup.py provided in the release after downloading use:

python setup.py install --home $HOME/bin/


