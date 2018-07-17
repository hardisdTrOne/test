#!/usr/bin/env bash

resultcurl=$(curl -s -D- -X GET -H "Authorization: Basic ZGRhdW5pcXVlOkQxNzA1MTk5Nm9yZWVOKg==" -H "Content-Type: application/json" "https://pid.hardis.fr/jira/rest/api/latest/issue/$1")

echo "$resultcurl">./tmp/api.json

branche= grep -Po '"labels":\[(.*")\]' ./tmp/api.json | awk -F ":" '{print $2}' | awk -F "\"" '{print $2}'| awk '{print toupper($0)}'

#ticket_status= grep -Po '"status":(.*)}},(.*)"components":' ./tmp/api.json | awk -F "\"name\":" '{print $2}'| awk -F "\"" '{print $2}'| awk '{print toupper($0)}'

exit "$branche" "$ticket_status" ;