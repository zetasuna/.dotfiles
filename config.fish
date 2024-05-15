if status is-interactive
	# Commands to run in interactive sessions can go here
end

set -gx EDITOR nvim
set -q PERL5LIB; and set -x PERL5LIB /home/$USER/perl5/lib/perl5:/home/$USER/perl5/lib/perl5;
set -q PERL5LIB; or set -x PERL5LIB /home/$USER/perl5/lib/perl5;
set -q PERL_LOCAL_LIB_ROOT; and set -x PERL_LOCAL_LIB_ROOT /home/$USER/perl5:/home/$USER/perl5;
set -q PERL_LOCAL_LIB_ROOT; or set -x PERL_LOCAL_LIB_ROOT /home/$USER/perl5;
set -x PERL_MB_OPT --install_base\ "/home/$USER/perl5";
set -x PERL_MM_OPT INSTALL_BASE=/home/$USER/perl5;
set -g fish_greeting

alias ls 'ls -ahv --color=auto --group-directories-first'
alias ll 'ls -alhv --color=always --group-directories-first'
alias bat 'bat --color=always --theme=Dracula'
alias vi 'nvim'
bind \e1 fileManager
bind \e2 __fzf_reverse_isearch
bind \e3 __fzf_find_file
bind \e4 '__fzf_cd --hidden'
