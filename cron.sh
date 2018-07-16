#!/usr/bin/env bash


resultcurl=$(curl -s -D- -X GET -H "Authorization: Basic ZGRhdW5pcXVlOkQxNzA1MTk5Nm9yZWVOKg==" -H "Content-Type: application/json" "https://pid.hardis.fr/jira/rest/api/latest/issue/$1")

echo "$resultcurl" > api.json

branche= "$resultcurl" | grep -Po '"labels":\[(.*")\]' api.json | awk -F ":" '{print $2}' | awk -F "\"" '{print $2}'

echo "$branche"
test="ok"

export branche
export test
./.git/hooks/commit-msg $branche $test






