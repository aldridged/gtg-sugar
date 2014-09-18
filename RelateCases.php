#!/usr/bin/php
<?php
// Update account manager on cases
// Load required classes
if(!defined('sugarEntry'))define('sugarEntry', true);
require_once('include/entryPoint.php');
require_once('include/database/DBManagerFactory.php');
require_once('include/SugarPHPMailer.php');
require_once('modules/Emails/Email.php');

// Update Tables using SQL
$query = 'update cases c inner join cases_cstm cc on c.id=cc.id_c inner join accounts a on a.id = c.account_id inner join users u on a.assigned_user_id = u.id set cc.account_manager_c = concat(u.first_name," ",u.last_name);';
$db = DBManagerFactory::getInstance();
$result = $db->query($query,true,'Tetra Monthly Report');
?>
