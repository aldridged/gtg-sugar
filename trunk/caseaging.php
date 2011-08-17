#!/usr/bin/php
<?php
/* Monitor Case Aging and mail as appropriate */
/* Load required classes*/
if(!defined('sugarEntry'))define('sugarEntry', true);
require_once('include/entryPoint.php');
require_once('include/database/DBManagerFactory.php');
require_once('include/SugarPHPMailer.php');
require_once('modules/Emails/Email.php');

/* Query database to get case aging */
$query = 'select timestampdiff(hour,cases.date_modified,now()) as aging, concat("http://dcmaster.mydatacom.com/index.php?module=Cases&action=DetailView&record=",cases.id) as link, cases.name, cases.case_number, cases.status, cases.priority, email_addresses.email_address,cases_cstm.workgroup_c from cases,cases_cstm,email_addresses,email_addr_bean_rel where cases_cstm.id_c=cases.id and cases.status <> "Resolved" and cases.status <> "Closed" and cases.deleted=0 and timestampdiff(hour,cases.date_modified,now())>=3 and cases_cstm.workgroup_c <> "Professional Services" and cases_cstm.workgroup_c <> "Staffing" and cases.modified_user_id=email_addr_bean_rel.bean_id and email_addresses.id=email_addr_bean_rel.email_address_id order by email_addresses.email_address asc, aging desc;';
$db = DBManagerFactory::getInstance();
$result = $db->query($query,true,'Case Aging Query Failed');
$prevemail = "";

/* Create email bodies to send */
while(($row = $db->fetchByAssoc($result))!= null){
  if ($row['email_address']<>$prevemail) {
    $emailbody[$row['email_address']] .= "You have the following outstanding cases which have aged more than 3 hours:<br /><br />";
    $emailbody[$row['email_address']] .= "<a href='".$row['link']."'>".$row['case_number']." - ".$row['name']." - ".$row['aging']." Hours</a><br />";
    $prevemail = $row['email_address'];
    }
  else
    {
    $emailbody[$row['email_address']] .= "<a href='".$row['link']."'>".$row['case_number']." - ".$row['name']." - ".$row['aging']." Hours</a><br />";
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
  $mail->Subject = "Case Aging Alert";
  $mail->IsHTML(true);
  $mail->Body=$data;
  $mail->AltBody=$data;

  $mail->prepForOutbound();

  $mail->AddAddress($key);

  $mail->Send();
};

/* Clean up shop */
$mail->SMTPClose();
?>
