#!/usr/bin/env bash

resultcurl=$(curl -s -D- -X GET -H "Authorization: Basic ZGRhdW5pcXVlOkQxNzA1MTk5Nm9yZWVOKg==" -H "Content-Type: application/json" "https://pid.hardis.fr/jira/rest/api/latest/issue/$1")

echo "$resultcurl">./tmp/api.json

ticket=$(grep -Po '"errorMessages":\[(.*")\]' ./tmp/api.json | awk -F ":" '{print $2}' | awk -F "\"" '{print $2}'| awk '{print toupper($0)}')

if [ ! -z "$ticket" ] ;
then
echo "ERREUR :  ""$ticket"" " >&2
exit 1;
else
ticket_status=$(grep -Po '"status":(.*)}},(.*)"components":' ./tmp/api.json | awk -F "\"name\":" '{print $2}'| awk -F "\"" '{print $2}'| awk '{print toupper($0)}')
if [ "$ticket_status" != "EN COURS" ] ;then
echo "Le status n'est pas en cours.( ""$ticket_status"" )" >&2
exit 1;
fi
fi

branche= grep -Po '"labels":\[(.*")\]' ./tmp/api.json | awk -F ":" '{print $2}' | awk -F "\"" '{print $2}'| awk '{print toupper($0)}'



