<?php
include "portalfuncs.php";

// Write header
echo "<head>\n";
echo '<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />';
echo '<script src="http://code.jquery.com/jquery-1.9.1.js"></script>';
echo '<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>';
echo "<link rel='stylesheet' type='text/css' href='/themes/Sugar5/css/style.css'>\n";
echo '<script>';
echo '$(function() {';
echo '  $( "#tabs" ).tabs();';
echo '});';
echo '</script>';
echo "</head>\n";

// Write Body and tabs

echo '<body><div id="tabs">';
echo '<ul><li><a href="#tabs-1">Information</a></li>';
echo '<li><a href="#tabs-2">Attachments</a></li></ul>';
echo '<div id="tabs-1">';

// Login
$result = RestCall('login',array('user_auth' => array('user_name' => 'Admin', 'password' => md5('GtGDat@C0m#'))));

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

// Close Information Div
echo "</div>\n";

// Open Attachment Div
echo '<div id="tabs-2">';

// Find the project
$result = RestCall('get_entry_list',array('session' => $session, 'module_name' => 'Project', 'query' => 'name="'.$jobnumber.'"', 'order_by' => '', 'offset' => 0, 'select_fields' => array('id'), 'link_name_to_fields_array' => array(), 'max_results' => 1, 'deleted' => 0));
$jobid = $result['entry_list'][0]['id'];

// Find related notes
$result = RestCall('get_relationships',array('session' => $session, 'module_name' => 'Project', 'module_id' => $jobid, 'link_field_name' => 'notes', 'related_module_query' => '', 'related_fields' => array('id','name','filename'), 'related_module_link_name_to_fields_array' => array(), 'deleted' => 0));


// Find related notes
//$result = RestCall('get_relationships',array('session' => $session, 'module_name' => 'Cases', 'module_id' => $_GET['id'], 'link_field_name' => 'notes', 'related_module_query' => '', 'related_fields' => array('id','name','filename'), 'related_module_link_name_to_fields_array' => array(), 'deleted' => 0));

foreach($result['entry_list'] as $entry) {
  echo "<a href='download.php?id=".$entry['name_value_list']['id']['value']."'>".$entry['name_value_list']['name']['value']." - ".$entry['name_value_list']['filename']['value']."</a><br />";
  };

// Close attachments and main div
echo '</div></div></body>';

// Logout
$result = RestCall('logout',array('session' => $session));
?>

