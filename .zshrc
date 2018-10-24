# Path to your oh-my-zsh installation.
export ZSH=/Users/maxchadwick/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

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
DISABLE_UNTRACKED_FILES_DIRTY="true"

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
plugins=(git)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.npm-packages/bin:$HOME/go/bin"
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
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
alias macdown="/Users/maxchadwick/Downloads/MacDown.app/Contents/MacOS/MacDown"
alias clean-desktop="defaults write com.apple.finder CreateDesktop false; killall Finder"
alias restore-desktop="defaults write com.apple.finder CreateDesktop true; killall Finder"
alias sort=gsort
alias git=hub
alias grep="grep --color=always"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
alias mphp70="/Applications/MAMP/bin/php/php7.0.12/bin/php"

function add-date {
    mv $1 "$(date +%Y%m%d_%H%M%S)_$1"
}

function pwgen() {
    local len=${1:-32}
    LC_CTYPE=C tr -dc A-Za-z0-9_\!\@\#\$\%\^\&\*\(\)-+= < /dev/urandom | head -c "$len" | xargs
}

function validate-luhn() {
  local pan="$1"
  local panlen="${#pan}"
  local sum=0

  for ((i = panlen - 1; i >= 0; i--)); do
    local digit="${pan:$i:1}"
    if (((panlen-i) % 2 == 0)); then
       #even
       ((digit*=2))
       ((${#digit} == 2)) && digit=$((${digit:0:1}+${digit:1:1}))
    fi
    ((sum+=digit))
  done

  ((sum % 10 == 0))
}

export GOPATH="/Users/maxchadwick/go"
export NODE_PATH="/Users/maxchadwick/.npm-packages/lib/node_modules"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Automatically added by Magento Cloud CLI installer
export PATH="$HOME/.composer/vendor/bin:/Users/maxchadwick/.magento-cloud/bin:$PATH"
. '/Users/maxchadwick/.magento-cloud/shell-config.rc' 2>/dev/null
