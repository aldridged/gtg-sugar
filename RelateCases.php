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
$full_copy = new Account();
$blcases = $oacase->get_full_list();

//Loop over them
foreach($blcases as $curcase) {
  if($curcase->deleted==1) { continue; };
  phpMemorySuckingPig($curcase);
  //$full_copy->retrieve($curcase->account_id);
  //$full_copy->custom_fields->retrieve();
  //$curcase->custom_fields->retrieve();
  //$curcase->account_manager_c = $full_copy->assigned_user_name;
  //$curcase->save();
  //unset($curcase);
  };

function phpMemorySuckingPig($ccase) {
  if(!isset($curcase->account_id)) { return; }
  $full_copy->retrieve($curcase->account_id);
  $full_copy->custom_fields->retrieve();
  $ccase->custom_fields->retrieve();
  $ccase->account_manager_c = $full_copy->assigned_user_name;
  $ccase->save();
  };

?>
