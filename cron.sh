#!/usr/bin/env bash

authorization = "ZGRhdW5pcXVlOkQxNzA1MTk5Nm9yZWVOKg=="
ticket = "ONENETWORK-2346"
var1 = $1
log = git log --pretty=format: "%s"

#https://jira.atlassian.com/rest/api/latest/issue/JRA-9
#https://pid.hardis.fr/jira/browse/
curl -D- -X GET -H "Authorization: Basic ZGRhdW5pcXVlOkQxNzA1MTk5Nm9yZWVOKg==" -H "Content-Type: application/json" "https://pid.hardis.fr/rest/api/latest/issue/ONENETWORK-2346"

echo $log "test"
git log --pretty=format:"%s" -1
echo $var1 "fin"

exit
