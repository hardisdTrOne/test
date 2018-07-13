#!/usr/bin/env bash


resultcurl=$(curl -s -D- -X GET -H "Authorization: Basic ZGRhdW5pcXVlOkQxNzA1MTk5Nm9yZWVOKg==" -H "Content-Type: application/json" "https://pid.hardis.fr/jira/rest/api/latest/issue/$1" ">api.json")

result= "$resultcurl" | grep -Po '"labels":\[(.*")\]' api.json | awk -F ":" '{print $2}' | awk -F "\"" '{print $2}'

echo "$result"
var1="ok"

export result
./.git/hooks/commit-msg $result $var1

exit
