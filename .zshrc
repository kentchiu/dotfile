
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
plugins=(
  git
  zsh-autosuggestions
  poetry
  fzf
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

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# poetry
export PATH="$HOME/.local/bin:$PATH"

#go 
export PATH=$PATH:/usr/local/go/bin

# THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# nvim
alias vi='nvim'

alias nvim-astro='NVIM_APPNAME=astro-vim nvim'
alias nvim-lazy='NVIM_APPNAME=lazy-vim nvim'
alias nvim-Lunar='NVIM_APPNAME=lunar-vim nvim'
alias nvim-nvchad='NVIM_APPNAME=nvchad-vim nvim'

function nvims() {
  items=('default' 'astro-vim' 'lazy-vim' 'Lunar-vim' 'nvchad-vim')
  config=$(printf "%s
" "${items[@]}" | fzf --prompt="v Neovim Config » " --height=50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return O
  elif [[ $config = "default" ]]; then
    config=""
  fi
  NVIM_APPNAME=$config nvim $@
}       

# run this to install nvim disbutions
# git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/astro-vim
# git clone https://github.com/LazyVim/starter ~/.config/lazy-vim
# git clone --depth 1 https://github.com/LunarVim/LunarVim ~/.config/lunar-vim
# git clone --depth 1 https://github.com/NvChad/NvChad ~/.config/nvchad-vim


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

jt() {
  local java_test_files=$(find ./src/test/java -name "*.java" | fzf --multi --preview "bat --style=numbers --color=always {}")

  if [[ -n "$java_test_files" ]]; then
    local mvn_test_command="mvn test -Dtest="
    local test_classes=""

    while IFS= read -r line; do
      local package_path=$(dirname "${line#./src/test/java/}")
      local package_name=${package_path//\//.}
      local class_name=$(basename "$line" .java)
      local fully_qualified_name="$package_name.$class_name"
      test_classes+="$fully_qualified_name,"
    done <<< "$java_test_files"

    # Remove the trailing comma
    test_classes="${test_classes%,}"

    echo "Running Maven tests for the following classes:"
    echo "$mvn_test_command$test_classes"
    echo

    # Execute the mvn test command
    eval "$mvn_test_command$test_classes"
  fi
}

# remove above if cuda not match
export CUDA_HOME=/usr/local/cuda
export PATH=$PATH:$CUDA_HOME/bin
export LD_LIBRARY_PATH=/usr/local/cuda-12.1/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}:/usr/lib/wsl/lib
