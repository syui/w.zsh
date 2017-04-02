#!/bin/zsh

if ! cat $conj|jq . > /dev/null 2>&1;then
	echo $conj
	exit
fi

. $scpt/json.so

osas="tell application \"System Events\" to get properties of first window of application process \"$termapp\""
temp=`osascript -e $osas | tr ":" "\n" | grep -A 1 -e position -e size| grep -e class -e value |cut -d , -f 1-2 | tail -n 2`
posi=`echo $temp|awk "NR==1"`
size=`echo $temp|awk "NR==2"`
echo label input :
read key 
temp_save="{\"position\":\"$posi\",\"size\":\"$size\",\"label\":\"$key\"}"
json_tmp=`cat $conj|jq . | sed -e '$s/]$/,/g'`
json_tmp="${json_tmp}${temp_save}]"
echo $json_tmp | jq . >! $conj
cat $conj | jq .
