source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh


export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"


HIST_STAMPS="mm/dd/yyyy"

#emacs mode
bindkey -e

alias vim="nvim"
alias lvim="~/.local/bin/lvim"
alias ls="exa --icons"
#alias ls="ls --color=auto"
alias meteo="curl wttr.in"
alias dd="dd status=progress"
alias grep="grep --color=auto" 
alias diff="diff --color=auto" 
alias pacman="pacman --color=auto"
alias yay="yay --color=auto"
alias termbin="nc termbin.com 9999"
alias rewards="python ~/workspace/Rewards/login_rewards_dev/main.py"
alias rewards2="python ~/workspace/rewards_temp/main.py"

#alias btm="~/.cargo/bin/btm"
#alias trunk="~/.cargo/bin/trunk"


#History
HISTFILE=~/.config/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
HYPHEN_INSENSITIVE="true"

#completion
autoload -U colors && colors
autoload -Uz compinit
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric
zstyle -e ':completion:*:approximate:*' \
        max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'
zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' menu yes select
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
zstyle ':completion::complete:*' gain-privileges 1
#zstyle ':completion:*' list-colors "$colour"
zstyle ':completion:*:options' list-colors '=^(-- *)=34'
zstyle ':completion:*:*:kill:*' list-colors '=(#b) #([0-9]#)*( *[a-z])*=34=31=33'
zstyle -e ':completion:*:(ssh|scp|sshfs|ping|telnet|nc|rsync):*' hosts '
    reply=( ${=${${(M)${(f)"$(<~/.ssh/config)"}:#Host*}#Host }:#*\**} )'
zmodload zsh/complist
compinit

#rust binary
export PATH="${PATH}:${HOME}/.cargo/bin"

eval "$(starship init zsh)"
