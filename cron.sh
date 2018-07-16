#!/usr/bin/env bash

resultcurl=$(curl -s -D- -X GET -H "Authorization: Basic ZGRhdW5pcXVlOkQxNzA1MTk5Nm9yZWVOKg==" -H "Content-Type: application/json" "https://pid.hardis.fr/jira/rest/api/latest/issue/$1")

echo "$resultcurl" > /tmp/api.json

branche= grep -Po '"labels":\[(.*")\]' api.json | awk -F ":" '{print $2}' | awk -F "\"" '{print $2}'

echo ps

echo $branche
