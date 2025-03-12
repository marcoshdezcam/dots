# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

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

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
plugins=(git gh history npm jump git-flow gem gcloud dotenv docker pyenv zsh-interactive-cd vscode z zsh-syntax-highlighting zsh-bat zsh-autosuggestions you-should-use)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.

# Enable Webcam
alias cam="sudo /usr/sbin/modprobe v4l2loopback exclusive_caps=1 card_label='Huawei Camera'"
# Virtual microphone
alias mic="pactl load-module module-null-sink \
	sink_name=Huawei-VirtualMic-Sink \
	sink_properties=device.description=Huawei-Mic-Sink && 
  pactl load-module module-remap-source \
	master=Huawei-virtualMic-Monitor \
	source_name=Huawei-VirtualMic-Sink \
	source_properties=device.description=Huawei-Virtual-Mic"

# Personal aliasses
alias .="source ~/.zshrc"
alias v="nvim"

# Ubuntu Package Manager
alias update="sudo apt update"
alias upgrade="sudo apt upgrade"
alias autoremove="sudo apt autoremove"
alias autoclean="sudo apt autoclean"
alias upgradable="apt list --upgradable"
alias install="sudo apt install"

# Empty SWAP
alias fsw="sudo swapoff -a && sudo swapon -a"
# Clear PageCache
alias clearCache="sudo sh -c 'echo 1 >  /proc/sys/vm/drop_caches'"
# Clear Dentries and inodes
alias clearCI="sudo sh -c 'echo 2 >  /proc/sys/vm/drop_caches'"

# Open Web UI
alias ia="open-webui serve"

# Navigation shortcuts
alias j="jump"
alias e="exit"
alias c="clear"

# TMUX
alias tls="tmux ls"
alias tns="tmux new -s"
alias tas="tmux attach -t"
alias tks="tmux kill-session -t"
alias tkill="tmux kill-server"

# List Ghostty themes
alias gthemes="ghostty +list-themes"

# List Files & Directories
alias l="eza --long --grid"
alias la="eza --long --grid --all"
alias lt="eza --long --tree "
alias ld="eza --long --grid --only-dirs"
alias lf="eza --long --grid --only-files"
alias lg="eza --long --grid --git"

# Node Utils
alias tsr="yarn ts-node-dev --respawn --clear --exit-child"
alias tst="yarn jest --watch"
# Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Python Version Manager
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

# Ruby Version Manager
eval "$(~/.rbenv/bin/rbenv init - --no-rehash zsh)"

# To customize prompt, run `` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH=$HOME/.local/bin:$PATH
