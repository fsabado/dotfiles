#Helper source
include () {
    [[ -f "$1" ]] && source "$1"
}

# Allow local customizations in the ~/.zshrc_local_before file
if [ -f ~/.zshrc_local_before ]; then
    source ~/.zshrc_local_before
fi

# External plugins (initialized before)
include ~/.zsh/plugins_before.zsh

# Settings
include ~/.zsh/settings.zsh

# Bootstrap
include ~/.zsh/bootstrap.zsh

# External settings
include ~/.zsh/external.zsh

# Aliases
include ~/.zsh/aliases.zsh

# Custom prompt
include ~/.zsh/prompt.zsh

# Include Legacy Bash settings
ENABLE_LEGACY_BASH="True"

if [[ ! -z ${ENABLE_LEGACY_BASH+x} ]]; then
  include ~/.bash/init.bash
fi

# Oh-my-zsh Settings
ENABLE_OH_MY_ZSH="True"

if [[ ! -z ${ENABLE_OH_MY_ZSH+x} ]] ; then
  #printf "Setting up zsh\n"
  # Path to your oh-my-zsh installation.
    export ZSH=$HOME/.oh-my-zsh


  # Set name of the theme to load.
  # Look in ~/.oh-my-zsh/themes/
  # Optionally, if you set this to "random", it'll load a random theme each
  # time that oh-my-zsh is loaded.
  #ZSH_THEME="robbyrussell"
  #export TERM="xterm-256color"
  ZSH_THEME="ys"

  # Uncomment the following line to use case-sensitive completion.
  # CASE_SENSITIVE="true"

  # Uncomment the following line to use hyphen-insensitive completion. Case
  # sensitive completion must be off. _ and - will be interchangeable.
  # HYPHEN_INSENSITIVE="true"

  # Uncomment the following line to disable bi-weekly auto-update checks.
  # DISABLE_AUTO_UPDATE="true"

  # Uncomment the following line to change how often to auto-update (in days).
  # export UPDATE_ZSH_DAYS=13

  # Uncomment the following line to disable colors in ls.
  # DISABLE_LS_COLORS="true"

  # Uncomment the following line to disable auto-setting terminal title.
  # DISABLE_AUTO_TITLE="true"

  # Uncomment the following line to enable command auto-correction.
  # ENABLE_CORRECTION="true"

  # Uncomment the following line to display red dots whilst waiting for completion.
  # COMPLETION_WAITING_DOTS="true"

  # Uncomment the following line if you want to disable marking untracked files
  # under VCS as dirty. This makes repository status check for large repositories
  # much, much faster.
  # DISABLE_UNTRACKED_FILES_DIRTY="true"

  # Uncomment the following line if you want to change the command execution time
  # stamp shown in the history command output.
  # The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
  # HIST_STAMPS="mm/dd/yyyy"

  # Would you like to use another custom folder than $ZSH/custom?
  # ZSH_CUSTOM=/path/to/new-custom-folder

  # Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
  # Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
  # Example format: plugins=(rails git textmate ruby lighthouse)
  # Add wisely, as too many plugins slow down shell startup.

  plugins=(
  #  adb
  #  ant
  #  apache2-macports
  #  arcanist
  #  archlinux
  #  asdf
  #  autoenv
  #  autojump
  #  autopep8
  #  aws
    battery
  #  bbedit
  #  bgnotify
    boot2docker
  #  bower
  #  branch
  #  brew
  #  brew-cask
  #  bundler
  #  bwana
  #  cabal
  #  cake
  #  cakephp3
  #  capistrano
  #  cask
  #  catimg
  #  celery
  #  chruby
  #  chucknorris
  #  cloudapp
  #  codeclimate
  #  coffee
  #  colemak
    colored-man-pages
    colorize
    command-not-found
    common-aliases
  #  compleat
  #  composer
    copydir
  #  copyfile
    cp
  #  cpanm
  #  debian
  #  dircycle
  #  dirhistory
  #  dirpersist
  #  django
  #  dnf
    docker
    docker-compose
  #  emacs
  #  ember-cli
  #  emoji
  #  emoji-clock
  #  emotty
  #  encode64
    extract
  #  fabric
  #  fancy-ctrl-z
  #  fasd
  #  fastfile
  #  fbterm
  #  fedora
  #  forklift
  #  fossil
  #  frontend-search
  #  gas
  #  gb
  #  geeknote
  #  gem
    git
    git-extras
    gitfast
    git-flow
    git-flow-avh
    github
    git-hubflow
    gitignore
    git-prompt
    git-remote-branch
  #  glassfish
  #  gnu-utils
  #  go
  #  golang
  #  gpg-agent
    gradle
  #  grails
  #  grunt
  #  gulp
  #  heroku
    history
    history-substring-search
  #  httpie
  #  iwhois
  #  jake-node
  #  jhbuild
  #  jira
  #  jruby
  #  jsontools
  #  jump
  #  kate
  #  kitchen
  #  knife
  #  knife_ssh
  #  laravel
  #  laravel4
  #  laravel5
  #  last-working-dir
  #  lein
  #  lighthouse
  #  lol
  #  macports
    man
  #  marked2
    mercurial
  #  meteor
  #  mix
  #  mix-fast
  #  mosh
  #  mvn
  #  mysql-macports
  #  n98-magerun
  #  nanoc
  #  nmap
  #  node
  #  npm
  #  nvm
  #  nyan
  #  osx
  #  pass
  #  paver
  #  pep8
  #  per-directory-history
  #  perl
  #  phing
    pip
  #  pj
  #  plugin.list
  #  pod
  #  postgres
  #  pow
  #  powder
  #  powify
  #  profiles
  #  pyenv
  #  pylint
    python
  #  rails
  #  rake
  #  rake-fast
  #  rand-quote
  #  rbenv
  #  rbfu
  #  react-native
  #  rebar
  #  redis-cli
  #  repo
  #  rsync
  #  ruby
  #  rust
  #  rvm
  #  safe-paste
  #  sbt
  #  scala
  #  scd
  #  screen
  #  scw
  #  sfffe
  #  singlechar
  #  spring
  #  sprunge
    ssh-agent
  #  stack
  #  sublime
    sudo
  #  supervisor
  #  suse
    svn
  #  svn-fast-info
  #  symfony
  #  symfony2
  #  systemadmin
  #  systemd
  #  taskwarrior
  #  terminalapp
  #  terminitor
  #  terraform
  #  textastic
  #  textmate
  #  thefuck
    themes
  #  thor
    tmux
  #  tmux-cssh
  #  tmuxinator
  #  torrent
  #  tugboat
    ubuntu
  #  urltools
  #  vagrant
  #  vault
  #  vim-interaction
  #  vi-mode
  #  virtualenv
  #  virtualenvwrapper
  #  vundle
  #  wakeonlan
  #  wd
  #  web-search
  #  wp-cli
  #  xcode
  #  yii
  #  yii2
    yum
  #  z
  #  zeus
    zsh-navigation-tools
    zsh_reload
  )

  # User configuration

  # export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
  # export MANPATH="/usr/local/man:$MANPATH"

  source $ZSH/oh-my-zsh.sh

  # You may need to manually set your language environment
  # export LANG=en_US.UTF-8

  # Preferred editor for local and remote sessions
  # if [[ -n $SSH_CONNECTION ]]; then
  #   export EDITOR='vim'
  # else
  #   export EDITOR='mvim'
  # fi

  # Compilation flags
  # export ARCHFLAGS="-arch x86_64"

  # ssh
  # export SSH_KEY_PATH="~/.ssh/dsa_id"

  # Set personal aliases, overriding those provided by oh-my-zsh libs,
  # plugins, and themes. Aliases can be placed here, though oh-my-zsh
  # users are encouraged to define aliases within the ZSH_CUSTOM folder.
  # For a full list of active aliases, run `alias`.
  #
  # Example aliases
  # alias zshconfig="mate ~/.zshrc"
  # alias ohmyzsh="mate ~/.oh-my-zsh"

fi



if [[ -d /usr/NX/bin ]]; then
	export PATH=$PATH:/usr/NX/bin
fi



# Syntax highlighting
#Why must zsh-syntax-highlighting.zsh be sourced at the end of the .zshrc file?
#zsh-syntax-highlighting.zsh wraps ZLE widgets.
#It must be sourced after all custom widgets have been created (i.e., after all zle -N calls and after running compinit).
#Widgets created later will work, but will not update the syntax highlighting.
include ~/.zsh/syntax.zsh

# External plugins (initialized after)
include ~/.zsh/plugins_after.zsh

# Allow local customizations in the ~/.zshrc_local_after file
include ~/.zshrc_local_after
