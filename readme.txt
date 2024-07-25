==============================================================
==============================================================
==============================================================
=======                                .-----.         =======
=======     .----------------------.   | === |         =======
=======     |.-""""""""""""""""""-.|   |-----|         =======
=======     ||                    ||   | === |         =======
=======     ||      DOTFILES      ||   |-----|         =======
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
┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
┃=============================================[[ Custom Keybinding ]]=============================================┃
┣━━━━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃     [ Tools ]     ┃          [ Binding ]          ┃                       [ Description ]                       ┃
┣━━━━━━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃ Tmux              ┃ F1                            ┃ FZF Management for All                                      ┃
┃                   ┃ Prefix - I                    ┃ Install   Plugins                                           ┃
┃                   ┃ Prefix - u                    ┃ Update    Plugins                                           ┃
┃                   ┃ Prefix - Alt - u              ┃ Uninstall Plugins                                           ┃
┣━━━━━━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃ Fish              ┃ Ctrl - l                      ┃ Clear Screen                                                ┃
┃                   ┃ Alt  - e                      ┃ Edit current command in $EDITOR                             ┃
┃                   ┃ Alt  - h                      ┃ Quick open manpage for current command                      ┃
┃                   ┃ Alt  - s                      ┃ Add sudo for command                                        ┃
┣━━━━━━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃ Neovim            ┃...............................┃.............................................................┃
┣━━━━━━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃===================================================[[ Tools ]]===================================================┃
┣━━━━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃    [ Package ]    ┃ [ Utility ] ┃                   [ Description ]                   ┃     [ Alternative ]     ┃
┣━━━━━━━━━━━━━━━━━━━╋━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃   GNU Essential   ┃ ls          ┃ list directory                                      ┃                         ┃
┃     Coreutils     ┣━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃                   ┃ cat         ┃ concatenate files to stdout                         ┃                         ┃
┃                   ┣━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃                   ┃ mkdir       ┃ make directory                                      ┃                         ┃
┃                   ┣━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃                   ┃ rmdir       ┃ remove empty directory                              ┃                         ┃
┃                   ┣━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃                   ┃ rm          ┃ remove files or directories                         ┃                         ┃
┃                   ┣━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃                   ┃ cp          ┃ copy files or directories                           ┃                         ┃
┃                   ┣━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃                   ┃ mv          ┃ move files or directories                           ┃                         ┃
┃                   ┣━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃                   ┃ ln          ┃ make hard or symbolic links                         ┃                         ┃
┃                   ┣━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃                   ┃ chown       ┃ change file owner and group                         ┃                         ┃
┃                   ┣━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃                   ┃ chmod       ┃ change file permissions                             ┃                         ┃
┃                   ┣━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃                   ┃ dd          ┃ convert and copy a file                             ┃                         ┃
┃                   ┣━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃                   ┃ df          ┃ report file system disk space usage                 ┃                         ┃
┃                   ┣━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃                   ┃ du          ┃ estimate disk space used by files and directories   ┃                         ┃
┣━━━━━━━━━━━━━━━━━━━╋━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃   GNU Essential   ┃ find        ┃ search files or directories                         ┃ perl | fd               ┃
┃       More        ┣━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃                   ┃ grep        ┃ print lines matching a pattern                      ┃ perl | ripgrep          ┃
┃                   ┣━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃                   ┃ sed         ┃ stream editor                                       ┃ perl                    ┃
┃                   ┣━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃                   ┃ AWK         ┃ pattern scanning and processing language            ┃ perl                    ┃
┃                   ┣━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃                   ┃ tar         ┃ tar archiver                                        ┃ archiver                ┃
┃                   ┣━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃                   ┃ less        ┃ terminal pager                                      ┃                         ┃
┃                   ┣━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃                   ┃ diff        ┃ compare files line by line                          ┃                         ┃
┃                   ┣━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃                   ┃ dmesg       ┃ print or control the kernel ring buffer             ┃                         ┃
┃                   ┣━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃                   ┃ lsblk       ┃ list block devices                                  ┃                         ┃
┃                   ┣━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃                   ┃ mount       ┃ mount a filesystem                                  ┃                         ┃
┃                   ┣━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃                   ┃ umount      ┃ unmount a filesystem                                ┃                         ┃
┃                   ┣━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃                   ┃ su          ┃ substitute user                                     ┃ sudo                    ┃
┃                   ┣━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃                   ┃ kill        ┃ terminate a process                                 ┃                         ┃
┃                   ┣━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃                   ┃ pgrep       ┃ look up processes by name or attributes             ┃                         ┃
┃                   ┣━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃                   ┃ ps          ┃ show information about processes                    ┃                         ┃
┃                   ┣━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃                   ┃ free        ┃ display amount of free and used memory              ┃                         ┃
┣━━━━━━━━━━━━━━━━━━━╋━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃ GNU Non-Essential ┃ tee         ┃ read stdin and write to stdout and files            ┃                         ┃
┃     Coreutils     ┣━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃                   ┃ mktemp      ┃ make a temporary file or directory                  ┃                         ┃
┃                   ┣━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃                   ┃ mknod       ┃ create named pipe or device node                    ┃                         ┃
┃                   ┣━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃                   ┃ truncate    ┃ shrink or extend the size of a file                 ┃                         ┃
┃                   ┣━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃                   ┃ basenc      ┃ encoding input and output                           ┃                         ┃
┃                   ┣━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃                   ┃ cut         ┃ print selected parts of lines                       ┃                         ┃
┃                   ┣━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃                   ┃ tr          ┃ translate or delete characters                      ┃                         ┃
┃                   ┣━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃                   ┃ od          ┃ dump files in octal and other formats               ┃                         ┃
┃                   ┣━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃                   ┃ sort        ┃ sort lines                                          ┃                         ┃
┃                   ┣━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃                   ┃ uniq        ┃ report or omit repeated lines                       ┃                         ┃
┃                   ┣━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃                   ┃ comm        ┃ compare two sorted files line by line               ┃                         ┃
┃                   ┣━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃                   ┃ head        ┃ output the first part of files                      ┃                         ┃
┃                   ┣━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃                   ┃ join        ┃ join lines of two inputs on a common field          ┃                         ┃
┃                   ┣━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃                   ┃ md5sum      ┃ calculate cryptography hash functions of inputs and ┃                         ┃
┃                   ┃             ┃ output                                              ┃                         ┃
┃                   ┣━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃                   ┃ tail        ┃ output the last part of files, or follow files      ┃                         ┃
┃                   ┣━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃                   ┃ wc          ┃ print newline, word and byte count                  ┃                         ┃
┣━━━━━━━━━━━━━━━━━━━╋━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃ GNU Non-Essential ┃ strings     ┃ print printable characters in binary files          ┃                         ┃
┃       More        ┣━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃                   ┃ column      ┃ columnate file, optionally pretty-printing in table ┃                         ┃
┃                   ┃             ┃ with grid                                           ┃                         ┃
┃                   ┣━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃                   ┃ xargs       ┃ combine or template arguments from stdin to invoke  ┃                         ┃
┃                   ┃             ┃ external command                                    ┃                         ┃
┃                   ┣━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃                   ┃ iconv       ┃ convert character encodings                         ┃                         ┃
┃                   ┣━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃                   ┃ uudecode    ┃ encode file into email friendly text                ┃                         ┃
┃                   ┣━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃                   ┃ file        ┃ guess file type                                     ┃                         ┃
┗━━━━━━━━━━━━━━━━━━━┻━━━━━━━━━━━━━┻━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━━━━━━━━━━━━┛



