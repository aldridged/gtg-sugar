<?php
// created: 2011-05-16 10:42:22
$subpanel_layout['list_fields'] = array (
  'name' => 
  array (
    'vname' => 'LBL_LIST_NAME',
    'widget_class' => 'SubPanelDetailViewLink',
    'width' => '35%',
    'default' => true,
  ),
  'facility_c' => 
  array (
    'type' => 'varchar',
    'default' => true,
    'vname' => 'LBL_FACILITY',
    'width' => '10%',
  ),
  'status' => 
  array (
    'type' => 'enum',
    'default' => true,
    'vname' => 'LBL_STATUS',
    'sortable' => false,
    'width' => '10%',
  ),
  'estimated_start_date' => 
  array (
    'vname' => 'LBL_DATE_START',
    'width' => '25%',
    'sortable' => true,
    'default' => true,
  ),
  'estimated_end_date' => 
  array (
    'vname' => 'LBL_DATE_END',
    'width' => '25%',
    'sortable' => true,
    'default' => true,
  ),
  'edit_button' => 
  array (
    'vname' => 'LBL_EDIT_BUTTON',
    'widget_class' => 'SubPanelEditButton',
    'module' => 'Project',
    'width' => '3%',
    'default' => true,
  ),
  'remove_button' => 
  array (
    'vname' => 'LBL_REMOVE',
    'widget_class' => 'SubPanelRemoveButton',
    'module' => 'Project',
    'width' => '3%',
    'default' => true,
  ),
);
?>
