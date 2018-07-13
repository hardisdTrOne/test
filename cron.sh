#!/usr/bin/env bash


#https://jira.atlassian.com/rest/api/latest/issue/JRA-9
#https://pid.hardis.fr/jira/browse/
#https://pid.hardis.fr/jira/rest/api/latest/issue/ONENETWORK-2346

echo "https://pid.hardis.fr/jira/rest/api/latest/issue/$1" "$1"

curl -D- -X GET -H "Authorization: Basic ZGRhdW5pcXVlOkQxNzA1MTk5Nm9yZWVOKg==" -H "Content-Type: application/json" "https://pid.hardis.fr/jira/rest/api/latest/issue/""$1"

echo " "
echo "$var1" "fin"

exit
