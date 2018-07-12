#!/usr/bin/env bash

var1 = $1

#https://jira.atlassian.com/rest/api/latest/issue/JRA-9
#https://pid.hardis.fr/jira/browse/
curl -D- -X GET -H "Authorization: Basic ZGRhdW5pcXVlOkQxNzA1MTk5Nm9yZWVOKg==" -H "Content-Type: application/json" "https://pid.hardis.fr/jira/rest/api/latest/issue/ONENETWORK-2346"

echo " "
echo $var1 "fin"
git log --pretty=format:"%s" -1

exit
