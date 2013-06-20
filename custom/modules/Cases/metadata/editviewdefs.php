<?php
$viewdefs ['Cases'] = 
array (
  'EditView' => 
  array (
    'templateMeta' => 
    array (
      'maxColumns' => '2',
      'widths' => 
      array (
        0 => 
        array (
          'label' => '10',
          'field' => '30',
        ),
        1 => 
        array (
          'label' => '10',
          'field' => '30',
        ),
      ),
      'useTabs' => false,
    ),
    'panels' => 
    array (
      'lbl_case_information' => 
      array (
        0 => 
        array (
          0 => 
          array (
            'name' => 'case_number',
            'type' => 'readonly',
          ),
          1 => 
          array (
            'name' => 'priority',
            'comment' => 'The priority of the case',
            'label' => 'LBL_PRIORITY',
          ),
        ),
        1 => 
        array (
          0 => 
          array (
            'name' => 'account_name',
            'comment' => 'The name of the account represented by the account_id field',
            'label' => 'LBL_ACCOUNT_NAME',
          ),
          1 => 
          array (
            'name' => 'status',
            'comment' => 'The status of the case',
            'label' => 'LBL_STATUS',
          ),
        ),
        2 => 
        array (
          0 => 
          array (
            'name' => 'contactname_c',
            'label' => 'LBL_CONTACTNAME',
          ),
          1 => 
          array (
            'name' => 'duedate_c',
            'label' => 'LBL_DUEDATE',
          ),
        ),
        3 => 
        array (
          0 => 
          array (
            'name' => 'contactphone_c',
            'label' => 'LBL_CONTACTPHONE',
          ),
          1 => 
          array (
            'name' => 'resolveddate_c',
            'label' => 'LBL_RESOLVEDDATE',
          ),
        ),
        4 => 
        array (
          0 => 
          array (
            'name' => 'jobnumber_c',
            'label' => 'LBL_JOBNUMBER',
          ),
          1 => '',
        ),
        5 => 
        array (
          0 => 
          array (
            'name' => 'name',
            'displayParams' => 
            array (
              'size' => 75,
            ),
          ),
          1 => '',
        ),
        6 => 
        array (
          0 => '',
          1 => '',
        ),
        7 => 
        array (
          0 => 
          array (
            'name' => 'description',
            'nl2br' => true,
          ),
        ),
        8 => 
        array (
          0 => 
          array (
            'name' => 'work_log',
            'comment' => 'Free-form text used to denote activities of interest',
            'label' => 'LBL_WORK_LOG',
          ),
        ),
        9 => 
        array (
          0 => 
          array (
            'name' => 'ticketnumber_c',
            'label' => 'LBL_TICKETNUMBER',
          ),
          1 => '',
        ),
        10 => 
        array (
          0 => 
          array (
            'name' => 'resolution',
            'nl2br' => true,
          ),
        ),
        11 => 
        array (
          0 => '',
          1 => '',
        ),
      ),
      'LBL_PANEL_ASSIGNMENT' => 
      array (
        0 => 
        array (
          0 => 
          array (
            'name' => 'assigned_user_name',
            'label' => 'LBL_ASSIGNED_TO_NAME',
          ),
          1 => '',
        ),
        1 => 
        array (
          0 => 
          array (
            'name' => 'workgroup_c',
            'label' => 'LBL_WORKGROUP',
          ),
          1 => '',
        ),
        2 => 
        array (
          0 => '',
          1 => '',
        ),
      ),
    ),
  ),
);
?>
