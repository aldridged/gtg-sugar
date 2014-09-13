#!/usr/bin/php
<?php
/* Report Tetra monthly cases */
/* Load required classes*/
if(!defined('sugarEntry'))define('sugarEntry', true);
require_once('include/entryPoint.php');
require_once('include/database/DBManagerFactory.php');
require_once('include/SugarPHPMailer.php');
require_once('modules/Emails/Email.php');

/* Query database to get case aging */
$query = 'select case_number,name,status,CONVERT_TZ(date_entered,\'+00:00\',\'-06:00\') as date_entered,description,resolveddate_c,resolution from cases,cases_cstm where cases.id=cases_cstm.id_c and account_id="38078d8a-758f-e947-bb6e-536a7beffba8" and deleted=0 and (timestampdiff(day,date_entered,now())<=31 or status!="Closed") order by date_entered desc;';
$db = DBManagerFactory::getInstance();
$result = $db->query($query,true,'Tetra Monthly Report');

/* Create email bodies to send */
$emailbody = "Tetra Monthly Report<br /><br />Please find the weekly report attached.";
$reportbody ="Number, Name, Status, Date Entered, Description, Date Resolved, Resolution\n";
while(($row = $db->fetchByAssoc($result))!= null){
    $reportbody .= $row['case_number'].", ".str_replace(array("\r","\n",","),'',$row['name']).", ".$row['status'].", ".$row['date_entered'].", ".str_replace(array("\r","\n",","),'',$row['description']).", ".$row['resolveddate_c'].", ".str_replace(array("\r","\n",","),'',$row['resolution'])."\n";
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
$mail->Subject = "Tetra Monthly Report Draft";
$mail->IsHTML(true);
$mail->Body=$emailbody;
$mail->AltBody=$emailbody;
$mail->AddStringAttachment($reportbody,"tetra-monthly-rpt.csv");

$mail->prepForOutbound();

$mail->AddAddress('daldridge@globalgroup.us');

$mail->Send();

/* Clean up shop */
$mail->SMTPClose();
?>
