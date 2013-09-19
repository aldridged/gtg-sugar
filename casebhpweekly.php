#!/usr/bin/php
<?php
/* Report BHP weekly cases */
/* Load required classes*/
if(!defined('sugarEntry'))define('sugarEntry', true);
require_once('include/entryPoint.php');
require_once('include/database/DBManagerFactory.php');
require_once('include/SugarPHPMailer.php');
require_once('modules/Emails/Email.php');

/* Query database to get case aging */
$query = 'select case_number,name,status,date_entered,description,resolution from cases where account_id="BHP" and deleted=0 and (timestampdiff(day,date_entered,now())<=7 or status!="Closed") order by date_entered desc;';
$db = DBManagerFactory::getInstance();
$result = $db->query($query,true,'BHP Weekly Report');

/* Create email bodies to send */
$emailbody = "BHP Weekly Report<br /><br />The weekly report is attached.";
$reportbody ="Number, Name, Status, Date Entered, Description, Resolution\n";
while(($row = $db->fetchByAssoc($result))!= null){
    $reportbody .= $row['case_number'].", ".$row['name'].", ".$row['status'].", ".$row['date_entered'].", ".str_replace(array("\r","\n",","),'',$row['description']).", ".str_replace(array("\r","\n",","),'',$row['resolution'])."\n";
};

/* Send out emails */
$emailObj = new Email();
$defaults = $emailObj->getSystemDefaultEmail();
$mail = new SugarPHPMailer();
$mail->setMailerForSystem();
$mail->From = $defaults['email'];
$mail->FromName = $defaults['name'];

$mail->ClearAllRecipients();
$mail->ClearReplyTos();
$mail->Subject = "BHP Weekly Report Draft";
$mail->IsHTML(true);
$mail->Body=$emailbody;
$mail->AltBody=$emailbody;
$mail->AddStringAttachment($reportbody,"weekly-rpt.csv");

$mail->prepForOutbound();

$mail->AddAddress('engineering@globalgroup.us');

$mail->Send();

/* Clean up shop */
$mail->SMTPClose();
?>
