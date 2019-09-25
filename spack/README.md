



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


# Core Utilities
#curl, env, git, go, hg, svn, tar, unzip, patch, environment-modules
spack bootstrap

```



```bash
# Set up to use Lmod instead of tcl
export SPACK_ROOT=~/spack
. $(spack location -i lmod)/lmod/lmod/init/bash
. ${SPACK_ROOT}/share/spack/setup-env.sh



```




```bash
module install <package>@<version>
module avail
module list
module load <package>
module unload <package>
module show <package>
module purge
module use <path-to-modules>
module unuse <path-to-modules>
```


```bash
spack load <package>
spack unload <package>
spack compilers
spack compiler list
spack compiler add
spack compiler find
spack info

# Refresh modulefiles
spack module lmod refresh -y
spack module tcl refresh -y
spack module dotkit refresh -y
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
- https://spack.readthedocs.io/en/latest/tutorial_modules.html
- https://spack.readthedocs.io/en/latest/features.html
- https://spack.readthedocs.io/en/latest/module_file_support.html#shell-support
