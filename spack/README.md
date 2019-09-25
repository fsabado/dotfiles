# Spack README


# Bootstrapping environment modules



# Installation

```bash
cd ~
git clone https://github.com/spack/spack.git
export SPACK_ROOT=~/spack
export PATH=$SPACK_ROOT/bin:$PATH
. $SPACK_ROOT/share/spack/setup-env.sh

spack --insecure install  # disable checking of SSL certificates
spack install lmod
spack install curl
spack load curl
spack module tcl loads curl >>~/.bashrc
#or
export PATH=`spack location --install-dir curl`/bin:$PATH


# Bootstrap
spack bootstrap
source $SPACK_ROOT/share/spack/setup-env.sh

#Reload Spck
#reload-spack

# Modules
spack load <app>@<version>
spack unload <app>@<version>
module show <module-name>
module load <module-name>
module unload <module-name>
module list #show load modules


# Core Utilities
#curl, env, git, go, hg, svn, tar, unzip, patch, environment-modules
spack bootstrap

#Install another compiler
spack install gcc@5.3
spack load gcc@5.3
spack compiler find

#Python and extension
spack find python
spack extensions python

spack load python
spack load py-numpy

# Set up to use Lmod instead of tcl
export SPACK_ROOT=~/spack
. $(spack location -i lmod)/lmod/lmod/init/bash
. ${SPACK_ROOT}/share/spack/setup-env.sh

# Refresh modulefiles
spack module lmod refresh -y
spack module tcl refresh -y
spack module dotkit refresh -y

# Getting help
spack help

```



# Most useful commands

#TODO: add descriptions
```bash
spack install <app>@<version>
spack install <app>@<version>
spack list

spack find
spack find --paths


```

## System Packages


```bash
~/.spack/packages.yaml

# packages:
#     openmpi:
#         paths:
#             openmpi@1.10.1: /opt/local
#         buildable: False


spack --insecure install

```

### References
- https://spack.readthedocs.io/en/latest/getting_started.html#system-packages
- https://spack.readthedocs.io/en/latest/build_settings.html



## References
- https://spack.readthedocs.io/en/latest/getting_started.html#installenvironmentmodules
* https://spack.readthedocs.io/en/latest/tutorial_modules.html
* https://www.cyberciti.biz/faq/how-to-curl-ignore-ssl-certificate-warnings-command-option/
- https://spack.readthedocs.io/en/latest/features.html
- https://spack.readthedocs.io/en/latest/module_file_support.html#shell-support
