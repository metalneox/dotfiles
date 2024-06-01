#source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
#source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
#source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
#source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh


#POWERLEVEL9K_MODE='awesome-fontconfig'
#ZSH_THEME="powerlevel10k/powerlevel10k"

#POWERLEVEL9K_PROMPT_ON_NEWLINE=false
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
#POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs time)

HIST_STAMPS="mm/dd/yyyy"

#emacs mode
bindkey -e

alias vim="nvim"
alias lvim="~/.local/bin/lvim"
alias exa="exa --icons"
alias ls="ls --color=auto"
alias meteo="curl wttr.in"
alias dd="dd status=progress"
alias grep="grep --color=auto" 
alias diff="diff --color=auto" 
alias pacman="pacman --color=auto"
alias yay="yay --color=auto"
alias termbin="nc termbin.com 9999"
alias getclip="xclip -selection c -o"
alias setclip="xclip -selection c"
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
