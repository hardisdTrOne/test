#!/usr/bin/env bash

authorization = "ZGRhdW5pcXVlOkQxNzA1MTk5Nm9yZWVOKg=="
ticket = "ONENETWORK-2141"
var1 = $var1
log = git log --pretty=format: "%s"

curl -D- -X GET -H "Authorization: Basic " "$authorization" -H "Content-Type: application/json" "https://pid.hardis.fr/jira/browse/" "$ticket"

echo $log "test"
git log --pretty=format:"%s" -1
echo $var1

exit
