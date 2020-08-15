#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# please is a "sudo !!" alias
alias please='sudo $(fc -ln -1)'

# pacman aliases
alias pac='sudo pacman -S'   # install
alias pacu='sudo pacman -Syu'    # update, add 'a' to the list of letters to update AUR packages if you use yaourt
alias pacaur='sudo yay -Syu' # update, with AUR
alias pacr='sudo pacman -Rs'   # remove
alias pacs='sudo pacman -Ss'      # search
alias paci='sudo pacman -Si'      # info
alias pacl='sudo pacman -Qe'      # list packages
alias paclo='sudo pacman -Qdt'    # list orphans
alias pacro='paclo && sudo pacman -Rns $(pacman -Qtdq)' # remove orphans
alias pacc='sudo pacman -Scc'    # clean cache
alias paclf='sudo pacman -Ql'   # list files

# other aliases
alias bye='shutdown now'
alias bluetooth='bluetoothctl'
alias wifi='nmtui'
alias wifi-signal='nmcli networking connectivity'
