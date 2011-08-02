<?php 
 //WARNING: The contents of this file are auto-generated


// created: 2010-12-20 02:55:45
$layout_defs["Project"]["subpanel_setup"]["aos_quotes_project"] = array (
  'order' => 100,
  'module' => 'AOS_Quotes',
  'subpanel_name' => 'default',
  'sort_order' => 'asc',
  'sort_by' => 'id',
  'title_key' => 'LBL_AOS_QUOTES_PROJECT_FROM_AOS_QUOTES_TITLE',
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
      'popup_module' => 'AOS_Quotes',
      'mode' => 'MultiSelect',
    ),
  ),
);


// created: 2011-04-01 16:01:57
$layout_defs["Project"]["subpanel_setup"]["aos_products_project"] = array (
  'order' => 100,
  'module' => 'AOS_Products',
  'subpanel_name' => 'default',
  'sort_order' => 'asc',
  'sort_by' => 'id',
  'title_key' => 'LBL_AOS_PRODUCTS_PROJECT_FROM_AOS_PRODUCTS_TITLE',
  'get_subpanel_data' => 'aos_products_project',
  'top_buttons' => 
  array (
    0 => 
    array (
      'widget_class' => 'SubPanelTopButtonQuickCreate',
    ),
    1 => 
    array (
      'widget_class' => 'SubPanelTopSelectButton',
      'mode' => 'MultiSelect',
    ),
  ),
);


//auto-generated file DO NOT EDIT
$layout_defs['Project']['subpanel_setup']['projecttask']['override_subpanel_name'] = 'Projectprojecttask';

?>