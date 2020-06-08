#%Module1.0
## notavail modulefile
##

set whatis_desc "Describe the application (short)"

set JAVA_INSTALL /projects/gs/tps/jdk-1.8.0_20

proc ModulesHelp { } {
    global whatis_desc
    puts stderr "This module does nothing but alert the user"
    puts stderr "that the [module-info name] module is not available"
}

conflict $current_module_dirname sierra-mpi

module-whatis $whatis_desc
set curMod [module-info name]
if { [ module-info mode load ] } {
    puts stderr "Note: '$curMod' is not available for [uname sysname]."
}
break

prepend-path PATH $JAVA_INSTALL:$JAVA_INSTALL/bin
setenv JAVA_HOME $JAVA_INSTALL



#%Module -*- tcl -*-
#
# boost module

# --- Version/platform-specific info ---

set boost_ver "BOOST 1.55.0"

set BOOST_INSTALL /projects/gs/tps/boost-1.55.0

# --- Shared commands ---

module-whatis $boost_ver

prepend-path CMAKE_PREFIX_PATH $BOOST_INSTALL
prepend-path LD_LIBRARY_PATH $BOOST_INSTALL/lib
prepend-path INCLUDE $BOOST_INSTALL/include
setenv BOOST_DIR ${BOOST_INSTALL}

proc ModulesHelp { } {
    global boost_ver

    puts stderr "\t$boost_ver"
}