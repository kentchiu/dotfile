
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

# ZSH_THEME="robbyrussell"

# ZSH_THEME="powerlevel10k/powerlevel10k"

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
plugins=(
  vi-mode
  fzf
  git
  poetry
  zsh-autosuggestions
  zoxide
)

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
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

###
### Custom Setting 
###

export VISUAL=nvim
export EDITOR=nvim 
alias lg=lazygit

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# # pyenv
# export PYENV_ROOT="$HOME/.pyenv"
# command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"

# poetry
# export PATH="$HOME/.local/bin:$PATH"

#go 
export PATH=$PATH:/usr/local/go/bin

# THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# nvim
# alias vi='~/download/nvim.appimage'
# alias nvim='~/download/nvim.appimage'
alias vi=nvim
alias vf='nvim $(fzf)'

alias ls="exa --icons"
# alias ls='exa --grid --color auto --icons --sort=type'
# alias ll='exa --long --color always --icons --sort=type'
# alias la='exa --grid --all --color auto --icons --sort=type'
# alias lla='exa --long --all --color auto --icons --sort=type'

alias cd="z"
alias cat="bat"

# difft
alias difft="GIT_EXTERNAL_DIFF=difft git diff"
alias dlog="GIT_EXTERNAL_DIFF=difft git log -p --ext-diff $@;"

# zoxide 
eval "$(zoxide init --cmd cd zsh)"

# starship
eval "$(starship init zsh)"
#################
# FZF 
#################
# alt+c to change folder
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
# ctrl + t to search file
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || bat {} || tree -C {}) 2> /dev/null | head -200'"
# search history
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"

# Function to open a file using fzf and vim
fv() {
  local file
  file=$(fzf --preview "bat --style=numbers --color=always {}" --preview-window=right:70%:wrap --query="$1" --select-1 --exit-0)
  if [[ -n "$file" ]]; then
    nvim "$file"
  fi
}

# Function to search for files under the home directory and preview with fzf
ff() {
  local file
  file=$(find "$HOME" -type f | fzf --preview "bat --style=numbers --color=always {}" --preview-window=right:70%:wrap --query="$1" --select-1 --exit-0)
  if [[ -n "$file" ]]; then
    bat --style=numbers --color=always "$file" | less -R
  fi
}

# Function to search file content with rg and fzf
frg() {
  local query="$1"
  if [[ -z "$query" ]]; then
    echo "Usage: ff_rg <search_term>"
    return 1
  fi
  rg --color=always --line-number --no-heading "$query" | fzf --ansi --preview "echo {} | awk -F: '{print \"bat --style=numbers --color=always --highlight-line \" \$2 \" \" \$1 }' | sh" --preview-window=right:70%:wrap --query="$2" --select-1 --exit-0
}

# download gitignore template from github, usage: gignore <template>
ignore() {
  local url="https://raw.githubusercontent.com/github/gitignore/main/$1.gitignore"
  local file=".gitignore"

  # Check if the remote file exists
  if curl --head --silent --fail "$url" > /dev/null; then
    echo "Downloading $url ..."
    curl -o "$file" "$url"
  else
    echo "Remote file $url does not exist."
  fi
}


## dev alias
alias webapi="dotnet watch run --project  WebApi/WebApi.csproj --launch-profile=kent"
alias logical="dotnet watch run --project logical/Service.csproj  --launch-profile=kent"
alias rbac="dotnet watch run --project  rbacservice/rbacservice.csproj  --launch-profile=Development"
alias websocket="dotnet watch run --project NiceWebSocket/NiceWebSocket.csproj --launch-profile kent"

# binding ctrl+z to fg
bindkey -s '^Z' 'fg^M'



# only for development
source ~/dev.env
## this command is use to clean screen when tmux restore the session
clear

. "$HOME/.cargo/env"
