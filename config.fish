# NOTE: Set Environment Path
begin
    # XDG based directory
    mkdir -p $HOME/.cache
    mkdir -p $HOME/.config
    mkdir -p $HOME/.local/share
    mkdir -p $HOME/.local/state
    set -Ux XDG_CACHE_HOME $HOME/.cache
    set -Ux XDG_CONFIG_HOME $HOME/.config
    set -Ux XDG_DATA_HOME $HOME/.local/share
    set -Ux XDG_STATE_HOME $HOME/.local/state

    # Path
    set -U fish_user_paths $HOME/fish_lsp/bin $HOME/.local/bin $HOME/perl5/bin $XDG_DATA_HOME/cargo/bin $XDG_DATA_HOME/go/bin $HOME/.local/src/go/bin $HOME/.local/src/nodejs/bin /usr/local/bin /usr/local/sbin /usr/bin /usr/sbin /bin /sbin
    source $HOME/.venv/bin/activate.fish

    # Perl
    set -q PERL5LIB; and set -x PERL5LIB /home/$USER/perl5/lib/perl5:/home/$USER/perl5/lib/perl5
    set -q PERL5LIB; or set -x PERL5LIB /home/$USER/perl5/lib/perl5
    set -q PERL_LOCAL_LIB_ROOT; and set -x PERL_LOCAL_LIB_ROOT /home/$USER/perl5:/home/$USER/perl5
    set -q PERL_LOCAL_LIB_ROOT; or set -x PERL_LOCAL_LIB_ROOT /home/$USER/perl5
    set -x PERL_MB_OPT --install_base\ "/home/$USER/perl5"
    set -x PERL_MM_OPT INSTALL_BASE=/home/$USER/perl5

    # X11
    mkdir -p $XDG_CONFIG_HOME/X11
    mkdir -p $XDG_DATA_HOME/X11
    mkdir -p $XDG_CACHE_HOME/X11
    set -gx XINITRC $XDG_CONFIG_HOME/X11/xinitrc
    set -gx XSERVERRC $XDG_CONFIG_HOME/X11/xserverrc
    set -gx USERXSESSION $XDG_CACHE_HOME/X11/xsession
    set -gx USERXSESSIONRC $XDG_CACHE_HOME/X11/xsessionrc
    set -gx ALTUSERXSESSION $XDG_CACHE_HOME/X11/Xsession
    set -gx ERRFILE $XDG_CACHE_HOME/X11/xsession-errors
    set -gx XAUTHORITY $XDG_RUNTIME_DIR/Xauthority
    set -gx XCURSOR_PATH $XDG_DATA_HOME/icons
    set -gx XCOMPOSEFILE $XDG_CONFIG_HOME/X11/xcompose
    set -gx XCOMPOSECACHE $XDG_CACHE_HOME/X11/xcompose

    # Shell
    mkdir -p $XDG_CONFIG_HOME/readline
    mkdir -p $XDG_CONFIG_HOME/zsh
    set -gx INPUTRC $XDG_CONFIG_HOME/readline/inputrc
    set -gx ZDOTDIR $XDG_CONFIG_HOME/zsh

    # Ibus bamboo
    set -gx GLFW_IM_MODULE ibus
    set -gx GTK_IM_MODULE xim
    set -gx QT_IM_MODULE ibus
    set -gx QT4_IM_MODULE ibus
    set -gx CLUTTER_IM_MODULE ibus
    set -gx XMODIFIERS @im=ibus

    # Tools
    set -gx ACKRC $XDG_CONFIG_HOME/ack/ackrc
    set -gx ANSIBLE_HOME $XDG_CONFIG_HOME/ansible
    set -gx ANSIBLE_CONFIG $XDG_CONFIG_HOME/ansible.cfg
    set -gx ANSIBLE_GALAXY_CACHE_DIR $XDG_CACHE_HOME/ansible/galaxy_cache
    set -gx AWS_SHARED_CREDENTIALS_FILE $XDG_CONFIG_HOME/aws/credentials
    set -gx AWS_CONFIG_FILE $XDG_CONFIG_HOME/aws/config
    set -gx BASH_COMPLETION_USER_FILE $XDG_CONFIG_HOME/bash-completion/bash_completion
    set -gx CALCHISTFILE $XDG_STATE_HOME/calc_history
    set -gx CARGO_HOME $XDG_DATA_HOME/cargo
    set -gx RUSTUP_HOME $XDG_DATA_HOME/rustup
    set -gx CUDA_CACHE_PATH $XDG_CACHE_HOME/nv
    set -gx DOCKER_CONFIG $XDG_CONFIG_HOME/docker
    set -gx MACHINE_STORAGE_PATH $XDG_DATA_HOME/docker-machine
    set -gx ELINKS_CONFDIR $XDG_CONFIG_HOME/elinks
    set -gx FFMPEG_DATADIR $XDG_CONFIG_HOME/ffmpeg
    set -gx GNUPGHOME $XDG_DATA_HOME/gnupg
    # set -gx GOROOT $HOME/.local/src/go
    set -gx GOPATH $XDG_DATA_HOME/go
    set -gx GOMODCACHE $XDG_CACHE_HOME/go/mod
    set -gx GTK_RC_FILES $XDG_CONFIG_HOME/gtk-1.0/gtkrc
    set -gx GTK2_RC_FILES $XDG_CONFIG_HOME/gtk-2.0/gtkrc $XDG_CONFIG_HOME/gtk-2.0/gtkrc.mine
    set -gx K9SCONFIG $XDG_CONFIG_HOME/k9s
    set -gx KUBECONFIG $XDG_CONFIG_HOME/kube
    set -gx KUBECACHEDIR $XDG_CACHE_HOME/kube
    set -gx LYNX_CFG $XDG_CONFIG_HOME/lynx.cfg
    set -gx MINIKUBE_HOME $XDG_DATA_HOME/minikube
    set -gx MPLAYER_HOME $XDG_CONFIG_HOME/mplay
    set -gx MYSQL_HISTFILE $XDG_STATE_HOME/mysql_history
    set -gx TERMINFO $XDG_DATA_HOME/terminfo
    set -gx TERMINFO_DIRS $XDG_DATA_HOME/terminfo /usr/share/terminfo
    set -gx N_PREFIX $XDG_DATA_HOME/n
    set -gx NB_DIR $XDG_DATA_HOME/nb
    set -gx NBRC_PATH $XDG_CONFIG_HOME/nbrc
    set -gx NODENV_ROOT $XDG_DATA_HOME/nodenv
    set -gx NODE_REPL_HISTORY $XDG_STATE_HOME/node_repl_history
    set -gx NVM_DIR $XDG_DATA_HOME/nvm
    set -gx OMNISHARPHOME $XDG_CONFIG_HOME/omnisharp
    set -gx PARALLEL_HOME $XDG_CONFIG_HOME/parallel
    set -gx PLATFORMIO_CORE_DIR $XDG_DATA_HOME/platformio
    set -gx PSQLRC $XDG_CONFIG_HOME/pg/psqlrc
    set -gx PSQL_HISTORY $XDG_STATE_HOME/psql_history
    set -gx PGPASSFILE $XDG_CONFIG_HOME/pg/pgpass
    set -gx PGSERVICEFILE $XDG_CONFIG_HOME/pg/pg_service.conf
    set -gx PYTHON_HISTORY $XDG_STATE_HOME/python/history
    set -gx PYTHONPYCACHEPREFIX $XDG_CACHE_HOME/python
    set -gx PYTHONUSERBASE $XDG_DATA_HOME/python
    set -gx WORKON_HOME $XDG_DATA_HOME/virtualenvs
    set -gx RBENV_ROOT $XDG_DATA_HOME/rbenv
    set -gx BUNDLE_USER_CACHE $XDG_CACHE_HOME/bundle
    set -gx BUNDLE_USER_CONFIG $XDG_CONFIG_HOME/bundle/config
    set -gx BUNDLE_USER_PLUGIN $XDG_DATA_HOME/bundle
    set -gx RIPGREP_CONFIG_PATH $XDG_CONFIG_HOME/ripgrep/config
    set -gx SCREENRC $XDG_CONFIG_HOME/screen/screenrc
    set -gx STARSHIP_CONFIG $XDG_CONFIG_HOME/starship.toml
    set -gx STARSHIP_CACHE $XDG_CACHE_HOME/starship
    set -gx TLDR_CACHE_DIR $XDG_CACHE_HOME/tldr # Only work with rust client
    set -gx W3M_DIR $XDG_STATE_HOME/w3m
    set -gx WGETRC $XDG_CONFIG_HOME/wgetrc
    mkdir -p $XDG_DATA_HOME/wineprefixes
    set -gx WINEPREFIX $XDG_DATA_HOME/wineprefixes/default
    set -gx _Z_DATA $XDG_DATA_HOME/z
