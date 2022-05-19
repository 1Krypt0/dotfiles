# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/krypt0/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Plugins for autosuggestions and highlightings
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# My custom aliases

## Editor aliases
alias doom='~/.emacs.d/bin/doom'
alias vim='nvim'

## Changing "ls" to "exa"
alias ls='exa --color=always --group-directories-first' # my preferred listing
alias la='exa -al --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing

## Colorize grep output (good for log files)
alias grep='grep --color=auto'

## Aliases for accessing different classes

### Third-Year, First Semester
alias fsi='cd ~/Desktop/2.Areas/Uni/Third-Year/First-Semester/FSI/'
alias rc='cd ~/Desktop/2.Areas/Uni/Third-Year/First-Semester/RC/'
alias ltw='cd ~/Desktop/2.Areas/Uni/Third-Year/First-Semester/LTW/'
alias lbaw='cd ~/Desktop/2.Areas/Uni/Third-Year/First-Semester/LBAW/'
alias pfl='cd ~/Desktop/2.Areas/Uni/Third-Year/First-Semester/PFL/'

### Third-Year, Second Semester
alias cpd='cd ~/Desktop/2.Areas/Uni/Third-Year/Second-Semester/CPD/'
alias esof='cd ~/Desktop/2.Areas/Uni/Third-Year/Second-Semester/ES/'
alias ia='cd ~/Desktop/2.Areas/Uni/Third-Year/Second-Semester/IA/'
alias comp='cd ~/Desktop/2.Areas/Uni/Third-Year/Second-Semester/COMP/'
alias pi='cd ~/Desktop/2.Areas/Uni/Third-Year/Second-Semester/PI/'

# Alias for quickly accessing my blog folder
alias blog='cd ~/Desktop/2.Areas/Blog'

# git
alias gcl='git clone --depth 1'
alias gi='git init'
alias ga='git add -A'
alias gc='git commit -m'
alias gp='git push origin main'
alias gstat='git status'

alias sicstus='rlwrap /usr/local/sicstus4.7.0/bin/sicstus'

export EDITOR="vim"

export PATH=~/.npm-global/bin:$PATH
export JAVA_HOME='/usr/lib/jvm/java-11-openjdk' 
export PATH=$JAVA_HOME/bin:$PATH 
export PATH="$PATH:/usr/lib/dart/bin"
export PATH="$HOME/.flutter-sdk/flutter/bin:$PATH"

export PATH="$HOME/.local/bin:$PATH"

pfetch

eval "$(starship init zsh)"
