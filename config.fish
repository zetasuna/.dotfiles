if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -q PERL5LIB; and set -x PERL5LIB /home/$USER/perl5/lib/perl5:/home/$USER/perl5/lib/perl5
set -q PERL5LIB; or set -x PERL5LIB /home/$USER/perl5/lib/perl5
set -q PERL_LOCAL_LIB_ROOT; and set -x PERL_LOCAL_LIB_ROOT /home/$USER/perl5:/home/$USER/perl5
set -q PERL_LOCAL_LIB_ROOT; or set -x PERL_LOCAL_LIB_ROOT /home/$USER/perl5
set -x PERL_MB_OPT --install_base\ "/home/$USER/perl5"
set -x PERL_MM_OPT INSTALL_BASE=/home/$USER/perl5

# NOTE: Environment Variable 
set -g fish_greeting
set -gx EDITOR hx
set -Ux MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -Ux MANROFFOPT -c
set -Ux FZF_DEFAULT_OPTS "--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4 --height=50%  --reverse --multi --info=default --prompt=\" \" --pointer= --marker= --preview-window=right:60%"
set -U FZF_COMPLETE 3
set -U FZF_FIND_FILE_COMMAND "fd --strip-cwd-prefix -HLc auto"
set -U FZF_PREVIEW_FILE_CMD "bat -n --color=always --theme=Dracula"
set -U FZF_PREVIEW_DIR_CMD "ls -alhv --color=always --group-directories-first"
set -U FZF_LEGACY_KEYBINDINGS 1
set -U FZF_DISABLE_KEYBINDINGS 0

# NOTE: Alias
alias ls 'ls -ahv --color=auto --group-directories-first'
alias ll 'ls -alhv --color=always --group-directories-first'
alias xo xdg-open
alias vi nvim
alias tldr 'tldr -t base16'
alias bat 'bat --color=auto --theme=Dracula'
alias mpv 'mpv --keep-open=yes --quiet'

# NOTE: Binding
# bind \[15\~ 'fileManager'
bind \[1\;2A __fzf_reverse_isearch
bind \[1\;2B __fzf_find_file

# NOTE: Other Scripts
if type -q tmux
    and status is-interactive
    and test -z "$TMUX"
    and not string match -qr 'screen|tmux' "$TERM"
    tmux new-session -As Main
end

# NOTE: More function
function manage
    while true
        set selection (ls -ahv --color=auto --group-directories-first | fzf \
    --bind="left:pos(2)+accept" \
    --bind="right:accept" \
    --bind="shift-up:preview-up" \
    --bind="shift-down:preview-down" \
    --bind="space:toggle" \
    --height=100% \
    --reverse \
    --multi \
    --info=default\
    --prompt=" " \
    --pointer= \
    --marker= \
    --border=bold \
    --border-label=$(pwd) \
    --preview-window=right:60% \
    --preview='
    set sel (echo {} | cut -d " " -f 2);
    set cd_pre (echo $(pwd)/$(echo {}));
    set cur_file (file $(echo $sel) | grep [Tt]ext | wc -l);
    if test (file $(echo $sel) | grep [Dd]irectory | wc -l) -ge 1
    echo " " $cd_pre;
    ls -alhv --color=always --group-directories-first "$cd_pre";
    else 
    echo " " $cd_pre;
    bat --style=numbers --theme=Dracula --color=always $sel 2>/dev/null
    end
    ')
        if test -d "$selection"
            cd "$selection"
        else if test -f "$selection"
            set file_type (if string match -qr '\.lua|\.json' "$selection"; echo "text"; else; file -b --mime-type "$selection" | cut -d'/' -f1; end)
            switch $file_type
                case text
                    hx "$selection"
                    # case "image"
                    #   for fType in $selection
                    #     if string match '*.xcf' $fType
                    #       gimp $selection 2>/dev/null
                    #     else
                    #       librewolf $selection
                    #     end
                    #   end
                    # case "video"
                    #   librewolf $selection 2>/dev/null &
                    # case "application"
                    #   for fType in $selection
                    #     if string match '*.docx' $fType
                    #       libreoffice $selection 2>/dev/null &
                    #     else if string match '*.odt' $fType
                    #       libreoffice $selection 2>/dev/null &
                    #     else if string match '*.pptx' $fType
                    #       libreoffice $selection 2>/dev/null &
                    #     else if string match '*.pdf' $fType
                    #       librewolf $selection 2>/dev/null &
                    #     end
                    #   end
                case inode
                    hx "$selection"
                case '*'
                    xdg-open "$selection"
            end
        else
            break
        end
    end
end
