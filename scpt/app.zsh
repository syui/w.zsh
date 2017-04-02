#!/bin/zsh
osascript << EOF

tell application "System Events"
        -- set open_applications to (get every application process) as list
        -- set open_applications to (name of every application process) as list
	set open_applications to (name of every process where background only is false) as list
end tell

EOF

