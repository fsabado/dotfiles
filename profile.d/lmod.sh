#https://easybuild.readthedocs.io/en/latest/Installing-Lmod-without-root-permissions.html
#Lmod/Lua/Tcl

LMOD_HOME=${HOME}/lmod/8.1
LUA_HOME=${HOME}/lua

export PATH=${LUA_HOME}/bin:${PATH}
export PATH=${LMOD_HOME}/libexec:${PATH}

