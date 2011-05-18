<?php 
 //WARNING: The contents of this file are auto-generated


// created: 2010-12-20 02:55:45
$layout_defs["AOS_Invoices"]["subpanel_setup"]["aos_quotes_aos_invoices"] = array (
  'order' => 100,
  'module' => 'AOS_Quotes',
  'subpanel_name' => 'default',
  'sort_order' => 'asc',
  'sort_by' => 'id',
  'title_key' => 'LBL_AOS_QUOTES_AOS_INVOICES_FROM_AOS_QUOTES_TITLE',
  'get_subpanel_data' => 'aos_quotes_aos_invoices',
  'top_buttons' => 
  array (
    0 => 
    array (
      'widget_class' => 'SubPanelTopCreateButton',
    ),
    1 => 
    array (
      'widget_class' => 'SubPanelTopSelectButton',
      'popup_module' => 'AOS_Quotes',
      'mode' => 'MultiSelect',
    ),
  ),
);

?>