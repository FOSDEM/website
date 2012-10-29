#!/bin/bash
echo -n "Solr is "
rc=$(curl -s http://127.0.0.1:8983/solr/admin/ping|grep -o -E "name=\"status\">([0-9]+)<"|cut -f2 -d\>|cut -f1 -d\<)
if [ "$rc" = "0" ]; then
	echo -en "\e[32;1mup and running"
elif [ "$rc" = "" ]; then
	echo -en "\e[31;1mnot running"
	rc=1
else
	echo -en "\e[31;1mbroken"
fi
echo -e "\e[0m"
exit "$rc"
