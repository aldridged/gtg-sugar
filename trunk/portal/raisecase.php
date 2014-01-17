<?php
/* Raise case into portal */
/* looking for jobNumber, subject and description as GET variables */
/* Load required classes*/
require_once('portalfuncs.php');

/* Connect to CRM Portal */
$result = RestCall('login',array('user_auth' => array('user_name' => 'Admin', 'password' => md5('d@t@c0m!'))));
$session = $result['id'];

/* Find CRM Project (with related account id)*/
$result = RestCall('get_entry_list',array('session' => $session, 'module_name' => 'Project', 'query' => 'name="'.$_GET['jobNumber'].'"', 'order_by' => '', 'offset' => 0, 'select_fields' => array('id'), 'link_name_to_fields_array' => array(array('name' => 'accounts', value => array('id'))), 'max_results' => 1, 'deleted' => 0));
$jobid = $result['entry_list'][0]['id'];
$acctid = $result['relationship_list'][0]['records'][0][0]['value'];

/* Create new case */
$result = RestCall('set_entry',array('session' => $session, 'module_name' => 'Cases', array('name' => $_GET['subject'], 'description' => $_GET['description'], 'jobnumber_c' => $_GET['jobNumber'])));
$caseid = $result['id'];

/* Link Job to Case */
$result = RestCall('set_relationship',array('session' => $session, 'module_name' => 'Projects', 'module_id' => $jobid, 'link_field_name' => 'cases', 'related_ids' => array($caseid)));

/* Link Account to Case */
$result = RestCall('set_relationship',array('session' => $session, 'module_name' => 'Accounts', 'module_id' => $acctid, 'link_field_name' => 'cases', 'related_ids' => array($caseid)));

/* Close up shop */
$result = RestCall('logout',array('session' => $session));
?>