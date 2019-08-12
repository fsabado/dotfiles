#!/usr/bin/env fish
# -*- fish-shell-script -*-
########################################################################
#  This is the system wide source file for setting up
#  modules in Fish:
#
########################################################################

if test (id -u) -ne 0

    if test -z "$MODULEPATH_ROOT"

        if test -n "$USER"
            set -gx USER "$LOGNAME"  # make sure $USER is set
        end
        set -gx LMOD_sys (uname)

        set -gx MODULEPATH_ROOT "/ascldap/users/fsabado/modulefiles"

        set MODULEPATH_INIT "/ascldap/users/fsabado/lmod/lmod/init/.modulespath"
        
        if test -e "$MODULEPATH_INIT" 
            for str in (cat "$MODULEPATH_INIT" | sed 's/#.*$//')  # Allow end-of-line comments.
                for dir in (/usr/bin/ls -d "$str")
                    set -gx MODULEPATH (/ascldap/users/fsabado/lmod/lmod/libexec/addto --append MODULEPATH $dir)
                end
            end
        else
            set -xg MODULEPATH (/ascldap/users/fsabado/lmod/lmod/libexec/addto --append MODULEPATH $MODULEPATH_ROOT/$LMOD_sys $MODULEPATH_ROOT/Core)
            set -xg MODULEPATH (/ascldap/users/fsabado/lmod/lmod/libexec/addto --append MODULEPATH /ascldap/users/fsabado/lmod/lmod/modulefiles/Core)
        end

        set -xg FISH_ENV /ascldap/users/fsabado/lmod/lmod/init/fish

        #
        # If MANPATH is empty, Lmod is adding a trailing ":" so that
        # the system MANPATH will be found
        if test -n "$MANPATH"
            set -xg MANPATH ":"
        end

        set -gx MANPATH (/ascldap/users/fsabado/lmod/lmod/libexec/addto MANPATH /ascldap/users/fsabado/lmod/lmod/share/man)
    end

    set PS_CMD /usr/bin/ps
    if not test -x $PS_CMD
        if test -x /bin/ps
            set PS_CMD /bin/ps
        else if test -x /usr/bin/ps
            set PS_CMD /usr/bin/ps
        end
    end

    set EXPR_CMD /usr/bin/expr
    if not test -x $EXPR_CMD
        if test -x /usr/bin/expr
            set EXPR_CMD /usr/bin/expr
        else if test -x /bin/expr
            set EXPR_CMD /bin/expr
        end
    end

    set BASENAME_CMD /usr/bin/basename
    if not test -x $BASENAME_CMD
        if test -x /bin/basename
            set BASENAME_CMD /bin/basename
        else if test -x /usr/bin/basename
            set BASENAME_CMD /usr/bin/basename
        end
    end


    set my_shell (eval "$PS_CMD -p %self -ocomm=")
    set my_shell (eval "$EXPR_CMD \"$my_shell\" : '-*\(.*\)'")
    set my_shell (eval "$BASENAME_CMD $my_shell")

    if test -f /ascldap/users/fsabado/lmod/lmod/init/$my_shell
        source  /ascldap/users/fsabado/lmod/lmod/init/$my_shell >/dev/null # Module Support
    else
        source  /ascldap/users/fsabado/lmod/lmod/init/sh        >/dev/null # Module Support
    end
end

