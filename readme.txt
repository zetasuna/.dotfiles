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

Shell: Python => xonsh

Display manager: ly
=====================================================================
Web text: w3m

Office: LibreOffice

Document converters: pandoc [https://pandoc.org]

E-book Reader: baca [https://github.com/wustho/baca]

Image: chafa [https://github.com/hpjansson/chafa?tab=readme-ov-file]

Note: nb [https://xwmx.github.io/nb]

ascii: arttime [https://github.com/poetaman/arttime]
=====================================================================


                   << Packages/Tools >>
┏━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━┓
┃               ┃ +) Fish                ┃               ┃
┃ +) 1.1.1.1    ┃ +) Perl                ┃ +) Tldr       ┃
┃ +) GCP        ┃ +) Python              ┃ +) fzf        ┃
┃ +) Nix        ┃ +) Golang              ┃ +) Bat        ┃
┃ +) nmcli      ┃ +) Rust                ┃ +) Ripgrep    ┃
┃ +) nmtui      ┃ +) NodeJS (NPM)        ┃ +) fd         ┃
┃               ┣━━━━━━━━━━━━━━━━━━━━━━━━┫ +) mpv        ┃
┃               ┃ +) Brave Browser       ┃ +) yt-dlp     ┃
┃               ┃ +) ProtonVPN           ┃ +) archiver   ┃
┃               ┃ +) Transmission        ┃ +) aria2      ┃
┃               ┃ +) Syncthing           ┃               ┃
┃               ┃ +) Gopass              ┃               ┃
┃               ┣━━━━━━━━━━━━━━━━━━━━━━━━┫               ┃
┃               ┃ +) ST Terminal         ┃               ┃
┃               ┃ +) Tmux                ┃               ┃
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
┃Tmux   ┃    F1     ┃       FZF Management for All       ┃
┣━━━━━━━╋━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃Neovim ┃...........┃....................................┃
┗━━━━━━━┻━━━━━━━━━━━┻━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

