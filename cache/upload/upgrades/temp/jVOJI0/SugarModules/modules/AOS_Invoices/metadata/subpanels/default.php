<?php
$module_name='AOS_Invoices';
$subpanel_layout = array (
  'top_buttons' => 
  array (
    0 => 
    array (
      'widget_class' => 'SubPanelTopCreateButton',
    ),
    1 => 
    array (
      'widget_class' => 'SubPanelTopSelectButton',
      'popup_module' => 'AOS_Invoices',
    ),
  ),
  'where' => '',
  'list_fields' => 
  array (
    'number' => 
    array (
      'width' => '10%',
      'vname' => 'LBL_INVOICE_NUMBER',
      'default' => true,
    ),
    'name' => 
    array (
      'vname' => 'LBL_NAME',
      'widget_class' => 'SubPanelDetailViewLink',
      'width' => '45%',
      'default' => true,
    ),
    'shipping_account' => 
    array (
      'width' => '10%',
      'vname' => 'LBL_SHIPPING_ACCOUNT',
      'default' => true,
    ),
    'total_amount' => 
    array (
      'width' => '10%',
      'vname' => 'LBL_TOTAL_AMOUNT',
      'default' => true,
    ),
    'assigned_user_name' => 
    array (
      'name' => 'assigned_user_name',
      'vname' => 'LBL_ASSIGNED_USER',
      'default' => true,
    ),
    'edit_button' => 
    array (
      'widget_class' => 'SubPanelEditButton',
      'module' => 'AOS_Invoices',
      'width' => '4%',
      'default' => true,
    ),
    'remove_button' => 
    array (
      'widget_class' => 'SubPanelRemoveButton',
      'module' => 'AOS_Invoices',
      'width' => '5%',
      'default' => true,
    ),
  ),
);