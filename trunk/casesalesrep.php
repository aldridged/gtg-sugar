#!/usr/bin/php
<?php
/* Monitor Case Assignment and mail sales rep as appropriate */
/* Load required classes*/
if(!defined('sugarEntry'))define('sugarEntry', true);
require_once('include/entryPoint.php');
require_once('include/database/DBManagerFactory.php');
require_once('include/SugarPHPMailer.php');
require_once('modules/Emails/Email.php');

/* Query database to get case assignment in the last 5 minutes */
$query = 'select p.name as job,concat("http://dcmaster.mydatacom.com/index.php?module=Cases&action=DetailView&record=",c.id) as link,c.name as case_name, c.case_number, c.status, c.priority, e.email_address from project as p, projects_cases as pc, cases as c, email_addresses as e, email_addr_bean_rel as eb where pc.case_id=c.id and pc.project_id=p.id and timestampdiff(minute,convert_tz(pc.date_modified,"+00:00","-05:00"),now())<=5 and p.assigned_user_id=eb.bean_id and e.id=eb.email_address_id and pc.deleted=0 and c.deleted=0 and p.deleted=0;';
$db = DBManagerFactory::getInstance();
$result = $db->query($query,true,'Case Assignment Query Failed');
$prevemail = "";

/* Create email bodies to send */
while(($row = $db->fetchByAssoc($result))!= null){
  if ($row['email_address']<>$prevemail) {
    $emailbody[$row['email_address']] .= "The following cases have been assigned to jobs that you are listed as the sales rep for:<br /><br />";
    $emailbody[$row['email_address']] .= "<a href='".$row['link']."'>".$row['case_number']." - ".$row['case_name']." - ".$row['job']." </a><br />";
    $prevemail = $row['email_address'];
    }
  else
    {
    $emailbody[$row['email_address']] .= "<a href='".$row['link']."'>".$row['case_number']." - ".$row['case_name']." - ".$row['job']." </a><br />";
    $prevemail = $row['email_address'];
    };
};

/* Send out emails */
$emailObj = new Email();
$defaults = $emailObj->getSystemDefaultEmail();
$mail = new SugarPHPMailer();
$mail->setMailerForSystem();
$mail->From = $defaults['email'];
$mail->FromName = $defaults['name'];

foreach ($emailbody as $key=>$data) {
  $mail->ClearAllRecipients();
  $mail->ClearReplyTos();
  $mail->Subject = "Case Assignment Alert";
  $mail->IsHTML(true);
  $mail->Body=$data;
  $mail->AltBody=$data;

  $mail->prepForOutbound();

  $mail->AddAddress($key);
  $mail->AddAddress('daldridge@globalgroup.us');

  $mail->Send();
};

/* Clean up shop */
$mail->SMTPClose();
?>
