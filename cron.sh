#!/usr/bin/env bash

resultcurl=$(curl -s -D- -X GET -H "Authorization: Basic ZGRhdW5pcXVlOkQxNzA1MTk5Nm9yZWVOKg==" -H "Content-Type: application/json" "https://pid.hardis.fr/jira/rest/api/latest/issue/$1")

echo "$resultcurl">./tmp/api.json

branche= grep -Po '"labels":\[(.*")\]' ./tmp/api.json | awk -F ":" '{print $2}' | awk -F "\"" '{print $2}'| awk '{print toupper($0)}'

if [ -z "$branche" ] ;then
echo "La branche du ticket n'est pas renseignée.( ""$branche"" )" >&2
exit 1;
fi


ticket_status=$(grep -Po '"status":(.*)}},(.*)"components":' ./tmp/api.json | awk -F "\"name\":" '{print $2}'| awk -F "\"" '{print $2}'| awk '{print toupper($0)}')

if [ "$ticket_status" != "EN COURS" ] ;then
echo "Le status n'est pas en cours.( ""$ticket_status"" )" >&2
exit 1;
fi
