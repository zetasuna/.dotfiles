#!/usr/bin/fish

function fileManager
  while true
    set selection (ls | fzf \
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
    #ls -a --color=always "$cd_pre";
    set cur_file (file $(echo $sel) | grep [Tt]ext | wc -l);
    if test (file $(echo $sel) | grep [Tt]ext | wc -l) -ge 1
      echo " " $cd_pre;
      bat --style=numbers --theme=Dracula --color=always $sel 2>/dev/null
    else if test (file $(echo $sel) | grep [Dd]irectory | wc -l) -ge 1
      echo " " $cd_pre;
      ll "$cd_pre";
    else if test (file $(echo $sel) | grep [Cc]ompress | wc -l) -ge 1
      echo " " $cd_pre;
    else if test (file $(echo $sel) | grep [Ii]mage | wc -l) -ge 1
      echo " " $cd_pre;
    else if test (file $(echo $sel) | grep [Mm]edia | wc -l) -ge 1
      echo " " $cd_pre;
    else if test (file $(echo $sel) | grep [Pp][Dd][Ff] | wc -l) -ge 1
      echo " " $cd_pre;
    else
      echo " " $cd_pre;
    end
    ')
    if test -d "$selection"
      cd "$selection"
    else if test -f "$selection"
      set file_type (file -b --mime-type "$selection" | cut -d'/' -f1)
      switch $file_type
        case "text"
          nvim -u $HOME/.config/nvim/init.vim "$selection"
        case "image"
          for fType in $selection
            if string match '*.xcf' $fType
              gimp $selection 2>/dev/null
            else
              librewolf $selection
            end
          end
        case "video"
          librewolf $selection 2>/dev/null &
        case "application"
          for fType in $selection
            if string match '*.docx' $fType
              libreoffice $selection 2>/dev/null &
            else if string match '*.odt' $fType
              libreoffice $selection 2>/dev/null &
            else if string match '*.pptx' $fType
              libreoffice $selection 2>/dev/null &
            else if string match '*.pdf' $fType
              librewolf $selection 2>/dev/null &
            end
          end
        case "inode"
          nvim -u $HOME/.config/nvim/init.vim "$selection"
      end
    else
      break
    end
  end
end
