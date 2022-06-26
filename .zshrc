# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob
bindkey -v
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/krypt0/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Custom Functions

## My function for extracting zipped files
function extract {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
 else
    for n in "$@"
    do
      if [ -f "$n" ] ; then
          case "${n%,}" in
            *.cbt|*.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar)
                         tar xvf "$n"       ;;
            *.lzma)      unlzma ./"$n"      ;;
            *.bz2)       bunzip2 ./"$n"     ;;
            *.cbr|*.rar)       unrar x -ad ./"$n" ;;
            *.gz)        gunzip ./"$n"      ;;
            *.cbz|*.epub|*.zip)       unzip ./"$n"       ;;
            *.z)         uncompress ./"$n"  ;;
            *.7z|*.arj|*.cab|*.cb7|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.pkg|*.rpm|*.udf|*.wim|*.xar)
                         7z x ./"$n"        ;;
            *.xz)        unxz ./"$n"        ;;
            *.exe)       cabextract ./"$n"  ;;
            *.cpio)      cpio -id < ./"$n"  ;;
            *.cba|*.ace)      unace x ./"$n"      ;;
            *)
                         echo "extract: '$n' - unknown archive method"
                         return 1
                         ;;
          esac
      else
          echo "'$n' - file does not exist"
          return 1
      fi
    done
fi
}

# Plugins for autosuggestions and highlightings
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# My custom aliases

## Editor aliases
alias doom='~/.emacs.d/bin/doom'
alias vim='lvim'

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
