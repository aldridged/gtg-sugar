<?php
// created: 2010-12-20 02:55:45
$layout_defs["AOS_Quotes"]["subpanel_setup"]["aos_quotes_project"] = array (
  'order' => 100,
  'module' => 'Project',
  'subpanel_name' => 'default',
  'sort_order' => 'asc',
  'sort_by' => 'id',
  'title_key' => 'LBL_AOS_QUOTES_PROJECT_FROM_PROJECT_TITLE',
  'get_subpanel_data' => 'aos_quotes_project',
  'top_buttons' => 
  array (
    0 => 
    array (
      'widget_class' => 'SubPanelTopCreateButton',
    ),
    1 => 
    array (
      'widget_class' => 'SubPanelTopSelectButton',
      'popup_module' => 'Accounts',
      'mode' => 'MultiSelect',
    ),
  ),
);
?>
<?php
// created: 2010-12-20 02:55:45
$layout_defs["AOS_Quotes"]["subpanel_setup"]["aos_quotes_aos_invoices"] = array (
  'order' => 100,
  'module' => 'AOS_Invoices',
  'subpanel_name' => 'default',
  'sort_order' => 'asc',
  'sort_by' => 'id',
  'title_key' => 'LBL_AOS_QUOTES_AOS_INVOICES_FROM_AOS_INVOICES_TITLE',
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
      'popup_module' => 'AOS_Invoices',
      'mode' => 'MultiSelect',
    ),
  ),
);
?>