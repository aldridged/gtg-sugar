#!/usr/bin/php
<?php
/* Report group unassigned cases to group email every 5 minutes */
/* Load required classes*/
if(!defined('sugarEntry'))define('sugarEntry', true);
require_once('include/entryPoint.php');
require_once('include/database/DBManagerFactory.php');
require_once('include/SugarPHPMailer.php');
require_once('modules/Emails/Email.php');

/* Query database to get unassigned group cases*/
$query = 'select u.last_name as groupname,ea.email_address,c.case_number,c.name,concat("http://dcmaster.mydatacom.com/index.php?module=Cases&action=DetailView&record=",c.id) as link from cases as c, email_addresses as ea, email_addr_bean_rel as el, users as u where c.assigned_user_id in (select id from users where is_group=1 and deleted=0) and el.bean_id=c.assigned_user_id and ea.id=el.email_address_id and el.deleted=0 and u.id=c.assigned_user_id and u.deleted=0 and c.status="New" and c.deleted=0 order by ea.email_address asc;';
$db = DBManagerFactory::getInstance();
$result = $db->query($query,true,'Case Group Unassigned Query Failed');

/* Create email bodies to send */
$prevemail = "";
$idx=0;
while(($row = $db->fetchByAssoc($result))!= null){
  if ($row['email_address']<>$prevemail) {
    $idx++;
    $emailbody[$idx]['email'] = $row['email_address'];
    $emailbody[$idx]['subject'] = $row['groupname']." Unassigned Case Report";
    $emailbody[$idx]['body'] .= "The following cases are unassigned for the group ".$row['groupname'].":<br /><br />";
    $emailbody[$idx]['body'] .= "<a href='".$row['link']."'>".$row['case_number']." - ".$row['name']."</a><br />";
    $prevemail = $row['email_address'];
    }
  else
    {
    $emailbody[$idx]['body'] .= "<a href='".$row['link']."'>".$row['case_number']." - ".$row['name']."</a><br />";
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

foreach ($emailbody as $data) {
  $mail->ClearAllRecipients();
  $mail->ClearReplyTos();
  $mail->Subject = $data['subject'];
  $mail->IsHTML(true);
  $mail->Body=$data['body'];
  $mail->AltBody=$data['body'];

  $mail->prepForOutbound();

  $mail->AddAddress($data['email']);

  $mail->Send();
};

/* Clean up shop */
$mail->SMTPClose();
?>
