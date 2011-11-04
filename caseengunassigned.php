#!/usr/bin/php
<?php
/* Report unassigned cases to NOC every 5 minutes */
/* Load required classes*/
if(!defined('sugarEntry'))define('sugarEntry', true);
require_once('include/entryPoint.php');
require_once('include/database/DBManagerFactory.php');
require_once('include/SugarPHPMailer.php');
require_once('modules/Emails/Email.php');

/* Query database to get case aging */
$query = 'select c.case_number,c.name,concat("http://dcmaster.mydatacom.com/index.php?module=Cases&action=DetailView&record=",c.id) as link from cases as c where c.assigned_user_id="5d3a84bd-15b4-68d6-50d6-4eb459f5f9c3" and c.status="New" and c.deleted=0;';
$db = DBManagerFactory::getInstance();
$result = $db->query($query,true,'Case Engineering Unassigned Query Failed');

/* Create email bodies to send */
$linecount = 0;
$emailbody = "The following engineering cases are currently unassigned:<br /><br />";
while(($row = $db->fetchByAssoc($result))!= null){
    $emailbody .= "<a href='".$row['link']."'>".$row['case_number']." - ".$row['name']." </a><br />";
    $linecount++;
};

if($linecount>0) {
/* Send out emails */
$emailObj = new Email();
$defaults = $emailObj->getSystemDefaultEmail();
$mail = new SugarPHPMailer();
$mail->setMailerForSystem();
$mail->From = $defaults['email'];
$mail->FromName = $defaults['name'];

$mail->ClearAllRecipients();
$mail->ClearReplyTos();
$mail->Subject = "Unassigned Engineering Case Report";
$mail->IsHTML(true);
$mail->Body=$emailbody;
$mail->AltBody=$emailbody;

$mail->prepForOutbound();

$mail->AddAddress('engineering@globalgroup.us');

$mail->Send();

/* Clean up shop */
$mail->SMTPClose();
};
?>
