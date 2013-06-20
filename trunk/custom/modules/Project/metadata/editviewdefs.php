<?php
$viewdefs ['Project'] = 
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
      'form' => 
      array (
        'hidden' => '<input type="hidden" name="is_template" value="{$is_template}" />',
        'buttons' => 
        array (
          0 => 'SAVE',
          1 => 
          array (
            'customCode' => '{if !empty($smarty.request.return_action) && $smarty.request.return_action == "ProjectTemplatesDetailView" && (!empty($fields.id.value) || !empty($smarty.request.return_id)) }<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="this.form.action.value=\'ProjectTemplatesDetailView\'; this.form.module.value=\'{$smarty.request.return_module}\'; this.form.record.value=\'{$smarty.request.return_id}\';" type="submit" name="button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}"> {elseif !empty($smarty.request.return_action) && $smarty.request.return_action == "DetailView" && (!empty($fields.id.value) || !empty($smarty.request.return_id)) }<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="this.form.action.value=\'DetailView\'; this.form.module.value=\'{$smarty.request.return_module}\'; this.form.record.value=\'{$smarty.request.return_id}\';" type="submit" name="button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}"> {elseif $is_template}<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="this.form.action.value=\'ProjectTemplatesListView\'; this.form.module.value=\'{$smarty.request.return_module}\'; this.form.record.value=\'{$smarty.request.return_id}\';" type="submit" name="button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}"> {else}<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="this.form.action.value=\'index\'; this.form.module.value=\'{$smarty.request.return_module}\'; this.form.record.value=\'{$smarty.request.return_id}\';" type="submit" name="button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}"> {/if}',
          ),
        ),
      ),
      'useTabs' => false,
    ),
    'panels' => 
    array (
      'lbl_project_information' => 
      array (
        0 => 
        array (
          0 => 
          array (
            'name' => 'name',
            'comment' => 'Project name',
            'label' => 'LBL_NAME',
          ),
          1 => 
          array (
            'name' => 'status',
            'label' => 'LBL_STATUS',
          ),
        ),
        1 => 
        array (
          0 => 
          array (
            'name' => 'customer_c',
            'label' => 'LBL_CUSTOMER',
          ),
          1 => 
          array (
            'name' => 'estimated_start_date',
            'label' => 'LBL_DATE_START',
          ),
        ),
        2 => 
        array (
          0 => 
          array (
            'name' => 'facility_c',
            'label' => 'LBL_FACILITY',
          ),
          1 => 
          array (
            'name' => 'estimated_end_date',
            'label' => 'LBL_DATE_END',
          ),
        ),
        3 => 
        array (
          0 => 
          array (
            'name' => 'wellname_c',
            'label' => 'LBL_WELLNAME',
          ),
          1 => 
          array (
            'name' => 'po_c',
            'label' => 'LBL_PO',
          ),
        ),
        4 => 
        array (
          0 => 
          array (
            'name' => 'areablock_c',
            'label' => 'LBL_AREABLOCK',
          ),
          1 => 
          array (
            'name' => 'ocsg_c',
            'label' => 'LBL_OCSG',
          ),
        ),
        5 => 
        array (
          0 => 
          array (
            'name' => 'leasename_c',
            'label' => 'LBL_LEASENAME',
          ),
          1 => 
          array (
            'name' => 'afe_c',
            'label' => 'LBL_AFE',
          ),
        ),
        6 => 
        array (
          0 => 
          array (
            'name' => 'parish_c',
            'label' => 'LBL_PARISH',
          ),
          1 => 
          array (
            'name' => 'assigned_user_name',
            'label' => 'LBL_ASSIGNED_USER_NAME',
          ),
        ),
        7 => 
        array (
          0 => 
          array (
            'name' => 'prebill_c',
            'label' => 'LBL_PREBILL',
          ),
          1 => 
          array (
            'name' => 'kmi_c',
            'studio' => 'visible',
            'label' => 'LBL_KMI',
          ),
        ),
        8 => 
        array (
          0 => 
          array (
            'name' => 'description',
            'comment' => 'Project description',
            'label' => 'LBL_DESCRIPTION',
          ),
        ),
      ),
      'LBL_PANEL_ASSIGNMENT' => 
      array (
        0 => 
        array (
          0 => 
          array (
            'name' => 'latax_c',
            'label' => 'LBL_LATAX',
          ),
          1 => '',
        ),
        1 => 
        array (
          0 => '',
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
