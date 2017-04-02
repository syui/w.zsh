#!/bin/zsh

if [ ! -d $conf ];then
	mkdir -p $conf
fi
if [ ! -f $conj ];then
	touch $conj
fi
if [ ! -d $json ];then
	mkdir -p $json
fi

if ! cat $conj | jq . > /dev/null 2>&1;then
	cp -rf $tmpj $conj
fi

if [ -z "`cat $conj`" ];then
	cp -rf $tmpj $conj
fi
