#!/usr/bin/php
<?php
/* Report closed cases from the last 24 hours */
/* Load required classes*/
if(!defined('sugarEntry'))define('sugarEntry', true);
require_once('include/entryPoint.php');
require_once('include/database/DBManagerFactory.php');
require_once('include/SugarPHPMailer.php');
require_once('modules/Emails/Email.php');

/* Query database to get case aging */
$query = 'select ca.date_created,c.case_number,c.name,concat("http://dcmaster.mydatacom.com/index.php?module=Cases&action=DetailView&record=",c.id) as link from cases_audit as ca, cases as c where ca.field_name="status" and ca.after_value_string="closed" and c.deleted=0 and timestampdiff(hour,date_created,now())<=24 and c.id=ca.parent_id;';
$db = DBManagerFactory::getInstance();
$result = $db->query($query,true,'Case Closed Query Failed');

/* Create email bodies to send */
$emailbody = "The following cases were closed in the last 24 hours:<br /><br />";
while(($row = $db->fetchByAssoc($result))!= null){
    $emailbody .= "<a href='".$row['link']."'>".$row['case_number']." - ".$row['name']." - ".$row['date_created']." </a><br />";
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
$mail->Subject = "Case Closed Report";
$mail->IsHTML(true);
$mail->Body=$emailbody;
$mail->AltBody=$emailbody;

$mail->prepForOutbound();

$mail->AddAddress('cs@globalgroup.us');

$mail->Send();

/* Clean up shop */
$mail->SMTPClose();
?>
