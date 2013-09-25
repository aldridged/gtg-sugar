<?php
include "portalfuncs.php";

// Write header
echo "<head>\n";
echo "<link rel='stylesheet' type='text/css' href='/themes/Sugar5/css/style.css'>\n";
echo "</head>\n";

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
echo "<table border='0' width='100%'>";
echo "<tr><td width='50%'><b>Case Number:</b> ".$casenumber."<br />";
echo "<b>Job Number:</b> ".$jobnumber."<br />";
echo "<b>Ticket Number:</b> ".$ticketnumber."<br /></td>";
/* echo "<b>Priority:</b> ".$priority."<br />"; */
echo "<td width='50%'><b>Status:</b> ".$status."<br />";
echo "<b>Due Date:</b> ".$duedate."<br />";
echo "<b>Resolved Date:</b> ".$resolveddate."<br /></td></tr></table><hr>";
echo "<b>Subject:</b> ".$subject."<hr>";
echo "<b>Description:</b><br /> ".nl2br($description)."<br /><hr>";
echo "<b>Work Log:</b><br /> ".nl2br($worklog)."<br /><hr>";
echo "<b>Resolution:</b><br /> ".nl2br($resolution)."<br /><hr>";

// Find related notes
$result = RestCall('get_relationships',array('session' => $session, 'module_name' => 'Cases', 'module_id' => $_GET['id'], 'link_field_name' => 'notes', 'related_module_query' => '', 'related_fields' => array('id','name','filename'), 'related_module_link_name_to_fields_array' => array(), 'deleted' => 0));
echo "Attachments - \n<br />";
foreach($result['entry_list'] as $entry) {
  echo "<a href='download.php?id=".$entry['name_value_list']['id']['value']."'>".$entry['name_value_list']['name']['value']." - ".$entry['name_value_list']['filename']['value']."</a><br />";
  };

// Logout
$result = RestCall('logout',array('session' => $session));
?>

