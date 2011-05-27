<?php
$module_name = 'AOS_Products';
$listViewDefs [$module_name] = 
array (
  'MAINCODE' => 
  array (
    'width' => '10%',
    'label' => 'LBL_MAINCODE',
    'default' => true,
  ),
  'NAME' => 
  array (
    'width' => '32%',
    'label' => 'LBL_NAME',
    'default' => true,
    'link' => true,
  ),
  'GLCODE_C' => 
  array (
    'type' => 'varchar',
    'default' => true,
    'label' => 'LBL_GLCODE',
    'width' => '10%',
  ),
  'COST' => 
  array (
    'width' => '10%',
    'label' => 'LBL_COST',
    'currency_format' => true,
    'default' => true,
  ),
  'PRICE' => 
  array (
    'width' => '10%',
    'label' => 'LBL_PRICE',
    'currency_format' => true,
    'default' => true,
  ),
  'ASSIGNED_USER_NAME' => 
  array (
    'width' => '9%',
    'label' => 'LBL_ASSIGNED_TO_NAME',
    'default' => true,
  ),
);
?>
