# Spack README


# Bootstrapping environment modules


```bash
spack bootstrap
source $SPACK_ROOT/share/spack/setup-env.sh

#or
#reload-spack


# Modules
spack load <app>@<version>
spack unload <app>@<version>
module show <module-name>
module load <module-name>
module unload <module-name>
module list #show load modules

#Install another compiler
spack install gcc@5.3
spack load gcc@5.3
spack compiler find


#Python and extension
spack find python
spack extensions python

spack load python
spack load py-numpy


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



# References
