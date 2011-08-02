<?php
/* Test email script */
if(!defined('sugarEntry'))define('sugarEntry', true);
require_once('include/entryPoint.php');
require_once('include/SugarPHPMailer.php');
require_once('modules/Emails/Email.php');

$emailObj = new Email();
$defaults = $emailObj->getSystemDefaultEmail();
$mail = new SugarPHPMailer();
$mail->setMailerForSystem();
$mail->From = $defaults['email'];
$mail->FromName = $defaults['name'];

$mail->ClearAllRecipients();
$mail->ClearReplyTos();

$mail->Subject = "Test Email Script";
$mail->IsHTML(true);
$mail->Body="<i>Body Text</i>";
$mail->AltBody="Body Text";

$mail->prepForOutbound();

$mail->AddAddress("daldridge@globalgroup.us");

$mail->Send();
$mail->SMTPClose();
?>
