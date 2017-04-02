#!/bin/zsh

. $scpt/json.so
osascript <<EOF
tell application "$termapp"
  if the transparency of the current session of window 1 > 0 then
    set the transparency of the current session of window 1 to 0
  else
    set the transparency of the current session of window 1 to 1
  end if
end tell
EOF
