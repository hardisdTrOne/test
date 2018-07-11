#!/usr/bin/env bash

authorization = 'ddaunique:D17051996oreeN*' | base64
ticket = 'ONENETWORK-2141'
log = git log -1

curl -D- -X GET -H "Authorization: Basic " "$authorization" -H "Content-Type: application/json" "https://pid.hardis.fr/jira/browse/" "$ticket"

echo log
