<?php
/**
 * Created by PhpStorm.
 * User: doreen
 * Date: 13/07/18
 * Time: 15:58
 */


$issus= $test;
exec('curl -s -D- -X GET -H "Authorization: Basic ZGRhdW5pcXVlOkQxNzA1MTk5Nm9yZWVOKg==" -H "Content-Type: application/json" "https://pid.hardis.fr/jira/rest/api/latest/issue/'.$issus.'" >api.json', $output);

print_r($output);


$json = file_get_contents('api.json');
$obj = json_decode($json);
var_dump($obj);

echo('fin');