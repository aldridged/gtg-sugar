<?php
$viewdefs ['Cases'] = 
array (
  'DetailView' => 
  array (
    'templateMeta' => 
    array (
      'form' => 
      array (
        'buttons' => 
        array (
          0 => 'EDIT',
          1 => 'DUPLICATE',
          2 => 'DELETE',
          3 => 'FIND_DUPLICATES',
        ),
      ),
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
            'label' => 'LBL_CASE_NUMBER',
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
            'name' => 'status',
            'comment' => 'The status of the case',
            'label' => 'LBL_STATUS',
          ),
          1 => 
          array (
            'name' => 'account_name',
            'comment' => 'The name of the account represented by the account_id field',
            'label' => 'LBL_ACCOUNT_NAME',
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
            'name' => 'contactphone_c',
            'label' => 'LBL_CONTACTPHONE',
          ),
        ),
        3 => 
        array (
          0 => 
          array (
            'name' => 'duedate_c',
            'label' => 'LBL_DUEDATE',
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
          1 => 
          array (
            'name' => 'workgroup_c',
            'studio' => 'visible',
            'label' => 'LBL_WORKGROUP',
          ),
        ),
        5 => 
        array (
          0 => 
          array (
            'name' => 'type',
            'comment' => 'The type of issue (ex: issue, feature)',
            'label' => 'LBL_TYPE',
          ),
        ),
        6 => 
        array (
          0 => 
          array (
            'name' => 'name',
            'label' => 'LBL_SUBJECT',
          ),
        ),
        7 => 
        array (
          0 => 
          array (
            'name' => 'description',
            'comment' => 'Full text of the note',
            'label' => 'LBL_DESCRIPTION',
          ),
        ),
        8 => 
        array (
          0 => 
          array (
            'name' => 'resolution',
            'comment' => 'The resolution of the case',
            'label' => 'LBL_RESOLUTION',
          ),
        ),
      ),
      'LBL_PANEL_ASSIGNMENT' => 
      array (
        0 => 
        array (
          0 => 
          array (
            'name' => 'assigned_user_name',
            'label' => 'LBL_ASSIGNED_TO',
          ),
          1 => 
          array (
            'name' => 'date_modified',
            'label' => 'LBL_DATE_MODIFIED',
            'customCode' => '{$fields.date_modified.value} {$APP.LBL_BY} {$fields.modified_by_name.value}',
          ),
        ),
        1 => 
        array (
          0 => 
          array (
            'name' => 'date_entered',
            'customCode' => '{$fields.date_entered.value} {$APP.LBL_BY} {$fields.created_by_name.value}',
          ),
        ),
        2 => 
        array (
          0 => 
          array (
            'name' => 'work_log',
            'comment' => 'Free-form text used to denote activities of interest',
            'label' => 'LBL_WORK_LOG',
          ),
        ),
      ),
    ),
  ),
);
?>
