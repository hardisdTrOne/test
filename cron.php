<?php
/**
 * Created by PhpStorm.
 * User: doreen
 * Date: 13/07/18
 * Time: 15:58
 */

exec('curl -s -D- -X GET -H "Authorization: Basic ZGRhdW5pcXVlOkQxNzA1MTk5Nm9yZWVOKg==" -H "Content-Type: application/json" "https://pid.hardis.fr/jira/rest/api/latest/issue/$1"', $output);

print_r($output);
echo('fin');