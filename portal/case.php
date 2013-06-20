<?php
include "portalfuncs.php";

// Login
$result = RestCall('login',array('user_auth' => array('user_name' => 'Admin', 'password' => md5('D@t@c0m#'))));

// Store login id
$session = $result['id'];

// Find the case
$result = RestCall('get_entry',array('session' => $session, 'module_name' => 'Cases', 'id' => $_GET['id']));

$casenumber = $result['entry_list'][0]['name_value_list']['case_number']['value'];
$jobnumber = $result['entry_list'][0]['name_value_list']['jobnumber_c']['value'];
$ticketnumber = $result['entry_list'][0]['name_value_list']['ticketnumber_c']['value'];
$priority = $result['entry_list'][0]['name_value_list']['priority']['value'];
$status = $result['entry_list'][0]['name_value_list']['status']['value'];
$duedate = $result['entry_list'][0]['name_value_list']['duedate_c']['value'];
$resolveddate = $result['entry_list'][0]['name_value_list']['resolveddate_c']['value'];
$subject = $result['entry_list'][0]['name_value_list']['name']['value'];
$description = $result['entry_list'][0]['name_value_list']['description']['value'];
$worklog = $result['entry_list'][0]['name_value_list']['work_log']['value'];
$resolution = $result['entry_list'][0]['name_value_list']['resolution']['value'];

// Output Information
echo "Case Number: ".$casenumber."<br />";
echo "Job Number: ".$jobnumber."<br />";
echo "Ticket Number: ".$ticketnumber."<br />";
echo "Priority: ".$priority."<br />";
echo "Status: ".$status."<br />";
echo "Due Date: ".$duedate."<br />";
echo "Resolved Date: ".$resolveddate."<br /><hr>";
echo "Subject: ".$subject."<br />";
echo "Description: ".$description."<br /><hr>";
echo "Work Log: ".$worklog."<br /><hr>";
echo "Resolution: ".$resolution."<br /><hr>";

// Find related notes
$result = RestCall('get_relationships',array('session' => $session, 'module_name' => 'Cases', 'module_id' => $_GET['id'], 'link_field_name' => 'notes', 'related_module_query' => '', 'related_fields' => array('id','name','filename'), 'related_module_link_name_to_fields_array' => array(), 'deleted' => 0));
echo "Attachments - \n<br />";
foreach($result['entry_list'] as $entry) {
  echo "<a href='download.php?id=".$entry['name_value_list']['id']['value']."'>".$entry['name_value_list']['name']['value']." - ".$entry['name_value_list']['filename']['value']."</a><br />";
  };

// Logout
$result = RestCall('logout',array('session' => $session));
?>

