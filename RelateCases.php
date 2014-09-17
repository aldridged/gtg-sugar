<?php
//Relate Cases to Account Managers
if(!defined('sugarEntry'))define('sugarEntry', true);
require_once('include/entryPoint.php');
require_once('include/database/DBManagerFactory.php');
require_once('include/SugarPHPMailer.php');
require_once('modules/Emails/Email.php');
require_once('modules/Cases/Case.php');
require_once('modules/Accounts/Account.php');

//Retrieve Cases
$oacase = new aCase();
$blcases = $oacase->get_full_list();

//Loop over them
foreach($blcases as $curcase) {
  if($curcase->deleted==1) { continue; };
  $full_copy = new Account();
  $full_copy->retrieve($curcase->account_id);
  $full_copy->custom_fields->retrieve();
  $curcase->custom_fields->retrieve();
  $curcase->acct_mgr_id_c = $full_copy->assigned_user_id;
  $curcase->save();
  unset($full_copy);
  };
  
?>
