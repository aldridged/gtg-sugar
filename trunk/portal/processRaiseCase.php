<?php
/* Raise case into portal */
/* looking for job, subject and description as GET variables */
/* Load required classes*/
require_once('portalfuncs.php');

/* Write header */
echo "<html>\n";
echo "<head>\n";
echo '<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />';
echo '<script src="http://code.jquery.com/jquery-1.9.1.js"></script>';
echo '<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>';
echo "<link rel='stylesheet' type='text/css' href='/themes/Sugar5/css/style.css'>\n";
echo "</head>\n";
echo "<body><p><b>Submitting Case...</b></p>\n";

/* Connect to CRM Portal */
$result = RestCall('login',array('user_auth' => array('user_name' => 'Admin', 'password' => md5('d@t@c0m!'))));
$session = $result['id'];

/* Find CRM Project (with related account id)*/
$result = RestCall('get_entry_list',array('session' => $session, 'module_name' => 'Project', 'query' => 'name="'.$_GET['job'].'"', 'order_by' => '', 'offset' => 0, 'select_fields' => array('id'), 'link_name_to_fields_array' => array(array('name' => 'accounts', value => array('id'))), 'max_results' => 1, 'deleted' => 0));
$jobid = $result['entry_list'][0]['id'];
$acctid = $result['relationship_list'][0][0]['records'][0]['id']['value'];

/* Create new case */
$result = RestCall('set_entry',array('session' => $session, 'module_name' => 'Cases', array('name' => $_GET['subject'], 'description' => $_GET['description'], 'jobnumber_c' => $_GET['job'], 'status'=>'New', 'priority'=>'P1')));
$caseid = $result['id'];

/* Link Job to Case */
$result = RestCall('set_relationship',array('session' => $session, 'module_name' => 'Project', 'module_id' => $jobid, 'link_field_name' => 'cases', 'related_ids' => array($caseid)));

/* Link Account to Case */
$result = RestCall('set_relationship',array('session' => $session, 'module_name' => 'Accounts', 'module_id' => $acctid, 'link_field_name' => 'cases', 'related_ids' => array($caseid)));

/* Close page */
echo "<br /><br /><p>Case submitted successfully</p>\n";
echo "</body>\n";
echo "</html>";

/* Close up shop */
$result = RestCall('logout',array('session' => $session));
?>
