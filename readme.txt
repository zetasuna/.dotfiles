==============================================================
==============================================================
==============================================================
=======                                .-----.         =======
=======     .----------------------.   | === |         =======
=======     |.-""""""""""""""""""-.|   |-----|         =======
=======     ||                    ||   | === |         =======
=======     ||    NAM .DOTFILES   ||   |-----|         =======
=======     ||                    ||   | === |         =======
=======     ||                    ||   |-----|         =======
=======     ||:Tutor              ||   |:::::|         =======
=======     |'-..................-'|   |____o|         =======
=======     `"")----------------(""`   ___________     =======
=======    /::::::::::|  |::::::::::\  \ no mouse \    =======
=======   /:::========|  |==hjkl==:::\  \ required \   =======
=======  '""""""""""""'  '""""""""""""'  '""""""""""'  =======
==============================================================
==============================================================
==============================================================
1: Download Debian: https://www.debian.org/download
2: Install Debian
3: Login as root and run:
	+) apt update && apt upgrade
	+) apt install -y git sudo openssh-client openssh-server
	+) adduser NAME_OF_USER sudo
	+) logout
4: Login as user and run:
	+) git config --global user.name  "zetasuna"
	+) git config --global user.email "nguyenducnam2107@gmail.com"
	+) ssh-keygen -t rsa -b 4096 -C "nguyenducnam2107@gmail.com"
	+) cat /home/$USER/.ssh/id_rsa.pub
	+) copy string to ssh key in github
	+) git clone git@github.com:zetasuna/.dotfiles.git
	+) chmod +x ~/.dotfiles/install && ~/.dotfiles/install
5: Logout and Login again, wait some minutes


                   << Packages/Tools >>
┏━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━┓
┃ +) 1.1.1.1    ┃ +) Perl                ┃ +) Tldr       ┃
┃ +) GCP        ┃ +) Python              ┃ +) fzf        ┃
┃ +) Nix        ┃ +) Golang              ┃ +) Bat        ┃
┃ +) nmcli      ┃ +) Rust                ┃ +) Ripgrep    ┃
┃ +) nmtui      ┃ +) npm                 ┃ +) fd         ┃
┃               ┣━━━━━━━━━━━━━━━━━━━━━━━━┫ +) mpv        ┃
┃               ┃ +) Brave Browser       ┃ +) yt-dlp     ┃
┃               ┃ +) ProtonVPN           ┃ +) archiver   ┃
┃               ┃ +) Transmission        ┃               ┃
┃               ┃ +) Syncthing           ┃               ┃
┃               ┃ +) Gopass              ┃               ┃
┃               ┣━━━━━━━━━━━━━━━━━━━━━━━━┫               ┃
┃               ┃ +) ST Terminal         ┃               ┃
┃               ┃ +) Tmux                ┃               ┃
┃               ┃ +) Fish                ┃               ┃
┃               ┃ +) Neovim              ┃               ┃
┃               ┃ +) Git                 ┃               ┃
┃               ┃ +) Git lfs             ┃               ┃
┃               ┃ +) Lazygit             ┃               ┃
┃               ┃ +) Docker              ┃               ┃
┃               ┃ +) Lazydocker          ┃               ┃
┃               ┣━━━━━━━━━━━━━━━━━━━━━━━━┫               ┃
┃               ┃ +) Ibus-Bamboo         ┃               ┃
┃               ┃ +) Virtualbox          ┃               ┃
┃               ┃ +) ani-cli             ┃               ┃
┗━━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━━┛


                 << Custom Key Binding >>
┏━━━━━━━┳━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
┃ Tools ┃  Binding  ┃                Mean                ┃
┣━━━━━━━╋━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃Tmux   ┃F1         ┃protonvpn-cli disconnect            ┃
┃Tmux   ┃F2         ┃protonvpn-cli connect (fast + tcp)  ┃
┃Tmux   ┃F3         ┃protonvpn-cli connect (manual)      ┃
┃Tmux   ┃F4         ┃warp-cli connect                    ┃
┃Tmux   ┃F5         ┃Btop                                ┃
┃Tmux   ┃F6         ┃warp-cli disconnect                 ┃
┃Tmux   ┃F7         ┃File Mangager                       ┃
┃Tmux   ┃F8         ┃Lazygit                             ┃
┃Tmux   ┃F9         ┃Quick Search and Open File          ┃
┃Tmux   ┃Prefix S   ┃Save Environment                    ┃
┃Tmux   ┃Prefix R   ┃Restore Environment                 ┃
┣━━━━━━━╋━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃Neovim ┃...........┃....................................┃
┗━━━━━━━┻━━━━━━━━━━━┻━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

