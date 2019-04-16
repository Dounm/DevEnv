HOME_PATH=/home/niuchong
#
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bira"

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
ENABLE_CORRECTION="true"

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
plugins=(git tmux zsh-autosuggestions zsh-syntax-highlighting)

# User configuration

export PATH="$HOME_PATH/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
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

alias cls='clear' 
alias ll='ls -l' 
alias la='ls -la' 
alias vi='vim' 
alias grep='/usr/bin/grep --color=auto -n' 
alias mv='mv -i'
 
#used in zsh only, not bash 
alias -s html=vim #input the *.html in the shell and it will open in vim 
alias -s js=vim 
alias -s c=vim 
alias -s cpp=vim 
alias -s txt=vim 
alias -s gz='tar -xzvf' 
alias -s tgz='tar -xzvf' 
alias -s zip='unzip' 
alias -s bz2='tar -xjvf' 
 
alias sbash='source ~/.bashrc' 
alias szsh='source ~/.zshrc'
alias vbash='vim ~/.bashrc' 
alias vzsh='vim ~/.zshrc' 
alias vszsh='vim ~/.specific_zshrc' 
alias vvim='vim ~/.vimrc' 
alias vtmux='vim ~/.tmux.conf'

export EDITOR="vim"  #use vim to edit command in zsh
bindkey -v
bindkey '^R' history-incremental-search-backward
 
#press space, let the history expression and symbol become what them should be 
#used in bash 
#bind Space:magic-space 
#used in zsh 
bindkey " " magic-space 

alias rm='python ${HOME}/workspace/git/DevEnv/recycle.py ~/recycle_bin '~ ~/install ~/git' '
alias dir="find . | grep -v -E '(.git)'"
alias ag='alias | grep '
alias gpull='git pull origin master'
alias gpush='git push origin master'

#256color
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
    export TERM='xterm-256color'
else
    export TERM='xterm-color'
fi

#autojump
[[ -s $HOME/.autojump/etc/profile.d/autojump.sh ]] && source $HOME/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u

#forbit zsh to expand regex *
setopt no_nomatch

bindkey '^p' autosuggest-accept

source ~/.specific_zshrc
