<?php
$domain = 'eth0.me';
$curlInit = curl_init($domain);
curl_setopt($curlInit, CURLOPT_CONNECTTIMEOUT, 30);
curl_setopt($curlInit, CURLOPT_HEADER, false);
curl_setopt($curlInit, CURLOPT_RETURNTRANSFER, true);
$response = curl_exec($curlInit);
curl_close($curlInit);
echo 'Hello!!!It`s Oleksander Symonenko<br>';
echo 'IP address of server: '.$response;
?>
