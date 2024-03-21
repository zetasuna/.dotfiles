# Created by newuser for 5.9
source /home/$USER/.config/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source /home/$USER/.config/powerlevel10k/powerlevel10k.zsh-theme

alias -g ls='ls --color=always'
alias -g grep='grep --color=always'
alias -g ip='ip --color=always'
alias -g bat='batcat'
alias -g -- -h='-h 2>&1 | bat --language=help --style=plain'
alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'

export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"

source /home/$USER/.config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
