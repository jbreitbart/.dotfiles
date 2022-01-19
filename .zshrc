# Senstive functions which are not pushed to Github
# It contains GOPATH, some functions, aliases etc...
[ -r ~/.zsh_private ] && source ~/.zsh_private

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="nord_tywr"

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
plugins=(git
#    command-not-found
    cp
    extract
    mosh
    pass
    tmux
    ssh-agent
)

###### alias to disable autocorrect
alias docker='nocorrect docker'
alias cargo='nocorrect cargo'
######

###### tmux plugin
ZSH_TMUX_AUTOSTART="true"
ZSH_TMUX_AUTOSTART_ONCE="false"
ZSH_TMUX_AUTOCONNECT="false"
######

###### ssh-agent plugin
zstyle :omz:plugins:ssh-agent identities id_rsa id_ed25519
######

source $ZSH/oh-my-zsh.sh

###### bat
export BAT_THEME="Nord"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
alias cat=bat
######

###### pueue
alias p=pueue
######

###### exa
alias ls=exa
#######

####### valgrind
export VALGRIND_LIB=/home/rbj2abt/bin/valgrind/lib/valgrind
export PATH=/home/rbj2abt/bin/valgrind/bin:$PATH

alias valgrind='nocorrect valgrind'
#######

####### sccache
export SCCACHE_CACHE_SIZE="15G"

export CMAKE_CXX_COMPILER_LAUNCHER=sccache
export CMAKE_C_COMPILER_LAUNCHER=sccache
#######

####### CMake
export CMAKE_EXPORT_COMPILE_COMMANDS="ON"
PATH=$HOME/bin/cmake/bin:$PATH
#######

####### Rust
source $HOME/.cargo/env
export LD_LIBRARY_PATH=$(rustc --print sysroot)/lib:$LD_LIBRARY_PATH
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
export RUSTC_WRAPPER=sccache
#######

####### Go
export PATH=$PATH:/usr/local/go/bin
export GOPATH=/home/rbj2abt/go
#######

####### Cuda
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH
export PATH=/usr/local/cuda/bin:$PATH
#######

####### Ruby
export GEM_HOME=$HOME/.ruby
export PATH=$PATH:$HOME/.ruby/bin
#######

####### BOSCH Network
alias vpn="tmux new-session -d -s vpn 'osd-vpn-connect -x <~/.vpn_login'"
alias proxyrr="systemctl stop --user proxy && systemctl start --user proxy"
alias piproxy="tmux new-session -d -s piproxy 'ssh -CnND 8080 pi@192.168.188.11'"
#alias mount_u="gio mount 'smb://10.3.222.101/RBJ2ABT$/'"
#######

####### Pace
export REQUESTS_CA_BUNDLE=/home/rbj2abt/.config/certs/Bosch-Azure.pem
alias pacesh="docker exec -it pace-devcontainer-rbj2abt /usr/bin/zsh"
#######

####### ROS
#source /opt/ros/melodic/setup.zsh
#######

####### PATH / LD_LIBRARY_PATH
#source /opt/intel/bin/compilervars.sh intel64
PATH=$HOME/bin/parsync:$HOME/bin/bear/bin:$PATH
PATH=$HOME/bin:$HOME/bin/beets:$HOME/bin/cquery/bin:$HOME/bin/llvm/bin:$PATH
LD_LIBRARY_PATH=$HOME/bin/llvm/lib:$HOME/bin/boost_1_55_gcc/lib/:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$LIBRARY_PATH
#######

####### ALIAS
alias ll='ls -lh'
alias la='ls -ah'
alias df='df -h'
alias du='du -h'
alias ..='cd ..'
alias ssh='ssh -X'
alias tickr='tickrs -p -t 1M -s TSLA,AMD,AMZN,ASML,TEVA,NEL.OL,WORK,BIDU,7CD.F,TLRY,GME,BB'

alias halt='sudo halt'
alias reboot='sudo reboot'
alias nethogs='sudo nethogs'
alias iptraf='sudo iptraf'
alias iotop='sudo iotop'
alias powertop='sudo powertop'
alias dmesg='sudo dmesg'

alias -s pdf=xdg-open
alias -s png=xdg-open
alias -s jpg=xdg-open
#######

###### starship prompt
eval "$(starship init zsh)"
######

###### direnv
eval "$(direnv hook zsh)"
######


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
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
