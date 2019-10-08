# Sublime Text README


## Install Standalone features

```bash
# install spack
# Stand alone installation
spack install sublime_text ^llvm@7.0.1
spack install sublime-text%gcc@4.8.5 ^llvm@7.0.1 ^icu4c@60.1
```

## Install on CentOS7



```bash
# Start by importing the official Sublime Text repository’s GPG key:
sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
# Add the Yum repository to your system using the following command:
sudo yum-config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo
#Once the repository is enabled, install Sublime Text 3 by typing:
sudo yum install sublime-text
# Start sublime text
subl

```

https://linuxize.com/post/how-to-install-sublime-text-3-on-centos-7/

## Shortcuts

Command Pallete : Ctrl + P
Opens terminal at the folder : Ctrl + Alt + Shift + T
Opens terminal at the folder : Ctrl + Shift + T


## Sublime Text Cheatsheets
* https://www.shortcutfoo.com/app/dojos/sublime-text-3-win/cheatsheet


## References

* https://kinsta.com/blog/best-text-editors/
* https://www.shopify.com/partners/blog/sublime-text-plugins-2018
* https://www.hongkiat.com/blog/sublime-text-plugins/
* https://medium.com/@MariaSpr/sublime-text-3-essential-packages-2596133aead9
