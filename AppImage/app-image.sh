#!/usr/bin/env bash


INSTALL_DIR=${HOME}/.bin
cd ${INSTALL_DIR}
mkdir -p ${INSTALL_DIR}

# Function to install an app image
f_install_appimage () {
    if [ $# -eq 2 ]; then
        app_url=$1
        app_name=$2
        app_path=${INSTALL_DIR}/${app_name}

        if [ ! -f ${app_path} ]; then
            wget -O ${app_path} \
                ${app_url} && \
                sudo chmod +x ${app_path}
        fi
    fi
}

#Emacs
f_install_appimage \
    https://github.com/probonopd/Emacs.AppImage/releases/download/continuous/Emacs-27.2.glibc2.16-x86_64.AppImage \
    emacs27.2

#GVim
f_install_appimage \
    https://github.com/vim/vim-appimage/releases/download/v8.2.5160/GVim-v8.2.5160.glibc2.15-x86_64.AppImage \
    gvim8.2

#Github Desktop
f_install_appimage \
    https://github.com/shiftkey/desktop/releases/download/release-3.0.2-linux1/GitHubDesktop-linux-3.0.2-linux1.AppImage \
    githubDesktop3.0

#Leptop Code Snippet
f_install_appimage \
    https://github.com/hackjutsu/Lepton/releases/download/v1.10.0/Lepton-1.10.0.AppImage \
    lepton1.10

# Install latest neovim
f_install_appimage \
    https://github.com/neovim/neovim/releases/download/v0.7.2/nvim.appimage \
    nvim7.2
    #cd ${HOME}/.bin && ln -s -f nvim7.2 nvim