end

# NOTE: Fish is interactive
if status is-interactive
    if not type -q fisher
        curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
    end
    if type -q fisher
        if not string match -qr /tide (fisher list)
            fisher install IlanCosman/tide@v6
        end
        if not string match -qr jethrokuan/fzf (fisher list)
            fisher install jethrokuan/fzf
        end
    end
    # Auto start Tmux Session
    if not status is-login
        and type -q tmux
        and test -z "$TMUX"
        and not string match -qr 'screen|tmux' "$TERM"
        # tmux new-session -As Main
    end

    # NOTE: Environment Variable
    if test -d ~/.dotfiles/pictures
        set -g fish_greeting (chafa --center=on --format=sixels --size=80x10 (random choice ~/.dotfiles/pictures/**))
    else
        set -g fish_greeting
    end
    set -g fish_key_bindings fish_vi_key_bindings
    set -g fish_cursor_default block
    set -g fish_cursor_insert line
    set -g fish_cursor_visual block
    set -g fish_cursor_external block
    set -g fish_cursor_replace block
    set -g fish_cursor_replace_one block
    set -g fish_escape_delay_ms 30
    set -g fish_sequence_key_delay_ms 500
    set -gx EDITOR nvim
    set -Ux MANPAGER "sh -c 'col -bx | bat -l man -p'"
    set -Ux MANROFFOPT -c
    # FZF Config
    set -Ux FZF_DEFAULT_OPTS "--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4 --height=50%  --reverse --multi --info=default --prompt=\"❱ \" --pointer=󰄾 --marker=● --preview-window=right:wrap:60%"
    set -U FZF_COMPLETE 3
    set -U FZF_FIND_FILE_COMMAND "fd --strip-cwd-prefix -HLc auto"
    set -U FZF_PREVIEW_FILE_CMD "bat -n --color=always --theme=Dracula"
    set -U FZF_PREVIEW_DIR_CMD "ls -alhv --color=always --group-directories-first"
    set -U FZF_LEGACY_KEYBINDINGS 1
    set -U FZF_DISABLE_KEYBINDINGS 0

    # NOTE: Fish Shell Dracula Theme
    # Dracula Color Palette
    set -l foreground f8f8f2
    set -l selection 44475a
    set -l comment 6272a4
    set -l red ff5555
    set -l orange ffb86c
    set -l yellow f1fa8c
    set -l green 50fa7b
    set -l purple bd93f9
    set -l cyan 8be9fd
    set -l pink ff79c6
    # Syntax Highlighting Colors
    set -gx fish_color_normal $foreground
    set -gx fish_color_command $cyan
    set -gx fish_color_keyword $pink
    set -gx fish_color_quote $yellow
    set -gx fish_color_redirection $foreground
    set -gx fish_color_end $orange
    set -gx fish_color_error $red
    set -gx fish_color_param $purple
    set -gx fish_color_comment $comment
    set -gx fish_color_selection --background=$selection
    set -gx fish_color_search_match --background=$selection
    set -gx fish_color_operator $green
    set -gx fish_color_escape $pink
    set -gx fish_color_autosuggestion $comment
    set -gx fish_color_cancel $red --reverse
    set -gx fish_color_option $orange
    set -gx fish_color_history_current --bold
    set -gx fish_color_status ff5555
    set -gx fish_color_valid_path --underline
    # Default Prompt Colors
    set -gx fish_color_cwd $green
    set -gx fish_color_host $purple
    set -gx fish_color_host_remote $purple
    set -gx fish_color_user $cyan
    # Completion Pager Colors
    set -gx fish_pager_color_progress $comment
    set -gx fish_pager_color_background
    set -gx fish_pager_color_prefix $cyan
    set -gx fish_pager_color_completion $foreground
    set -gx fish_pager_color_description $comment
    set -gx fish_pager_color_selected_background --background=$selection
    set -gx fish_pager_color_selected_prefix $cyan
    set -gx fish_pager_color_selected_completion $foreground
    set -gx fish_pager_color_selected_description $comment
    set -gx fish_pager_color_secondary_background
    set -gx fish_pager_color_secondary_prefix $cyan
    set -gx fish_pager_color_secondary_completion $foreground
    set -gx fish_pager_color_secondary_description $comment

    # NOTE: Tide Prompt Theme
    # Prompt
    set -U tide_prompt_add_newline_before false
    set -U tide_prompt_color_frame_and_connection "#f8f8f2"
    set -U tide_prompt_color_separator_same_color "#282a36"
    set -U tide_prompt_icon_connection "─"
    set -U tide_prompt_min_cols 34
    set -U tide_prompt_pad_items true
    set -U tide_prompt_transient_enabled true
    # Left Prompt
    set -U tide_left_prompt_frame_enabled false
    set -U tide_left_prompt_items vi_mode shlvl pwd git newline character
    set -U tide_left_prompt_prefix
    set -U tide_left_prompt_suffix ""
    set -U tide_left_prompt_separator_diff_color ""
    set -U tide_left_prompt_separator_same_color ""
    # Right Prompt
    # set -U tide_right_prompt_frame_enabled true
    set -U tide_right_prompt_frame_enabled false # May set to "true" due overcolor in nextline when restore session tmux
    set -U tide_right_prompt_items status cmd_duration jobs toolbox aws gcloud pulumi terraform docker kubectl zig elixir crystal rustc ruby php java go node python direnv nix_shell distrobox context private_mode newline time
    set -U tide_right_prompt_prefix ""
    set -U tide_right_prompt_suffix
    set -U tide_right_prompt_separator_diff_color ""
    set -U tide_right_prompt_separator_same_color ""
    # Custom Items
    set -U tide_aws_bg_color "#424450"
    set -U tide_aws_color "#bd93f9"
    set -U tide_aws_icon 
    set -U tide_character_color "#50fa7b"
    set -U tide_character_color_failure "#ff5555"
    set -U tide_character_icon ❱
    set -U tide_character_vi_icon_default ❱
    set -U tide_character_vi_icon_replace ❱
    set -U tide_character_vi_icon_visual ❱
    set -U tide_cmd_duration_bg_color "#424450"
    set -U tide_cmd_duration_color "#bd93f9"
    set -U tide_cmd_duration_icon 
    set -U tide_cmd_duration_decimals 0
    set -U tide_cmd_duration_threshold 1000
    set -U tide_context_bg_color "#424450"
    set -U tide_context_color_default "#bd93f9"
    set -U tide_context_color_root "#ff5555"
    set -U tide_context_color_ssh "#ffb86c"
    set -U tide_context_always_display false
    set -U tide_context_hostname_parts 0
    set -U tide_crystal_bg_color "#424450"
    set -U tide_crystal_color "#bd93f9"
    set -U tide_crystal_icon 
    set -U tide_distrobox_bg_color "#424450"
    set -U tide_distrobox_color "#bd93f9"
    set -U tide_distrobox_icon 
    set -U tide_direnv_bg_color "#424450"
    set -U tide_direnv_color "#bd93f9"
    set -U tide_direnv_bg_color_denied "#424450"
    set -U tide_direnv_color_denied "#ff5555"
    set -U tide_direnv_icon 󰌪
    set -U tide_docker_bg_color "#424450"
    set -U tide_docker_color "#bd93f9"
    set -U tide_docker_icon 
    set -U tide_docker_default_contexts default colima
    set -U tide_elixir_bg_color "#424450"
    set -U tide_elixir_color "#bd93f9"
    set -U tide_elixir_icon 
    set -U tide_git_bg_color "#424450"
    set -U tide_git_bg_color_unstable "#424450"
    set -U tide_git_bg_color_urgent "#424450"
    set -U tide_git_color_branch "#bd93f9"
    set -U tide_git_color_conflicted "#ff5555"
    set -U tide_git_color_dirty "#8be9fd"
    set -U tide_git_color_operation "#ff5555"
    set -U tide_git_color_staged "#8be9fd"
    set -U tide_git_color_stash "#50fa7b"
    set -U tide_git_color_untracked "#ffb86c"
    set -U tide_git_color_upstream "#50fa7b"
    set -U tide_git_icon 
    set -U tide_git_truncation_length 24
    set -U tide_git_truncation_strategy l
    set -U tide_gcloud_bg_color "#424450"
    set -U tide_gcloud_color "#bd93f9"
    set -U tide_gcloud_icon 󱇶
    set -U tide_go_bg_color "#424450"
    set -U tide_go_color "#bd93f9"
    set -U tide_go_icon 󰟓
    set -U tide_java_bg_color "#424450"
    set -U tide_java_color "#bd93f9"
    set -U tide_java_icon 
    set -U tide_jobs_bg_color "#424450"
    set -U tide_jobs_color "#bd93f9"
    set -U tide_jobs_icon 
    set -U tide_jobs_number_threshold 0
    set -U tide_kubectl_bg_icon "#424450"
    set -U tide_kubectl_color "#bd93f9"
    set -U tide_kubectl_icon 
    set -U tide_nix_shell_bg_color "#424450"
    set -U tide_nix_shell_color "#bd93f9"
    set -U tide_nix_shell_icon 
    set -U tide_node_bg_color "#424450"
    set -U tide_node_color "#bd93f9"
    set -U tide_node_icon 
    set -U tide_os_bg_color "#424450"
    set -U tide_os_color "#bd93f9"
    # set -U tide_os_icon 
    set -U tide_php_bg_color "#424450"
    set -U tide_php_color "#bd93f9"
    set -U tide_php_icon 󰌟
    set -U tide_private_mode_bg_color "#424450"
    set -U tide_private_mode_color "#bd93f9"
    set -U tide_private_mode_icon 󰗹
    set -U tide_pulumi_bg_color "#424450"
    set -U tide_pulumi_color "#bd93f9"
    # set -U tide_pulumi_icon 
    set -U tide_pwd_bg_color "#424450"
    set -U tide_pwd_color_anchors "#bd93f9"
    set -U tide_pwd_color_dirs "#bd93f9"
    set -U tide_pwd_color_truncated_dirs "#bd93f9"
    set -U tide_pwd_icon 
    set -U tide_pwd_icon_home 
    set -U tide_pwd_icon_unwritable 󰞀
    set -U tide_python_bg_color "#424450"
    set -U tide_python_color "#bd93f9"
    set -U tide_python_icon 
    set -U tide_ruby_bg_color "#424450"
    set -U tide_ruby_color "#bd93f9"
    set -U tide_ruby_icon 
    set -U tide_rustc_bg_color "#424450"
    set -U tide_rustc_color "#bd93f9"
    set -U tide_rustc_icon 
    set -U tide_shlvl_bg_color "#424450"
    set -U tide_shlvl_color "#bd93f9"
    set -U tide_shlvl_icon 󰆍
    set -U tide_shlvl_threshold 0
    set -U tide_status_bg_color "#424450"
    set -U tide_status_color "#50fa7b"
    set -U tide_status_icon ✔
    set -U tide_status_bg_color_failure "#424450"
    set -U tide_status_color_failure "#ff5555"
    set -U tide_status_icon_failure ✘
    set -U tide_terraform_bg_color "#424450"
    set -U tide_terraform_color "#bd93f9"
    set -U tide terraform_icon 󱁢
    set -U tide_time_bg_color "#282a36"
    set -U tide_time_color "#50fa7b"
    set -U tide_time_format "%a %d/%m/%Y "
    set -U tide_toolbox_bg_color "#424450"
    set -U tide_toolbox_color "#bd93f9"
    set -U tide_toolbox_icon 
    set -U tide_vi_mode_bg_color_default "#bd93f9"
    set -U tide_vi_mode_color_default "#282a36"
    set -U tide_vi_mode_icon_default 
    set -U tide_vi_mode_bg_color_insert "#50fa7b"
    set -U tide_vi_mode_color_insert "#282a36"
    set -U tide_vi_mode_icon_insert 
    set -U tide_vi_mode_bg_color_replace "#ff79c6"
    set -U tide_vi_mode_color_replace "#282a36"
    set -U tide_vi_mode_icon_replace 
    set -U tide_vi_mode_bg_color_visual "#ffb86c"
    set -U tide_vi_mode_color_visual "#282a36"
    set -U tide_vi_mode_icon_visual 
    set -U tide_zig_bg_color "#424450"
    set -U tide_zig_color "#bd93f9"
    set -U tide_zig_icon 

    # NOTE: Alias
    alias ls 'ls -ahv --color=auto --group-directories-first'
    alias ll 'ls -alhv --color=always --group-directories-first'
    alias tldr 'tldr -t base16'
    alias bat 'bat --color=auto --theme=Dracula'
    alias mpv 'mpv --keep-open=yes --really-quiet --vo-sixel-exit-clear=no'
    alias wget 'wget --hsts-file=$XDG_CACHE_HOME/wget-hsts'
    # alias fd 'fd --strip-cwd-prefix -HL'
    # alias rg 'rg -uu -L'

    # NOTE: Abbreviations
    function multicd
        echo cd (string repeat -n (math (string length -- $argv[1]) - 1) ../)
    end
    abbr --add dotdot --regex '^\.\.+$' --function multicd
    abbr --add n nvim
    abbr --add tm tmux new-session -As Main
    abbr --add mpvs mpv --vo=sixel

    # NOTE: Binding
    bind \[1\;2A __fzf_reverse_isearch
    bind \[1\;2B __fzf_find_file
end

# NOTE: Fish is login
if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 2
        # exec startx -- -keeptty >/dev/null 2>&1
    end
end
