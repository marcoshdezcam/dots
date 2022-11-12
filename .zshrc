# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="cloud"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

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
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zshmarks git-flow)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# ALIASES
# File navigation
alias c="clear"
alias l="exa --header --long --grid"
alias la="exa --header --long --grid --all"
alias lt="exa --header --long --tree --level=2"
alias lta="exa --header --long --tree --level=2 --all"
alias lg="exa --header --long --git"
alias lga="exa --header --long --git --all"

# GIT
alias g="git"
alias gs="git status"
alias ga="git add"
alias gaa="git add ."
alias gc="git commit"
alias gcs="git commit -S"
alias gcsm="git commit -S -m"
alias gcu="git commit -m"
alias gp="git push"
alias gct="git checkout"

# NPM DEV
alias build="npm run build"
alias start="npm start"

# Gcloud App Engine deploy to default project
alias deploy="gcloud app deploy"

# Bookmarks
alias j="jump"

# Rails
alias r="rails"

# Neovim
alias v="nvim"

# Sudo
alias s="sudo "

# Arch 
# Update
alias up="sudo pacman -Syyu"
alias yup="yay -Syu"

# Install 
alias i="sudo pacman -S"

# ACQUIRE DEV
# Connect to Cloud SQL with SQL Proxy
alias connect_sql="./cloud_sql_proxy -instances=bubbly-fuze-316505:us-west2:datafy=tcp:3306"
alias connect_compute='gcloud beta compute ssh --zone "us-west2-c" "tagging-server-deployer"  --project "bubbly-fuze-316505"'
alias toDEV="rm ~/Desktop/Datafify/DatafifyApp/api/src/config/keys.js && ln -s ~/Desktop/Datafify/DEVkeys.js ~/Desktop/Datafify/DatafifyApp/api/src/config/keys.js"
alias toPROD="rm ~/Desktop/Datafify/DatafifyApp/api/src/config/keys.js && ln -s ~/Desktop/Datafify/PRODkeys.js ~/Desktop/Datafify/DatafifyApp/api/src/config/keys.js && gcloud app deploy"
alias logAPI="gcloud app logs tail -s api"
alias logFRONT="gcloud app logs tail -s frontend"

# Ubuntu
alias update="sudo apt update"
alias upgrade="sudo apt upgrade"
alias autoremove="sudo apt autoremove"
alias autoclean="sudo apt autoclean"

# PATHS
# RBENV path
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Recommended on Arch Wiki to install ruby
# export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
# export PATH="$PATH:$GEM_HOME/bin"

# NODEJS PATH

# EMACS PATH

# PIP Path

# Google Cloud SDK
# Wally (Moonlander flashing tool)
alias wally="/home/marcos/Documents/wally"

# Reboot bluetooth
alias rbluetooth="sudo systemctl restart bluetooth"
# Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Neofetch
# neofetch
