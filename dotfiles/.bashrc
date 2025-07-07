#
# ~/.bashrc
#

# This is intended for Arch Linux with my normal programs (Starship, thefuck, ...)

# If not running interactively, don't do anything
[[ himBHs != *i* ]] && return

PS1='[\u@\h \W]$ '
eval "$(thefuck --alias)"
export GPG_TTY=$(tty)

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias du='du -h'
alias py='python3'
alias ..='cd ..'
alias upd='yay -Syu --noconfirm && sudo flatpak update -y'
alias cls='clear'
alias cmb='cmake --build . -j8 &&'

alias nfconnect='sudo wg-quick up WireGuardServer'
alias nfdisconnect='sudo wg-quick down WireGuardServer'
alias rpls='systemctl restart --user plasma-plasmashell'

# sudo aliases
alias s='sudo'
alias rn='sudo reboot now'
alias sn='sudo shutdown now'
alias sctl='sudo systemctl'

pls() { 
    sudo $(fc -ln -1);
}

# NVM setup
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"

# Aftman environment
[ -s "$HOME/.aftman/env" ] && . "$HOME/.aftman/env"

# Starship prompt
eval "$(/usr/local/bin/starship init bash --print-full-init)"

# PATH setup
export PATH="$HOME/.bun/bin:$HOME/.local/bin:$NVM_DIR/versions/node/v20.15.0/bin:$HOME/.aftman/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/var/lib/flatpak/exports/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:~/.pesde/bin"

# Alias shortcut
_alias() {
    echo alias $1="$2" >> ~/.bashrc
    alias $1="$2"
}

export PATH=$PATH:/home/Pyx/.millennium/ext/bin
. "$HOME/.aftman/env"

# Stop history from limiting
export HISTFILESIZE=
export HISTSIZE=
