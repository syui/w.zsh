#!/bin/zsh

if [ -f ${0:a:h}/add.so ];then
	. ${0:a:h}/add.so
fi

$scpt/mkdir.zsh

case $1 in
	save|s)
		$scpt/save.zsh $*
	;;
	trans|t)
		$scpt/trans.zsh $*
	;;
	window|win|w)
		$scpt/window.zsh $*
	;;
	h|help|--help)
		cat $scpt/main.zsh
	;;
	"")
		$scpt/window.zsh $*
		:
	;;
esac
