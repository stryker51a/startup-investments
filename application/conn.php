<?php

$dbhost = '127.0.0.1'; // localhost
$dbuname = 'root';
$dbpass = '';
$dbname = 'startup_info'; //Database name


//$dbo = new PDO('mysql:host=abc.com;port=3306;dbname=$dbname, $dbuname, $dbpass);

$dbo = new PDO('mysql:host=' . $dbhost . ';port=3306;dbname=' . $dbname, $dbuname, $dbpass);
$connection = mysqli_connect($dbhost, $dbuname, $dbpass, $dbname);

?>
