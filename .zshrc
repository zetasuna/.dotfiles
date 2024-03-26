#            _      #
#           | |     #
#    _______| |__   #
#   |_  / __| '_ \  #
#  _ / /\__ \ | | | #
# (_)___|___/_| |_| #
#####################

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

# Zstyle {{{
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
#}}}

# Source {{{
source /home/$USER/.config/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source /home/$USER/.config/powerlevel10k/powerlevel10k.zsh-theme
source /home/$USER/.config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#source /home/$USER/.config/zsh-autocomplete/zsh-autocomplete.plugin.zsh
#source /home/$USER/.config/powerlevel10k/powerlevel10k.zsh-theme
#source /home/$USER/.config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#[[ ! -f /home/$USER/.p10k.zsh ]] || source /home/$USER/.p10k.zsh
#[ -f /home/$USER/.fzf.zsh ] && source /home/$USER/.fzf.zsh
#}}}

# Alias {{{
alias -g ls='ls --color=always'
alias -g grep='grep --color=always'
alias -g ip='ip --color=always'
alias -g -- -h='-h 2>&1 | batcat --language=help --style=plain'
alias -g -- --help='--help 2>&1 | batcat --language=help --style=plain'
#}}}

# Export {{{
export PS2='%F{76}⮩ %f'
export MANPAGER="sh -c 'col -bx | batcat -l man -p'"
export MANROFFOPT="-c"
#}}}


# public IP
# dig +short myip.opendns.com @resolver1.opendns.com
# Volumn
# echo "`wpctl get-volume @DEFAULT_SINK@ | sed 's/.* //'`" '* 100' | bc | sed 's/\..*/%/'

