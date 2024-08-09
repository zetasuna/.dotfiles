# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

# export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
# export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
# export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"
# export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
	source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
HISTFILE="$XDG_STATE_HOME"/zsh/history
# Completion files: Use XDG dirs
[ -d "$XDG_CACHE_HOME"/zsh ] || mkdir -p "$XDG_CACHE_HOME"/zsh
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME"/zsh/zcompcache
autoload -Uz compinit
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-$ZSH_VERSION

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000

export PS2='%F{76} %f'
export PATH="/home/$USER/.goroot/bin:/home/$USER/.nodejs/bin:/home/$USER/.cargo/bin:/opt/nvim-linux64/bin:$PATH"
# export fpath=(/home/$USER/.config/zsh-completions/src $fpath)
#export MANPAGER="sh -c 'col -bx | bat -l man -p'"
#export MANROFFOPT="-c"

# Zstyle 
eval "$(dircolors -b)"
#zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
#zstyle ':completion:*' list-colors ''
#zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
#zstyle ':completion:*' auto-description 'specify: %d'
#zstyle ':completion:*' completer _expand _complete _correct _approximate
#zstyle ':completion:*' format 'Completing %d'
#zstyle ':completion:*' group-name ''
#zstyle ':completion:*' menu select=2
#zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
#zstyle ':completion:*' menu select=long
#zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
#zstyle ':completion:*' use-compctl false
#zstyle ':completion:*' verbose true
#zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
#zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
#
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
# NOTE: don't use escape sequences here, fzf-tab will ignore them
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':completion:*' menu no
# # preview directory's content with eza when completing cd
# zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
# # switch group using `<` and `>`
# zstyle ':fzf-tab:*' switch-group '<' '>'
# # fzf-tab popup tmux
# #zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
#
# # Source 
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# [ -f /home/$USER/.config/powerlevel10k/powerlevel10k.zsh-theme ] && source /home/$USER/.config/powerlevel10k/powerlevel10k.zsh-theme
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# #[ -f /home/$USER/.config/zsh-autocomplete/zsh-autocomplete.plugin.zsh ] && source /home/$USER/.config/zsh-autocomplete/zsh-autocomplete.plugin.zsh
# [ -f /home/$USER/.config/fzf-tab/fzf-tab.plugin.zsh ] && source /home/$USER/.config/fzf-tab/fzf-tab.plugin.zsh
# [ -f /home/$USER/.config/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source /home/$USER/.config/zsh-autosuggestions/zsh-autosuggestions.zsh
# [ -f /home/$USER/.config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /home/$USER/.config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#
# # Alias 
# alias -g ls='ls --color=always'
# #alias -g grep='grep --color=always'
# alias -g ip='ip --color=always'
# #alias -g -- -h='-h 2>&1 | bat --language=help --style=plain'
# #alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'
#
# # public IP
# # dig +short myip.opendns.com @resolver1.opendns.com
# # Volumn
# # echo "`wpctl get-volume @DEFAULT_SINK@ | sed 's/.* //'`" '* 100' | bc | sed 's/\..*/%/'
#
