<?php /* Smarty version 2.6.11, created on 2011-05-17 14:06:15
         compiled from cache/modules/Project/form_SubpanelQuickCreate_Project.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'sugar_include', 'cache/modules/Project/form_SubpanelQuickCreate_Project.tpl', 37, false),array('function', 'counter', 'cache/modules/Project/form_SubpanelQuickCreate_Project.tpl', 42, false),array('function', 'sugar_translate', 'cache/modules/Project/form_SubpanelQuickCreate_Project.tpl', 47, false),array('function', 'html_options', 'cache/modules/Project/form_SubpanelQuickCreate_Project.tpl', 78, false),array('function', 'sugar_getimagepath', 'cache/modules/Project/form_SubpanelQuickCreate_Project.tpl', 97, false),array('modifier', 'default', 'cache/modules/Project/form_SubpanelQuickCreate_Project.tpl', 43, false),array('modifier', 'strip_semicolon', 'cache/modules/Project/form_SubpanelQuickCreate_Project.tpl', 49, false),)), $this); ?>


<div class="clear"></div>
<form action="index.php" method="POST" name="<?php echo $this->_tpl_vars['form_name']; ?>
" id="<?php echo $this->_tpl_vars['form_id']; ?>
" <?php echo $this->_tpl_vars['enctype']; ?>
>
<table width="100%" cellpadding="0" cellspacing="0" border="0" class="actionsContainer">
<tr>
<td class="buttons">
<input type="hidden" name="module" value="<?php echo $this->_tpl_vars['module']; ?>
">
<?php if (isset ( $_REQUEST['isDuplicate'] ) && $_REQUEST['isDuplicate'] == 'true'): ?>
<input type="hidden" name="record" value="">
<input type="hidden" name="duplicateSave" value="true">
<input type="hidden" name="duplicateId" value="<?php echo $this->_tpl_vars['fields']['id']['value']; ?>
">
<?php else: ?>
<input type="hidden" name="record" value="<?php echo $this->_tpl_vars['fields']['id']['value']; ?>
">
<?php endif; ?>
<input type="hidden" name="isDuplicate" value="false">
<input type="hidden" name="action">
<input type="hidden" name="return_module" value="<?php echo $_REQUEST['return_module']; ?>
">
<input type="hidden" name="return_action" value="<?php echo $_REQUEST['return_action']; ?>
">
<input type="hidden" name="return_id" value="<?php echo $_REQUEST['return_id']; ?>
">
<input type="hidden" name="module_tab"> 
<input type="hidden" name="contact_role">
<?php if (! empty ( $_REQUEST['return_module'] ) || ! empty ( $_REQUEST['relate_to'] )): ?>
<input type="hidden" name="relate_to" value="<?php if ($_REQUEST['return_relationship']):  echo $_REQUEST['return_relationship'];  elseif ($_REQUEST['relate_to'] && empty ( $_REQUEST['from_dcmenu'] )):  echo $_REQUEST['relate_to'];  elseif (empty ( $this->_tpl_vars['isDCForm'] ) && empty ( $_REQUEST['from_dcmenu'] )):  echo $_REQUEST['return_module'];  endif; ?>">
<input type="hidden" name="relate_id" value="<?php echo $_REQUEST['return_id']; ?>
">
<?php endif; ?>
<input type="hidden" name="offset" value="<?php echo $this->_tpl_vars['offset']; ?>
">
<?php if ($this->_tpl_vars['bean']->aclAccess('save')): ?><input title="<?php echo $this->_tpl_vars['APP']['LBL_SAVE_BUTTON_TITLE']; ?>
" accessKey="<?php echo $this->_tpl_vars['APP']['LBL_SAVE_BUTTON_KEY']; ?>
" class="button" onclick="this.form.action.value='Save';if(check_form('form_SubpanelQuickCreate_Project'))return SUGAR.subpanelUtils.inlineSave(this.form.id, 'Project_subpanel_save_button');return false;" type="submit" name="Project_subpanel_save_button" id="Project_subpanel_save_button" value="<?php echo $this->_tpl_vars['APP']['LBL_SAVE_BUTTON_LABEL']; ?>
"><?php endif; ?> 
<input title="<?php echo $this->_tpl_vars['APP']['LBL_CANCEL_BUTTON_TITLE']; ?>
" accessKey="<?php echo $this->_tpl_vars['APP']['LBL_CANCEL_BUTTON_KEY']; ?>
" class="button" onclick="return SUGAR.subpanelUtils.cancelCreate('Project_subpanel_cancel_button');return false;" type="submit" name="Project_subpanel_cancel_button" id="Project_subpanel_cancel_button" value="<?php echo $this->_tpl_vars['APP']['LBL_CANCEL_BUTTON_LABEL']; ?>
"> 
<input title="<?php echo $this->_tpl_vars['APP']['LBL_FULL_FORM_BUTTON_TITLE']; ?>
" accessKey="<?php echo $this->_tpl_vars['APP']['LBL_FULL_FORM_BUTTON_KEY']; ?>
" class="button" onclick="disableOnUnloadEditView(this.form); this.form.return_action.value='DetailView'; this.form.action.value='EditView'; if(typeof(this.form.to_pdf)!='undefined') this.form.to_pdf.value='0';" type="submit" name="Project_subpanel_full_form_button" id="Project_subpanel_full_form_button" value="<?php echo $this->_tpl_vars['APP']['LBL_FULL_FORM_BUTTON_LABEL']; ?>
"> <input type="hidden" name="full_form" value="full_form">
<?php if ($this->_tpl_vars['bean']->aclAccess('detail')):  if (! empty ( $this->_tpl_vars['fields']['id']['value'] ) && $this->_tpl_vars['isAuditEnabled']): ?><input title="<?php echo $this->_tpl_vars['APP']['LNK_VIEW_CHANGE_LOG']; ?>
" class="button" onclick='open_popup("Audit", "600", "400", "&record=<?php echo $this->_tpl_vars['fields']['id']['value']; ?>
&module_name=Project", true, false,  { "call_back_function":"set_return","form_name":"EditView","field_to_name_array":[] } ); return false;' type="submit" value="<?php echo $this->_tpl_vars['APP']['LNK_VIEW_CHANGE_LOG']; ?>
"><?php endif;  endif; ?>
</td>
<td align='right'>
<?php echo $this->_tpl_vars['PAGINATION']; ?>

</td>
</tr>
</table><?php echo smarty_function_sugar_include(array('include' => $this->_tpl_vars['includes']), $this);?>

<div id="form_SubpanelQuickCreate_Project_tabs" 
>
<div >
<div id="">
<?php echo smarty_function_counter(array('name' => 'panelFieldCount','start' => 0,'print' => false,'assign' => 'panelFieldCount'), $this);?>

<table width="100%" border="0" cellspacing="1" cellpadding="0"  class="<?php echo ((is_array($_tmp=@$this->_tpl_vars['def']['templateMeta']['panelClass'])) ? $this->_run_mod_handler('default', true, $_tmp, 'edit view') : smarty_modifier_default($_tmp, 'edit view')); ?>
">
<tr>
<td valign="top" id='name_label' width='12.5%' scope="row">
<?php ob_start();  echo smarty_function_sugar_translate(array('label' => 'LBL_NAME','module' => 'Project'), $this);?>

<?php $this->_smarty_vars['capture']['label'] = ob_get_contents();  $this->assign('label', ob_get_contents());ob_end_clean();  echo ((is_array($_tmp=$this->_tpl_vars['label'])) ? $this->_run_mod_handler('strip_semicolon', true, $_tmp) : smarty_modifier_strip_semicolon($_tmp)); ?>
:
<span class="required">*</span>
</td>
<td valign="top" width='37.5%' >
<?php echo smarty_function_counter(array('name' => 'panelFieldCount'), $this);?>


<?php if (strlen ( $this->_tpl_vars['fields']['name']['value'] ) <= 0):  $this->assign('value', $this->_tpl_vars['fields']['name']['default_value']);  else:  $this->assign('value', $this->_tpl_vars['fields']['name']['value']);  endif; ?>  
<input type='text' name='<?php echo $this->_tpl_vars['fields']['name']['name']; ?>
' 
id='<?php echo $this->_tpl_vars['fields']['name']['name']; ?>
' size='30' 
maxlength='50' 
value='<?php echo $this->_tpl_vars['value']; ?>
' title='' tabindex='100' > 
<td valign="top" id='status_label' width='12.5%' scope="row">
<?php ob_start();  echo smarty_function_sugar_translate(array('label' => 'LBL_STATUS','module' => 'Project'), $this);?>

<?php $this->_smarty_vars['capture']['label'] = ob_get_contents();  $this->assign('label', ob_get_contents());ob_end_clean();  echo ((is_array($_tmp=$this->_tpl_vars['label'])) ? $this->_run_mod_handler('strip_semicolon', true, $_tmp) : smarty_modifier_strip_semicolon($_tmp)); ?>
:
</td>
<td valign="top" width='37.5%' >
<?php echo smarty_function_counter(array('name' => 'panelFieldCount'), $this);?>


<select name="<?php echo $this->_tpl_vars['fields']['status']['name']; ?>
" 
id="<?php echo $this->_tpl_vars['fields']['status']['name']; ?>
" 
title='' tabindex="101"  
>
<?php if (isset ( $this->_tpl_vars['fields']['status']['value'] ) && $this->_tpl_vars['fields']['status']['value'] != ''):  echo smarty_function_html_options(array('options' => $this->_tpl_vars['fields']['status']['options'],'selected' => $this->_tpl_vars['fields']['status']['value']), $this);?>

<?php else:  echo smarty_function_html_options(array('options' => $this->_tpl_vars['fields']['status']['options'],'selected' => $this->_tpl_vars['fields']['status']['default']), $this);?>

<?php endif; ?>
</select>
</tr>
<tr>
<td valign="top" id='estimated_start_date_label' width='12.5%' scope="row">
<?php ob_start();  echo smarty_function_sugar_translate(array('label' => 'LBL_DATE_START','module' => 'Project'), $this);?>

<?php $this->_smarty_vars['capture']['label'] = ob_get_contents();  $this->assign('label', ob_get_contents());ob_end_clean();  echo ((is_array($_tmp=$this->_tpl_vars['label'])) ? $this->_run_mod_handler('strip_semicolon', true, $_tmp) : smarty_modifier_strip_semicolon($_tmp)); ?>
:
<span class="required">*</span>
</td>
<td valign="top" width='37.5%' >
<?php echo smarty_function_counter(array('name' => 'panelFieldCount'), $this);?>


<?php $this->assign('date_value', $this->_tpl_vars['fields']['estimated_start_date']['value']); ?>
<input autocomplete="off" type="text" name="<?php echo $this->_tpl_vars['fields']['estimated_start_date']['name']; ?>
" id="<?php echo $this->_tpl_vars['fields']['estimated_start_date']['name']; ?>
" value="<?php echo $this->_tpl_vars['date_value']; ?>
" title=''  tabindex='102' size="11" maxlength="10">
<img border="0" src="<?php echo smarty_function_sugar_getimagepath(array('file' => 'jscalendar.gif'), $this);?>
" alt="<?php echo $this->_tpl_vars['APP']['LBL_ENTER_DATE']; ?>
" id="<?php echo $this->_tpl_vars['fields']['estimated_start_date']['name']; ?>
_trigger" align="absmiddle" />
<script type="text/javascript">
Calendar.setup ({
inputField : "<?php echo $this->_tpl_vars['fields']['estimated_start_date']['name']; ?>
",
daFormat : "<?php echo $this->_tpl_vars['CALENDAR_FORMAT']; ?>
",
button : "<?php echo $this->_tpl_vars['fields']['estimated_start_date']['name']; ?>
_trigger",
singleClick : true,
dateStr : "<?php echo $this->_tpl_vars['date_value']; ?>
",
step : 1,
weekNumbers:false
}
);
</script>
<td valign="top" id='estimated_end_date_label' width='12.5%' scope="row">
<?php ob_start();  echo smarty_function_sugar_translate(array('label' => 'LBL_DATE_END','module' => 'Project'), $this);?>

<?php $this->_smarty_vars['capture']['label'] = ob_get_contents();  $this->assign('label', ob_get_contents());ob_end_clean();  echo ((is_array($_tmp=$this->_tpl_vars['label'])) ? $this->_run_mod_handler('strip_semicolon', true, $_tmp) : smarty_modifier_strip_semicolon($_tmp)); ?>
:
<span class="required">*</span>
</td>
<td valign="top" width='37.5%' >
<?php echo smarty_function_counter(array('name' => 'panelFieldCount'), $this);?>


<?php $this->assign('date_value', $this->_tpl_vars['fields']['estimated_end_date']['value']); ?>
<input autocomplete="off" type="text" name="<?php echo $this->_tpl_vars['fields']['estimated_end_date']['name']; ?>
" id="<?php echo $this->_tpl_vars['fields']['estimated_end_date']['name']; ?>
" value="<?php echo $this->_tpl_vars['date_value']; ?>
" title=''  tabindex='103' size="11" maxlength="10">
<img border="0" src="<?php echo smarty_function_sugar_getimagepath(array('file' => 'jscalendar.gif'), $this);?>
" alt="<?php echo $this->_tpl_vars['APP']['LBL_ENTER_DATE']; ?>
" id="<?php echo $this->_tpl_vars['fields']['estimated_end_date']['name']; ?>
_trigger" align="absmiddle" />
<script type="text/javascript">
Calendar.setup ({
inputField : "<?php echo $this->_tpl_vars['fields']['estimated_end_date']['name']; ?>
",
daFormat : "<?php echo $this->_tpl_vars['CALENDAR_FORMAT']; ?>
",
button : "<?php echo $this->_tpl_vars['fields']['estimated_end_date']['name']; ?>
_trigger",
singleClick : true,
dateStr : "<?php echo $this->_tpl_vars['date_value']; ?>
",
step : 1,
weekNumbers:false
}
);
</script>
</tr>
<tr>
<td valign="top" id='priority_label' width='12.5%' scope="row">
<?php ob_start();  echo smarty_function_sugar_translate(array('label' => 'LBL_PRIORITY','module' => 'Project'), $this);?>

<?php $this->_smarty_vars['capture']['label'] = ob_get_contents();  $this->assign('label', ob_get_contents());ob_end_clean();  echo ((is_array($_tmp=$this->_tpl_vars['label'])) ? $this->_run_mod_handler('strip_semicolon', true, $_tmp) : smarty_modifier_strip_semicolon($_tmp)); ?>
:
</td>
<td valign="top" width='37.5%' colspan='3'>
<?php echo smarty_function_counter(array('name' => 'panelFieldCount'), $this);?>


<select name="<?php echo $this->_tpl_vars['fields']['priority']['name']; ?>
" 
id="<?php echo $this->_tpl_vars['fields']['priority']['name']; ?>
" 
title='' tabindex="104"  
>
<?php if (isset ( $this->_tpl_vars['fields']['priority']['value'] ) && $this->_tpl_vars['fields']['priority']['value'] != ''):  echo smarty_function_html_options(array('options' => $this->_tpl_vars['fields']['priority']['options'],'selected' => $this->_tpl_vars['fields']['priority']['value']), $this);?>

<?php else:  echo smarty_function_html_options(array('options' => $this->_tpl_vars['fields']['priority']['options'],'selected' => $this->_tpl_vars['fields']['priority']['default']), $this);?>

<?php endif; ?>
</select>
</tr>
<tr>
<td valign="top" id='assigned_user_name_label' width='12.5%' scope="row">
<?php ob_start();  echo smarty_function_sugar_translate(array('label' => 'LBL_ASSIGNED_USER_NAME','module' => 'Project'), $this);?>

<?php $this->_smarty_vars['capture']['label'] = ob_get_contents();  $this->assign('label', ob_get_contents());ob_end_clean();  echo ((is_array($_tmp=$this->_tpl_vars['label'])) ? $this->_run_mod_handler('strip_semicolon', true, $_tmp) : smarty_modifier_strip_semicolon($_tmp)); ?>
:
</td>
<td valign="top" width='37.5%' colspan='3'>
<?php echo smarty_function_counter(array('name' => 'panelFieldCount'), $this);?>


<input type="text" name="<?php echo $this->_tpl_vars['fields']['assigned_user_name']['name']; ?>
" class="sqsEnabled" tabindex="105" id="<?php echo $this->_tpl_vars['fields']['assigned_user_name']['name']; ?>
" size="" value="<?php echo $this->_tpl_vars['fields']['assigned_user_name']['value']; ?>
" title='' autocomplete="off"  >
<input type="hidden" name="<?php echo $this->_tpl_vars['fields']['assigned_user_name']['id_name']; ?>
" 
id="<?php echo $this->_tpl_vars['fields']['assigned_user_name']['id_name']; ?>
" 
value="<?php echo $this->_tpl_vars['fields']['assigned_user_id']['value']; ?>
">
<span class="id-ff multiple">
<button type="button" name="btn_<?php echo $this->_tpl_vars['fields']['assigned_user_name']['name']; ?>
" id="btn_<?php echo $this->_tpl_vars['fields']['assigned_user_name']['name']; ?>
" tabindex="105" title="<?php echo $this->_tpl_vars['APP']['LBL_SELECT_BUTTON_TITLE']; ?>
" accessKey="<?php echo $this->_tpl_vars['APP']['LBL_SELECT_BUTTON_KEY']; ?>
" class="button firstChild" value="<?php echo $this->_tpl_vars['APP']['LBL_SELECT_BUTTON_LABEL']; ?>
" 
onclick='open_popup(
"<?php echo $this->_tpl_vars['fields']['assigned_user_name']['module']; ?>
", 
600, 
400, 
"", 
true, 
false, 
<?php echo '{"call_back_function":"set_return","form_name":"form_SubpanelQuickCreate_Project","field_to_name_array":{"id":"assigned_user_id","user_name":"assigned_user_name"}}'; ?>
, 
"single", 
true
);' ><img src="<?php echo smarty_function_sugar_getimagepath(array('file' => "id-ff-select.png"), $this);?>
"></button><button type="button" name="btn_clr_<?php echo $this->_tpl_vars['fields']['assigned_user_name']['name']; ?>
" id="btn_clr_<?php echo $this->_tpl_vars['fields']['assigned_user_name']['name']; ?>
" tabindex="105" title="<?php echo $this->_tpl_vars['APP']['LBL_CLEAR_BUTTON_TITLE']; ?>
" accessKey="<?php echo $this->_tpl_vars['APP']['LBL_CLEAR_BUTTON_KEY']; ?>
" class="button lastChild" 
onclick="this.form.<?php echo $this->_tpl_vars['fields']['assigned_user_name']['name']; ?>
.value = ''; this.form.<?php echo $this->_tpl_vars['fields']['assigned_user_name']['id_name']; ?>
.value = '';" 
value="<?php echo $this->_tpl_vars['APP']['LBL_CLEAR_BUTTON_LABEL']; ?>
" ><img src="<?php echo smarty_function_sugar_getimagepath(array('file' => "id-ff-clear.png"), $this);?>
"></button>
</span>
<script type="text/javascript">
<!--
if(typeof QSProcessedFieldsArray != 'undefined') 
	QSProcessedFieldsArray["<?php echo $this->_tpl_vars['form_name']; ?>
_<?php echo $this->_tpl_vars['fields']['assigned_user_name']['name']; ?>
"] = false;
	

enableQS(false);
-->	
</script>
</tr>
<tr>
<td valign="top" id='description_label' width='12.5%' scope="row">
<?php ob_start();  echo smarty_function_sugar_translate(array('label' => 'LBL_DESCRIPTION','module' => 'Project'), $this);?>

<?php $this->_smarty_vars['capture']['label'] = ob_get_contents();  $this->assign('label', ob_get_contents());ob_end_clean();  echo ((is_array($_tmp=$this->_tpl_vars['label'])) ? $this->_run_mod_handler('strip_semicolon', true, $_tmp) : smarty_modifier_strip_semicolon($_tmp)); ?>
:
</td>
<td valign="top" width='37.5%' colspan='3'>
<?php echo smarty_function_counter(array('name' => 'panelFieldCount'), $this);?>


<?php if (empty ( $this->_tpl_vars['fields']['description']['value'] )):  $this->assign('value', $this->_tpl_vars['fields']['description']['default_value']);  else:  $this->assign('value', $this->_tpl_vars['fields']['description']['value']);  endif; ?>  
<textarea  id='<?php echo $this->_tpl_vars['fields']['description']['name']; ?>
' name='<?php echo $this->_tpl_vars['fields']['description']['name']; ?>
'
rows="4" 
cols="60" 
title='' tabindex="106" ><?php echo $this->_tpl_vars['value']; ?>
</textarea>
</tr>
</table>
</div>
<?php if ($this->_tpl_vars['panelFieldCount'] == 0): ?>
<script>document.getElementById("").style.display='none';</script>
<?php endif; ?>
</div></div>

<div class="buttons">
<?php if ($this->_tpl_vars['bean']->aclAccess('save')): ?><input title="<?php echo $this->_tpl_vars['APP']['LBL_SAVE_BUTTON_TITLE']; ?>
" accessKey="<?php echo $this->_tpl_vars['APP']['LBL_SAVE_BUTTON_KEY']; ?>
" class="button" onclick="this.form.action.value='Save';if(check_form('form_SubpanelQuickCreate_Project'))return SUGAR.subpanelUtils.inlineSave(this.form.id, 'Project_subpanel_save_button');return false;" type="submit" name="Project_subpanel_save_button" id="Project_subpanel_save_button" value="<?php echo $this->_tpl_vars['APP']['LBL_SAVE_BUTTON_LABEL']; ?>
"><?php endif; ?> 
<input title="<?php echo $this->_tpl_vars['APP']['LBL_CANCEL_BUTTON_TITLE']; ?>
" accessKey="<?php echo $this->_tpl_vars['APP']['LBL_CANCEL_BUTTON_KEY']; ?>
" class="button" onclick="return SUGAR.subpanelUtils.cancelCreate('Project_subpanel_cancel_button');return false;" type="submit" name="Project_subpanel_cancel_button" id="Project_subpanel_cancel_button" value="<?php echo $this->_tpl_vars['APP']['LBL_CANCEL_BUTTON_LABEL']; ?>
"> 
<input title="<?php echo $this->_tpl_vars['APP']['LBL_FULL_FORM_BUTTON_TITLE']; ?>
" accessKey="<?php echo $this->_tpl_vars['APP']['LBL_FULL_FORM_BUTTON_KEY']; ?>
" class="button" onclick="disableOnUnloadEditView(this.form); this.form.return_action.value='DetailView'; this.form.action.value='EditView'; if(typeof(this.form.to_pdf)!='undefined') this.form.to_pdf.value='0';" type="submit" name="Project_subpanel_full_form_button" id="Project_subpanel_full_form_button" value="<?php echo $this->_tpl_vars['APP']['LBL_FULL_FORM_BUTTON_LABEL']; ?>
"> <input type="hidden" name="full_form" value="full_form">
<?php if ($this->_tpl_vars['bean']->aclAccess('detail')):  if (! empty ( $this->_tpl_vars['fields']['id']['value'] ) && $this->_tpl_vars['isAuditEnabled']): ?><input title="<?php echo $this->_tpl_vars['APP']['LNK_VIEW_CHANGE_LOG']; ?>
" class="button" onclick='open_popup("Audit", "600", "400", "&record=<?php echo $this->_tpl_vars['fields']['id']['value']; ?>
&module_name=Project", true, false,  { "call_back_function":"set_return","form_name":"EditView","field_to_name_array":[] } ); return false;' type="submit" value="<?php echo $this->_tpl_vars['APP']['LNK_VIEW_CHANGE_LOG']; ?>
"><?php endif;  endif; ?>
</div>
</form>
<?php echo $this->_tpl_vars['set_focus_block']; ?>

<script type="text/javascript">
YAHOO.util.Event.onContentReady("form_QuickCreate_Accounts", 
    function () { initEditView(document.forms.form_SubpanelQuickCreate_Project) });
//window.setTimeout(, 100);
window.onbeforeunload = function () { return onUnloadEditView(); };
</script><?php echo '
<script type="text/javascript">
addToValidate(\'form_SubpanelQuickCreate_Project\', \'id\', \'id\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_ID','module' => 'Project'), $this); echo '\' );
addToValidate(\'form_SubpanelQuickCreate_Project\', \'date_entered_date\', \'date\', false,\'Date Created\' );
addToValidate(\'form_SubpanelQuickCreate_Project\', \'date_modified_date\', \'date\', false,\'Date Modified\' );
addToValidate(\'form_SubpanelQuickCreate_Project\', \'assigned_user_id\', \'assigned_user_name\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_ASSIGNED_USER_ID','module' => 'Project'), $this); echo '\' );
addToValidate(\'form_SubpanelQuickCreate_Project\', \'modified_user_id\', \'assigned_user_name\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_MODIFIED_USER_ID','module' => 'Project'), $this); echo '\' );
addToValidate(\'form_SubpanelQuickCreate_Project\', \'modified_by_name\', \'relate\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_MODIFIED_NAME','module' => 'Project'), $this); echo '\' );
addToValidate(\'form_SubpanelQuickCreate_Project\', \'created_by\', \'assigned_user_name\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_CREATED_BY','module' => 'Project'), $this); echo '\' );
addToValidate(\'form_SubpanelQuickCreate_Project\', \'created_by_name\', \'relate\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_CREATED','module' => 'Project'), $this); echo '\' );
addToValidate(\'form_SubpanelQuickCreate_Project\', \'name\', \'name\', true,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_NAME','module' => 'Project'), $this); echo '\' );
addToValidate(\'form_SubpanelQuickCreate_Project\', \'description\', \'text\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_DESCRIPTION','module' => 'Project'), $this); echo '\' );
addToValidate(\'form_SubpanelQuickCreate_Project\', \'deleted\', \'bool\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_DELETED','module' => 'Project'), $this); echo '\' );
addToValidateDateBeforeAllowBlank(\'form_SubpanelQuickCreate_Project\', \'estimated_start_date\', \'date\', true,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_DATE_START','module' => 'Project'), $this); echo '\', \'estimated_end_date\', \'true\' );
addToValidate(\'form_SubpanelQuickCreate_Project\', \'estimated_end_date\', \'date\', true,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_DATE_END','module' => 'Project'), $this); echo '\' );
addToValidate(\'form_SubpanelQuickCreate_Project\', \'status\', \'enum\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_STATUS','module' => 'Project'), $this); echo '\' );
addToValidate(\'form_SubpanelQuickCreate_Project\', \'priority\', \'enum\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_PRIORITY','module' => 'Project'), $this); echo '\' );
addToValidate(\'form_SubpanelQuickCreate_Project\', \'total_estimated_effort\', \'int\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_LIST_TOTAL_ESTIMATED_EFFORT','module' => 'Project'), $this); echo '\' );
addToValidate(\'form_SubpanelQuickCreate_Project\', \'total_actual_effort\', \'int\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_LIST_TOTAL_ACTUAL_EFFORT','module' => 'Project'), $this); echo '\' );
addToValidate(\'form_SubpanelQuickCreate_Project\', \'assigned_user_name\', \'relate\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_ASSIGNED_USER_NAME','module' => 'Project'), $this); echo '\' );
addToValidate(\'form_SubpanelQuickCreate_Project\', \'areablock_c\', \'varchar\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_AREABLOCK','module' => 'Project'), $this); echo '\' );
addToValidate(\'form_SubpanelQuickCreate_Project\', \'wellname_c\', \'varchar\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_WELLNAME','module' => 'Project'), $this); echo '\' );
addToValidate(\'form_SubpanelQuickCreate_Project\', \'ocsg_c\', \'varchar\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_OCSG','module' => 'Project'), $this); echo '\' );
addToValidate(\'form_SubpanelQuickCreate_Project\', \'afe_c\', \'varchar\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_AFE','module' => 'Project'), $this); echo '\' );
addToValidate(\'form_SubpanelQuickCreate_Project\', \'po_c\', \'varchar\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_PO','module' => 'Project'), $this); echo '\' );
addToValidate(\'form_SubpanelQuickCreate_Project\', \'facility_c\', \'varchar\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_FACILITY','module' => 'Project'), $this); echo '\' );
addToValidate(\'form_SubpanelQuickCreate_Project\', \'customer_c\', \'varchar\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_CUSTOMER','module' => 'Project'), $this); echo '\' );
addToValidate(\'form_SubpanelQuickCreate_Project\', \'dockname_c\', \'varchar\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_DOCKNAME','module' => 'Project'), $this); echo '\' );
addToValidate(\'form_SubpanelQuickCreate_Project\', \'heliname_c\', \'varchar\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_HELINAME','module' => 'Project'), $this); echo '\' );
addToValidate(\'form_SubpanelQuickCreate_Project\', \'prebill_c\', \'bool\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_PREBILL','module' => 'Project'), $this); echo '\' );
addToValidate(\'form_SubpanelQuickCreate_Project\', \'address1_c\', \'varchar\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_ADDRESS1','module' => 'Project'), $this); echo '\' );
addToValidate(\'form_SubpanelQuickCreate_Project\', \'address2_c\', \'varchar\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_ADDRESS2','module' => 'Project'), $this); echo '\' );
addToValidate(\'form_SubpanelQuickCreate_Project\', \'city_c\', \'varchar\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_CITY','module' => 'Project'), $this); echo '\' );
addToValidate(\'form_SubpanelQuickCreate_Project\', \'state_c\', \'varchar\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_STATE','module' => 'Project'), $this); echo '\' );
addToValidate(\'form_SubpanelQuickCreate_Project\', \'zip_c\', \'varchar\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_ZIP','module' => 'Project'), $this); echo '\' );
addToValidate(\'form_SubpanelQuickCreate_Project\', \'contactname_c\', \'varchar\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_CONTACTNAME','module' => 'Project'), $this); echo '\' );
addToValidate(\'form_SubpanelQuickCreate_Project\', \'contactphone_c\', \'phone\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_CONTACTPHONE','module' => 'Project'), $this); echo '\' );
addToValidate(\'form_SubpanelQuickCreate_Project\', \'contactemail_c\', \'varchar\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_CONTACTEMAIL','module' => 'Project'), $this); echo '\' );
addToValidate(\'form_SubpanelQuickCreate_Project\', \'contactfax_c\', \'phone\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_CONTACTFAX','module' => 'Project'), $this); echo '\' );
addToValidateBinaryDependency(\'form_SubpanelQuickCreate_Project\', \'assigned_user_name\', \'alpha\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'ERR_SQS_NO_MATCH_FIELD','module' => 'Project'), $this); echo ': ';  echo smarty_function_sugar_translate(array('label' => 'LBL_ASSIGNED_TO','module' => 'Project'), $this); echo '\', \'assigned_user_id\' );
</script><script language="javascript">if(typeof sqs_objects == \'undefined\'){var sqs_objects = new Array;}sqs_objects[\'form_SubpanelQuickCreate_Project_assigned_user_name\']={"form":"form_SubpanelQuickCreate_Project","method":"get_user_array","field_list":["user_name","id"],"populate_list":["assigned_user_name","assigned_user_id"],"required_list":["assigned_user_id"],"conditions":[{"name":"user_name","op":"like_custom","end":"%","value":""}],"limit":"30","no_match_text":"No Match"};</script>'; ?>
