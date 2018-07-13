<?php
/**
 * Created by PhpStorm.
 * User: doreen
 * Date: 13/07/18
 * Time: 15:58
 */



$submit_url = "https://pid.hardis.fr/jira/rest/api/latest/issue/".$argv[1];

$curl = curl_init();

curl_setopt($curl, CURLOPT_HTTPAUTH, CURLAUTH_BASIC ) ;
curl_setopt($curl, CURLOPT_USERPWD, "ddaunique:D17051996oreeN*");
curl_setopt($curl, CURLOPT_SSLVERSION,3);
curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, FALSE);
curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, 2);
curl_setopt($curl, CURLOPT_HEADER, true);
curl_setopt($curl, CURLOPT_POST, true);
curl_setopt($curl, CURLOPT_POSTFIELDS, $params );
curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
curl_setopt($curl, CURLOPT_USERAGENT, "Mozilla/4.0 (compatible; MSIE 5.01; Windows NT 5.0)");
curl_setopt($curl, CURLOPT_URL, $submit_url);

$data = split("text/html", curl_exec($curl) );
$temp = split("\r\n", $data[1]) ;

$result = unserialize( $temp[2] ) ;

print_r($result);
curl_close($curl);
die;

var_dump($argv);
$issus= $argv[1];
exec('curl -s -D- -X GET -H "Authorization: Basic ZGRhdW5pcXVlOkQxNzA1MTk5Nlsm9yZWVOKg==" -H "Content-Type: application/json" "https://pid.hardis.fr/jira/rest/api/latest/issue/'.$issus.'" >api.json', $output);

print_r($output);


$url= "https://pid.hardis.fr/jira/rest/api/latest/issue/".$argv[1];

$arrContextOptions=array(
    "ssl"=>array(
        "verify_peer"=>false,
        "verify_peer_name"=>false,
    ),
);

$response = file_get_contents($url, false, stream_context_create($arrContextOptions));
var_dump($response);

die;


echo('fin');