[ GNU ]
https://www.gnu.org/software/software.html

[ Icons ]
https://en.wikipedia.org/wiki/Box_Drawing
https://www.nerdfonts.com/cheat-sheet
https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/JetBrainsMono/NoLigatures/Regular/JetBrainsMonoNLNerdFont-Regular.ttf

[ arttime ]
https://github.com/poetaman/arttime

[ pandoc ]
https://pandoc.org/

[ fish ]
https://fishshell.com/

[ nb ]
https://xwmx.github.io/nb/

[ Perl Shell ]
https://metacpan.org/pod/Devel::REPL

[ Brave Browser ]
https://brave.com/linux/
https://privacytests.org/

[ Virtualbox ]
https://www.virtualbox.org/wiki/Linux_Downloads

[ ProtonVPN ]
https://protonvpn.com/support/linux-vpn-setup/

[ Git ]
https://www.golinuxcloud.com/git-basics/
https://git-lfs.com/

[ Fzf ]
https://github.com/junegunn/fzf
https://github.com/jdpedersen1/fzfm/blob/main/fzfm.sh

[ NixOS ]
https://www.youtube.com/watch?v=nLwbNhSxLd4

[ Tmux ]
https://github.com/tmux/tmux
https://tmuxcheatsheet.com/
https://blog.guilhermegarnier.com/2017/12/increasing-productivity-in-tmux-with-a-single-prefix-key/

[ Neovim ]
https://github.com/neovim/Neovim
https://github.com/echasnovski/mini.nvim/tree/main
https://vim.rtorr.com/

[ Syncthing ]
http://localhost:8384/
https://github.com/syncthing/Syncthing
https://linuxiac.com/how-to-set-up-and-use-syncthing-to-sync-files/

[ Transmission ]
http://localhost:9091/transmission/web/
https://github.com/transmission/Transmission
https://cli-ck.io/transmission-cli-user-guide/

[ ly display manager ]
https://github.com/fairyglade/ly

[ archiver ]
https://github.com/mholt/archiver/tree/v3.5.1
https://superuser.com/questions/205223/pros-and-cons-of-bzip-vs-gzip

[ Neomutt ]
https://neomutt.org/
https://kapeli.com/cheat_sheets/Mutt.docset/Contents/Resources/Documents/index
https://github.com/neomutt/samples/tree/main
https://github.com/neomutt/neomutt/issues/2568
https://gist.github.com/VladimirPal/9068b922c70a6b5e604c8d2eb099ddb7
https://linuxconfig.org/how-to-install-configure-and-use-mutt-with-a-gmail-account-on-linux

[ Chafa ]
https://github.com/hpjansson/chafa
https://www.baeldung.com/linux/view-media-no-graphical-env

[ Mpv ]
https://github.com/mpv-player/mpv






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
┃               ┃ +) ProtonVPN           ┃   
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


