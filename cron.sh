#!/usr/bin/env bash


#https://jira.atlassian.com/rest/api/latest/issue/JRA-9
#https://pid.hardis.fr/jira/browse/
#https://pid.hardis.fr/jira/rest/api/latest/issue/ONENETWORK-2346

echo "https://pid.hardis.fr/jira/rest/api/latest/issue/$1/?fields=labels"

resultcurl=$(curl -s -D- -X GET -H "Authorization: Basic ZGRhdW5pcXVlOkQxNzA1MTk5Nm9yZWVOKg==" -H "Content-Type: application/json" "https://pid.hardis.fr/jira/rest/api/latest/issue/$1")

#curl -s -X GET -H "Authorization: Basic ZGRhdW5pcXVlOkQxNzA1MTk5Nm9yZWVOKg==" -H "Content-Type: application/json" "https://pid.hardis.fr/jira/rest/api/latest/issue/$1"


echo " "
echo "--------------------------------"


#branch=$(grep "labels" )

"$resultcurl">branche.txt
result= sed -n '/"labels":\[(.*")\]/' branche.txt

#result= "$resultcurl" | grep '"labels":\[(.*")\]'

echo "///////////////////////////////////////////////"


echo "$result"


echo " "
echo "--------------------------------"




echo " "
echo "$1" "fin"

exit
