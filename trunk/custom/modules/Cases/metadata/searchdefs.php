<?php
$searchdefs ['Cases'] = 
array (
  'layout' => 
  array (
    'basic_search' => 
    array (
      'case_number' => 
      array (
        'type' => 'int',
        'default' => true,
        'width' => '10%',
        'label' => 'LBL_NUMBER',
        'name' => 'case_number',
      ),
      'ticketnumber_c' => 
      array (
        'type' => 'varchar',
        'default' => true,
        'label' => 'LBL_TICKETNUMBER',
        'width' => '10%',
        'name' => 'ticketnumber_c',
      ),
      'current_user_only' => 
      array (
        'name' => 'current_user_only',
        'label' => 'LBL_CURRENT_USER_FILTER',
        'type' => 'bool',
        'default' => true,
        'width' => '10%',
      ),
      'workgroup_c' => 
      array (
        'type' => 'enum',
        'default' => true,
        'studio' => 'visible',
        'label' => 'LBL_WORKGROUP',
        'width' => '10%',
        'sortable' => false,
        'name' => 'workgroup_c',
      ),
      'status' => 
      array (
        'type' => 'enum',
        'default' => true,
        'width' => '10%',
        'label' => 'LBL_STATUS',
        'sortable' => false,
        'name' => 'status',
      ),
    ),
    'advanced_search' => 
    array (
      'assigned_user_id' => 
      array (
        'name' => 'assigned_user_id',
        'type' => 'enum',
        'label' => 'LBL_ASSIGNED_TO',
        'function' => 
        array (
          'name' => 'get_user_array',
          'params' => 
          array (
            0 => false,
          ),
        ),
        'default' => true,
        'width' => '10%',
      ),
      'status' => 
      array (
        'name' => 'status',
        'default' => true,
        'width' => '10%',
      ),
      'workgroup_c' => 
      array (
        'type' => 'enum',
        'default' => true,
        'label' => 'LBL_WORKGROUP',
        'width' => '10%',
        'name' => 'workgroup_c',
      ),
      'case_number' => 
      array (
        'name' => 'case_number',
        'default' => true,
        'width' => '10%',
      ),
      'name' => 
      array (
        'name' => 'name',
        'default' => true,
        'width' => '10%',
      ),
      'ticketnumber_c' => 
      array (
        'type' => 'varchar',
        'default' => true,
        'label' => 'LBL_TICKETNUMBER',
        'width' => '10%',
        'name' => 'ticketnumber_c',
      ),
      'account_name' => 
      array (
        'name' => 'account_name',
        'default' => true,
        'width' => '10%',
      ),
    ),
  ),
  'templateMeta' => 
  array (
    'maxColumns' => '3',
    'widths' => 
    array (
      'label' => '10',
      'field' => '30',
    ),
  ),
);
?>
