<?php

$root = $_SERVER['DOCUMENT_ROOT'];
$file = file_get_contents($root . '/pricecut/mailers/forgotPassword.html', 'r');

$file = str_replace('#otp', $data['otp'], $file);
$file = str_replace('#vendorname', $data['vendorname'], $file);

echo $file;
?>
