<?php
include "portalfuncs.php";

// Login
$result = RestCall('login',array('user_auth' => array('user_name' => 'Admin', 'password' => md5('D@t@c0m#'))));

// Store login id
$session = $result['id'];

// Get note contents
$result = RestCall('get_note_attachment',array('session' => $session, 'id' => $_GET['id']));
$contents = base64_decode($result['note_attachment']['file']);
$filename = $result['note_attachment']['filename'];

// Logout
$result = RestCall('logout',array('session' => $session));

// Dumpit to Crumpit
DownloadAttachment($filename,$contents);
?>
