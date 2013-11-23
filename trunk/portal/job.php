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

// Store project name
$projname = $_GET['jobid'];

// Login
$result = RestCall('login',array('user_auth' => array('user_name' => 'Admin', 'password' => md5('d@t@c0m!'))));

// Store login id
$session = $result['id'];

// Find the project
$result = RestCall('get_entry_list',array('session' => $session, 'module_name' => 'Project', 'query' => 'name="'.$projname.'"', 'order_by' => '', 'offset' => 0, 'select_fields' => array('id'), 'link_name_to_fields_array' => array(), 'max_results' => 1, 'deleted' => 0));
$jobid = $result['entry_list'][0]['id'];

// Find related cases
//$result = RestCall('get_module_fields',array('session' => $session, 'module_name' => 'Cases'));
//print_r($result);

$result = RestCall('get_relationships',array('session' => $session, 'module_name' => 'Project', 'module_id' => $jobid, 'link_field_name' => 'cases', 'related_module_query' => '', 'related_fields' => array('id','name','case_number','status','date_entered','resolveddate_c'), 'related_module_link_name_to_fields_array' => array(), 'deleted' => 0));
foreach($result['entry_list'] as $entry) {
  $key = "<a href='case.php?id=".$entry['name_value_list']['id']['value']."'>".$entry['name_value_list']['case_number']['value']." - ".$entry['name_value_list']['name']['value']." - ".$entry['name_value_list']['status']['value']."</a><br />";
  $value = $entry['name_value_list']['date_entered']['value'];
  $lines[$key] = $value;
  };

arsort($lines);

foreach($lines as $key => $val) {
  echo $key;
};

// Close Information Div
echo "</div>\n";

// Open Attachment Div
echo '<div id="tabs-2">';

// Find related notes
$result = RestCall('get_relationships',array('session' => $session, 'module_name' => 'Project', 'module_id' => $jobid, 'link_field_name' => 'notes', 'related_module_query' => '', 'related_fields' => array('id','name','filename'), 'related_module_link_name_to_fields_array' => array(), 'deleted' => 0));
foreach($result['entry_list'] as $entry) {
  echo "<a href='download.php?id=".$entry['name_value_list']['id']['value']."'>".$entry['name_value_list']['name']['value']." - ".$entry['name_value_list']['filename']['value']."</a><br />";
  };

// Close attachments and main div
echo '</div></div></body>';

// Logout
$result = RestCall('logout',array('session' => $session));
?>

