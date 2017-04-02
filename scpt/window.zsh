#!/bin/zsh

. $scpt/json.so
# appname=`echo "$appname"| peco`
appname=`$scpt/app.zsh| tr , '\n'|sed -e 's/^ //g'|grep -v Finder |peco`
if [ -z "$appname" ];then
	echo no app 
	exit
fi
label=`echo "$label" |peco`
if [ -z "$label" ];then
	echo no label $conj
	exit
fi

posi=`cat $conj|jq -r ".[]|select(.label == \"$label\").position"`
size=`cat $conj|jq -r ".[]|select(.label == \"$label\").size"`
num=`osascript -e "tell application \"$appname\" to set num to number of windows"`
# osascript -e "tell application \"System Events\" to windows"
if [ $num -eq 1 ];then
	num=1
else
	num=`for (( i=1;i<=$num;i++ ))
	do
		title=$(osascript -e "tell application \"$appname\" to set window_name to name of window index $i")
		echo $i $title
	done
	`
	num=`echo "$num" | peco | cut -b 1`
fi

osascript << EOF > /dev/null 2>&1
	tell application "System Events"
		set position of window index $num of application process "$appname" to {$posi}
		set size of window index $num of application process "$appname" to {$size}
	end tell
EOF
