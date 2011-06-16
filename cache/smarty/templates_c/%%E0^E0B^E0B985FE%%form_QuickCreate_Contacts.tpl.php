<?php /* Smarty version 2.6.11, created on 2011-05-17 09:42:09
         compiled from cache/modules/Contacts/form_QuickCreate_Contacts.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'sugar_include', 'cache/modules/Contacts/form_QuickCreate_Contacts.tpl', 43, false),array('function', 'counter', 'cache/modules/Contacts/form_QuickCreate_Contacts.tpl', 48, false),array('function', 'sugar_translate', 'cache/modules/Contacts/form_QuickCreate_Contacts.tpl', 53, false),array('function', 'sugar_getimagepath', 'cache/modules/Contacts/form_QuickCreate_Contacts.tpl', 94, false),array('function', 'html_options', 'cache/modules/Contacts/form_QuickCreate_Contacts.tpl', 248, false),array('modifier', 'default', 'cache/modules/Contacts/form_QuickCreate_Contacts.tpl', 49, false),array('modifier', 'strip_semicolon', 'cache/modules/Contacts/form_QuickCreate_Contacts.tpl', 55, false),)), $this); ?>


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
<input type="hidden" name="opportunity_id" value="<?php echo $_REQUEST['opportunity_id']; ?>
">   
<input type="hidden" name="case_id" value="<?php echo $_REQUEST['case_id']; ?>
">   
<input type="hidden" name="bug_id" value="<?php echo $_REQUEST['bug_id']; ?>
">   
<input type="hidden" name="email_id" value="<?php echo $_REQUEST['email_id']; ?>
">   
<input type="hidden" name="inbound_email_id" value="<?php echo $_REQUEST['inbound_email_id']; ?>
">   
<input type="hidden" name="reports_to_id" value="<?php echo $_REQUEST['contact_id']; ?>
">   
<input type="hidden" name="report_to_name" value="<?php echo $_REQUEST['contact_name']; ?>
">   
<?php if ($this->_tpl_vars['bean']->aclAccess('save')): ?><input title="<?php echo $this->_tpl_vars['APP']['LBL_SAVE_BUTTON_TITLE']; ?>
" accessKey="<?php echo $this->_tpl_vars['APP']['LBL_SAVE_BUTTON_KEY']; ?>
" class="button primary" onclick="this.form.action.value='Popup';return check_form('form_QuickCreate_Contacts')" type="submit" name="Contacts_popupcreate_save_button" id="Contacts_popupcreate_save_button" value="<?php echo $this->_tpl_vars['APP']['LBL_SAVE_BUTTON_LABEL']; ?>
"><?php endif; ?> 
<input title="<?php echo $this->_tpl_vars['APP']['LBL_CANCEL_BUTTON_TITLE']; ?>
" accessKey="<?php echo $this->_tpl_vars['APP']['LBL_CANCEL_BUTTON_KEY']; ?>
" class="button" onclick="toggleDisplay('addform');return false;" name="Contacts_popup_cancel_button" type="submit"id="Contacts_popup_cancel_button" value="<?php echo $this->_tpl_vars['APP']['LBL_CANCEL_BUTTON_LABEL']; ?>
"> 
<?php if ($this->_tpl_vars['bean']->aclAccess('detail')):  if (! empty ( $this->_tpl_vars['fields']['id']['value'] ) && $this->_tpl_vars['isAuditEnabled']): ?><input title="<?php echo $this->_tpl_vars['APP']['LNK_VIEW_CHANGE_LOG']; ?>
" class="button" onclick='open_popup("Audit", "600", "400", "&record=<?php echo $this->_tpl_vars['fields']['id']['value']; ?>
&module_name=Contacts", true, false,  { "call_back_function":"set_return","form_name":"EditView","field_to_name_array":[] } ); return false;' type="submit" value="<?php echo $this->_tpl_vars['APP']['LNK_VIEW_CHANGE_LOG']; ?>
"><?php endif;  endif; ?>
</td>
<td align='right'>
<?php echo $this->_tpl_vars['PAGINATION']; ?>

</td>
</tr>
</table><?php echo smarty_function_sugar_include(array('include' => $this->_tpl_vars['includes']), $this);?>

<div id="form_QuickCreate_Contacts_tabs" 
>
<div >
<div id="DEFAULT">
<?php echo smarty_function_counter(array('name' => 'panelFieldCount','start' => 0,'print' => false,'assign' => 'panelFieldCount'), $this);?>

<table width="100%" border="0" cellspacing="1" cellpadding="0"  class="<?php echo ((is_array($_tmp=@$this->_tpl_vars['def']['templateMeta']['panelClass'])) ? $this->_run_mod_handler('default', true, $_tmp, 'edit view') : smarty_modifier_default($_tmp, 'edit view')); ?>
">
<tr>
<td valign="top" id='first_name_label' width='12.5%' scope="row">
<?php ob_start();  echo smarty_function_sugar_translate(array('label' => 'LBL_FIRST_NAME','module' => 'Contacts'), $this);?>

<?php $this->_smarty_vars['capture']['label'] = ob_get_contents();  $this->assign('label', ob_get_contents());ob_end_clean();  echo ((is_array($_tmp=$this->_tpl_vars['label'])) ? $this->_run_mod_handler('strip_semicolon', true, $_tmp) : smarty_modifier_strip_semicolon($_tmp)); ?>
:
</td>
<td valign="top" width='37.5%' >
<?php echo smarty_function_counter(array('name' => 'panelFieldCount'), $this);?>


<?php if (strlen ( $this->_tpl_vars['fields']['first_name']['value'] ) <= 0):  $this->assign('value', $this->_tpl_vars['fields']['first_name']['default_value']);  else:  $this->assign('value', $this->_tpl_vars['fields']['first_name']['value']);  endif; ?>  
<input type='text' name='<?php echo $this->_tpl_vars['fields']['first_name']['name']; ?>
' 
id='<?php echo $this->_tpl_vars['fields']['first_name']['name']; ?>
' size='30' 
maxlength='100' 
value='<?php echo $this->_tpl_vars['value']; ?>
' title='' tabindex='100' > 
<td valign="top" id='account_name_label' width='12.5%' scope="row">
<?php ob_start();  echo smarty_function_sugar_translate(array('label' => 'LBL_ACCOUNT_NAME','module' => 'Contacts'), $this);?>

<?php $this->_smarty_vars['capture']['label'] = ob_get_contents();  $this->assign('label', ob_get_contents());ob_end_clean();  echo ((is_array($_tmp=$this->_tpl_vars['label'])) ? $this->_run_mod_handler('strip_semicolon', true, $_tmp) : smarty_modifier_strip_semicolon($_tmp)); ?>
:
</td>
<td valign="top" width='37.5%' >
<?php echo smarty_function_counter(array('name' => 'panelFieldCount'), $this);?>


<input type="text" name="<?php echo $this->_tpl_vars['fields']['account_name']['name']; ?>
" class="sqsEnabled" tabindex="101" id="<?php echo $this->_tpl_vars['fields']['account_name']['name']; ?>
" size="" value="<?php echo $this->_tpl_vars['fields']['account_name']['value']; ?>
" title='' autocomplete="off"  >
<input type="hidden" name="<?php echo $this->_tpl_vars['fields']['account_name']['id_name']; ?>
" 
id="<?php echo $this->_tpl_vars['fields']['account_name']['id_name']; ?>
" 
value="<?php echo $this->_tpl_vars['fields']['account_id']['value']; ?>
">
<span class="id-ff multiple">
<button type="button" name="btn_<?php echo $this->_tpl_vars['fields']['account_name']['name']; ?>
" id="btn_<?php echo $this->_tpl_vars['fields']['account_name']['name']; ?>
" tabindex="101" title="<?php echo $this->_tpl_vars['APP']['LBL_SELECT_BUTTON_TITLE']; ?>
" accessKey="<?php echo $this->_tpl_vars['APP']['LBL_SELECT_BUTTON_KEY']; ?>
" class="button firstChild" value="<?php echo $this->_tpl_vars['APP']['LBL_SELECT_BUTTON_LABEL']; ?>
" 
onclick='open_popup(
"<?php echo $this->_tpl_vars['fields']['account_name']['module']; ?>
", 
600, 
400, 
"", 
true, 
false, 
<?php echo '{"call_back_function":"set_return","form_name":"form_QuickCreate_Contacts","field_to_name_array":{"id":"account_id","name":"account_name"}}'; ?>
, 
"single", 
true
);' ><img src="<?php echo smarty_function_sugar_getimagepath(array('file' => "id-ff-select.png"), $this);?>
"></button><button type="button" name="btn_clr_<?php echo $this->_tpl_vars['fields']['account_name']['name']; ?>
" id="btn_clr_<?php echo $this->_tpl_vars['fields']['account_name']['name']; ?>
" tabindex="101" title="<?php echo $this->_tpl_vars['APP']['LBL_CLEAR_BUTTON_TITLE']; ?>
" accessKey="<?php echo $this->_tpl_vars['APP']['LBL_CLEAR_BUTTON_KEY']; ?>
" class="button lastChild" 
onclick="this.form.<?php echo $this->_tpl_vars['fields']['account_name']['name']; ?>
.value = ''; this.form.<?php echo $this->_tpl_vars['fields']['account_name']['id_name']; ?>
.value = '';" 
value="<?php echo $this->_tpl_vars['APP']['LBL_CLEAR_BUTTON_LABEL']; ?>
" ><img src="<?php echo smarty_function_sugar_getimagepath(array('file' => "id-ff-clear.png"), $this);?>
"></button>
</span>
<script type="text/javascript">
<!--
if(typeof QSProcessedFieldsArray != 'undefined') 
	QSProcessedFieldsArray["<?php echo $this->_tpl_vars['form_name']; ?>
_<?php echo $this->_tpl_vars['fields']['account_name']['name']; ?>
"] = false;
	

enableQS(false);
-->	
</script>
</tr>
<tr>
<td valign="top" id='last_name_label' width='12.5%' scope="row">
<?php ob_start();  echo smarty_function_sugar_translate(array('label' => 'LBL_LAST_NAME','module' => 'Contacts'), $this);?>

<?php $this->_smarty_vars['capture']['label'] = ob_get_contents();  $this->assign('label', ob_get_contents());ob_end_clean();  echo ((is_array($_tmp=$this->_tpl_vars['label'])) ? $this->_run_mod_handler('strip_semicolon', true, $_tmp) : smarty_modifier_strip_semicolon($_tmp)); ?>
:
<span class="required">*</span>
</td>
<td valign="top" width='37.5%' >
<?php echo smarty_function_counter(array('name' => 'panelFieldCount'), $this);?>


<?php if (strlen ( $this->_tpl_vars['fields']['last_name']['value'] ) <= 0):  $this->assign('value', $this->_tpl_vars['fields']['last_name']['default_value']);  else:  $this->assign('value', $this->_tpl_vars['fields']['last_name']['value']);  endif; ?>  
<input type='text' name='<?php echo $this->_tpl_vars['fields']['last_name']['name']; ?>
' 
id='<?php echo $this->_tpl_vars['fields']['last_name']['name']; ?>
' size='30' 
maxlength='100' 
value='<?php echo $this->_tpl_vars['value']; ?>
' title='' tabindex='102' > 
<td valign="top" id='phone_work_label' width='12.5%' scope="row">
<?php ob_start();  echo smarty_function_sugar_translate(array('label' => 'LBL_OFFICE_PHONE','module' => 'Contacts'), $this);?>

<?php $this->_smarty_vars['capture']['label'] = ob_get_contents();  $this->assign('label', ob_get_contents());ob_end_clean();  echo ((is_array($_tmp=$this->_tpl_vars['label'])) ? $this->_run_mod_handler('strip_semicolon', true, $_tmp) : smarty_modifier_strip_semicolon($_tmp)); ?>
:
</td>
<td valign="top" width='37.5%' >
<?php echo smarty_function_counter(array('name' => 'panelFieldCount'), $this);?>


<?php if (strlen ( $this->_tpl_vars['fields']['phone_work']['value'] ) <= 0):  $this->assign('value', $this->_tpl_vars['fields']['phone_work']['default_value']);  else:  $this->assign('value', $this->_tpl_vars['fields']['phone_work']['value']);  endif; ?>  
<input type='text' name='<?php echo $this->_tpl_vars['fields']['phone_work']['name']; ?>
' 
id='<?php echo $this->_tpl_vars['fields']['phone_work']['name']; ?>
' size='30' 
maxlength='100' 
value='<?php echo $this->_tpl_vars['value']; ?>
' title='' tabindex='103' > 
</tr>
<tr>
<td valign="top" id='title_label' width='12.5%' scope="row">
<?php ob_start();  echo smarty_function_sugar_translate(array('label' => 'LBL_TITLE','module' => 'Contacts'), $this);?>

<?php $this->_smarty_vars['capture']['label'] = ob_get_contents();  $this->assign('label', ob_get_contents());ob_end_clean();  echo ((is_array($_tmp=$this->_tpl_vars['label'])) ? $this->_run_mod_handler('strip_semicolon', true, $_tmp) : smarty_modifier_strip_semicolon($_tmp)); ?>
:
</td>
<td valign="top" width='37.5%' >
<?php echo smarty_function_counter(array('name' => 'panelFieldCount'), $this);?>


<?php if (strlen ( $this->_tpl_vars['fields']['title']['value'] ) <= 0):  $this->assign('value', $this->_tpl_vars['fields']['title']['default_value']);  else:  $this->assign('value', $this->_tpl_vars['fields']['title']['value']);  endif; ?>  
<input type='text' name='<?php echo $this->_tpl_vars['fields']['title']['name']; ?>
' 
id='<?php echo $this->_tpl_vars['fields']['title']['name']; ?>
' size='30' 
maxlength='100' 
value='<?php echo $this->_tpl_vars['value']; ?>
' title='' tabindex='104' > 
<td valign="top" id='phone_mobile_label' width='12.5%' scope="row">
<?php ob_start();  echo smarty_function_sugar_translate(array('label' => 'LBL_MOBILE_PHONE','module' => 'Contacts'), $this);?>

<?php $this->_smarty_vars['capture']['label'] = ob_get_contents();  $this->assign('label', ob_get_contents());ob_end_clean();  echo ((is_array($_tmp=$this->_tpl_vars['label'])) ? $this->_run_mod_handler('strip_semicolon', true, $_tmp) : smarty_modifier_strip_semicolon($_tmp)); ?>
:
</td>
<td valign="top" width='37.5%' >
<?php echo smarty_function_counter(array('name' => 'panelFieldCount'), $this);?>


<?php if (strlen ( $this->_tpl_vars['fields']['phone_mobile']['value'] ) <= 0):  $this->assign('value', $this->_tpl_vars['fields']['phone_mobile']['default_value']);  else:  $this->assign('value', $this->_tpl_vars['fields']['phone_mobile']['value']);  endif; ?>  
<input type='text' name='<?php echo $this->_tpl_vars['fields']['phone_mobile']['name']; ?>
' 
id='<?php echo $this->_tpl_vars['fields']['phone_mobile']['name']; ?>
' size='30' 
maxlength='100' 
value='<?php echo $this->_tpl_vars['value']; ?>
' title='' tabindex='105' > 
</tr>
<tr>
<td valign="top" id='phone_fax_label' width='12.5%' scope="row">
<?php ob_start();  echo smarty_function_sugar_translate(array('label' => 'LBL_FAX_PHONE','module' => 'Contacts'), $this);?>

<?php $this->_smarty_vars['capture']['label'] = ob_get_contents();  $this->assign('label', ob_get_contents());ob_end_clean();  echo ((is_array($_tmp=$this->_tpl_vars['label'])) ? $this->_run_mod_handler('strip_semicolon', true, $_tmp) : smarty_modifier_strip_semicolon($_tmp)); ?>
:
</td>
<td valign="top" width='37.5%' >
<?php echo smarty_function_counter(array('name' => 'panelFieldCount'), $this);?>


<?php if (strlen ( $this->_tpl_vars['fields']['phone_fax']['value'] ) <= 0):  $this->assign('value', $this->_tpl_vars['fields']['phone_fax']['default_value']);  else:  $this->assign('value', $this->_tpl_vars['fields']['phone_fax']['value']);  endif; ?>  
<input type='text' name='<?php echo $this->_tpl_vars['fields']['phone_fax']['name']; ?>
' 
id='<?php echo $this->_tpl_vars['fields']['phone_fax']['name']; ?>
' size='30' 
maxlength='100' 
value='<?php echo $this->_tpl_vars['value']; ?>
' title='' tabindex='106' > 
<td valign="top" id='do_not_call_label' width='12.5%' scope="row">
<?php ob_start();  echo smarty_function_sugar_translate(array('label' => 'LBL_DO_NOT_CALL','module' => 'Contacts'), $this);?>

<?php $this->_smarty_vars['capture']['label'] = ob_get_contents();  $this->assign('label', ob_get_contents());ob_end_clean();  echo ((is_array($_tmp=$this->_tpl_vars['label'])) ? $this->_run_mod_handler('strip_semicolon', true, $_tmp) : smarty_modifier_strip_semicolon($_tmp)); ?>
:
</td>
<td valign="top" width='37.5%' >
<?php echo smarty_function_counter(array('name' => 'panelFieldCount'), $this);?>


<?php if (strval ( $this->_tpl_vars['fields']['do_not_call']['value'] ) == '1' || strval ( $this->_tpl_vars['fields']['do_not_call']['value'] ) == 'yes' || strval ( $this->_tpl_vars['fields']['do_not_call']['value'] ) == 'on'): ?> 
<?php $this->assign('checked', 'CHECKED');  else:  $this->assign('checked', "");  endif; ?>
<input type="hidden" name="<?php echo $this->_tpl_vars['fields']['do_not_call']['name']; ?>
" value="0"> 
<input type="checkbox" id="<?php echo $this->_tpl_vars['fields']['do_not_call']['name']; ?>
" 
name="<?php echo $this->_tpl_vars['fields']['do_not_call']['name']; ?>
" 
value="1" title='' tabindex="107" <?php echo $this->_tpl_vars['checked']; ?>
 >
</tr>
<tr>
<td valign="top" id='email1_label' width='12.5%' scope="row">
<?php ob_start();  echo smarty_function_sugar_translate(array('label' => 'LBL_EMAIL_ADDRESS','module' => 'Contacts'), $this);?>

<?php $this->_smarty_vars['capture']['label'] = ob_get_contents();  $this->assign('label', ob_get_contents());ob_end_clean();  echo ((is_array($_tmp=$this->_tpl_vars['label'])) ? $this->_run_mod_handler('strip_semicolon', true, $_tmp) : smarty_modifier_strip_semicolon($_tmp)); ?>
:
</td>
<td valign="top" width='37.5%' >
<?php echo smarty_function_counter(array('name' => 'panelFieldCount'), $this);?>

<span id='email1'>
<?php echo $this->_tpl_vars['fields']['email1']['value']; ?>
</span>
<td valign="top" id='lead_source_label' width='12.5%' scope="row">
<?php ob_start();  echo smarty_function_sugar_translate(array('label' => 'LBL_LEAD_SOURCE','module' => 'Contacts'), $this);?>

<?php $this->_smarty_vars['capture']['label'] = ob_get_contents();  $this->assign('label', ob_get_contents());ob_end_clean();  echo ((is_array($_tmp=$this->_tpl_vars['label'])) ? $this->_run_mod_handler('strip_semicolon', true, $_tmp) : smarty_modifier_strip_semicolon($_tmp)); ?>
:
</td>
<td valign="top" width='37.5%' >
<?php echo smarty_function_counter(array('name' => 'panelFieldCount'), $this);?>


<select name="<?php echo $this->_tpl_vars['fields']['lead_source']['name']; ?>
" 
id="<?php echo $this->_tpl_vars['fields']['lead_source']['name']; ?>
" 
title='' tabindex="109"  
>
<?php if (isset ( $this->_tpl_vars['fields']['lead_source']['value'] ) && $this->_tpl_vars['fields']['lead_source']['value'] != ''):  echo smarty_function_html_options(array('options' => $this->_tpl_vars['fields']['lead_source']['options'],'selected' => $this->_tpl_vars['fields']['lead_source']['value']), $this);?>

<?php else:  echo smarty_function_html_options(array('options' => $this->_tpl_vars['fields']['lead_source']['options'],'selected' => $this->_tpl_vars['fields']['lead_source']['default']), $this);?>

<?php endif; ?>
</select>
</tr>
<tr>
<td valign="top" id='assigned_user_name_label' width='12.5%' scope="row">
<?php ob_start();  echo smarty_function_sugar_translate(array('label' => 'LBL_ASSIGNED_TO','module' => 'Contacts'), $this);?>

<?php $this->_smarty_vars['capture']['label'] = ob_get_contents();  $this->assign('label', ob_get_contents());ob_end_clean();  echo ((is_array($_tmp=$this->_tpl_vars['label'])) ? $this->_run_mod_handler('strip_semicolon', true, $_tmp) : smarty_modifier_strip_semicolon($_tmp)); ?>
:
</td>
<td valign="top" width='37.5%' colspan='3'>
<?php echo smarty_function_counter(array('name' => 'panelFieldCount'), $this);?>


<input type="text" name="<?php echo $this->_tpl_vars['fields']['assigned_user_name']['name']; ?>
" class="sqsEnabled" tabindex="110" id="<?php echo $this->_tpl_vars['fields']['assigned_user_name']['name']; ?>
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
" tabindex="110" title="<?php echo $this->_tpl_vars['APP']['LBL_SELECT_BUTTON_TITLE']; ?>
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
<?php echo '{"call_back_function":"set_return","form_name":"form_QuickCreate_Contacts","field_to_name_array":{"id":"assigned_user_id","user_name":"assigned_user_name"}}'; ?>
, 
"single", 
true
);' ><img src="<?php echo smarty_function_sugar_getimagepath(array('file' => "id-ff-select.png"), $this);?>
"></button><button type="button" name="btn_clr_<?php echo $this->_tpl_vars['fields']['assigned_user_name']['name']; ?>
" id="btn_clr_<?php echo $this->_tpl_vars['fields']['assigned_user_name']['name']; ?>
" tabindex="110" title="<?php echo $this->_tpl_vars['APP']['LBL_CLEAR_BUTTON_TITLE']; ?>
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
</table>
</div>
<?php if ($this->_tpl_vars['panelFieldCount'] == 0): ?>
<script>document.getElementById("DEFAULT").style.display='none';</script>
<?php endif; ?>
</div></div>

<div class="buttons">
<?php if ($this->_tpl_vars['bean']->aclAccess('save')): ?><input title="<?php echo $this->_tpl_vars['APP']['LBL_SAVE_BUTTON_TITLE']; ?>
" accessKey="<?php echo $this->_tpl_vars['APP']['LBL_SAVE_BUTTON_KEY']; ?>
" class="button primary" onclick="this.form.action.value='Popup';return check_form('form_QuickCreate_Contacts')" type="submit" name="Contacts_popupcreate_save_button" id="Contacts_popupcreate_save_button" value="<?php echo $this->_tpl_vars['APP']['LBL_SAVE_BUTTON_LABEL']; ?>
"><?php endif; ?> 
<input title="<?php echo $this->_tpl_vars['APP']['LBL_CANCEL_BUTTON_TITLE']; ?>
" accessKey="<?php echo $this->_tpl_vars['APP']['LBL_CANCEL_BUTTON_KEY']; ?>
" class="button" onclick="toggleDisplay('addform');return false;" name="Contacts_popup_cancel_button" type="submit"id="Contacts_popup_cancel_button" value="<?php echo $this->_tpl_vars['APP']['LBL_CANCEL_BUTTON_LABEL']; ?>
"> 
<?php if ($this->_tpl_vars['bean']->aclAccess('detail')):  if (! empty ( $this->_tpl_vars['fields']['id']['value'] ) && $this->_tpl_vars['isAuditEnabled']): ?><input title="<?php echo $this->_tpl_vars['APP']['LNK_VIEW_CHANGE_LOG']; ?>
" class="button" onclick='open_popup("Audit", "600", "400", "&record=<?php echo $this->_tpl_vars['fields']['id']['value']; ?>
&module_name=Contacts", true, false,  { "call_back_function":"set_return","form_name":"EditView","field_to_name_array":[] } ); return false;' type="submit" value="<?php echo $this->_tpl_vars['APP']['LNK_VIEW_CHANGE_LOG']; ?>
"><?php endif;  endif; ?>
</div>
</form>
<?php echo $this->_tpl_vars['set_focus_block']; ?>

<script type="text/javascript">
YAHOO.util.Event.onContentReady("form_QuickCreate_Accounts", 
    function () { initEditView(document.forms.form_QuickCreate_Contacts) });
//window.setTimeout(, 100);
window.onbeforeunload = function () { return onUnloadEditView(); };
</script><?php echo '
<script type="text/javascript">
addToValidate(\'form_QuickCreate_Contacts\', \'id\', \'id\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_ID','module' => 'Contacts'), $this); echo '\' );
addToValidate(\'form_QuickCreate_Contacts\', \'name\', \'name\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_NAME','module' => 'Contacts'), $this); echo '\' );
addToValidate(\'form_QuickCreate_Contacts\', \'date_entered_date\', \'date\', false,\'Date Created\' );
addToValidate(\'form_QuickCreate_Contacts\', \'date_modified_date\', \'date\', false,\'Date Modified\' );
addToValidate(\'form_QuickCreate_Contacts\', \'modified_user_id\', \'assigned_user_name\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_MODIFIED','module' => 'Contacts'), $this); echo '\' );
addToValidate(\'form_QuickCreate_Contacts\', \'modified_by_name\', \'relate\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_MODIFIED_NAME','module' => 'Contacts'), $this); echo '\' );
addToValidate(\'form_QuickCreate_Contacts\', \'created_by\', \'assigned_user_name\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_CREATED','module' => 'Contacts'), $this); echo '\' );
addToValidate(\'form_QuickCreate_Contacts\', \'created_by_name\', \'relate\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_CREATED','module' => 'Contacts'), $this); echo '\' );
addToValidate(\'form_QuickCreate_Contacts\', \'description\', \'text\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_DESCRIPTION','module' => 'Contacts'), $this); echo '\' );
addToValidate(\'form_QuickCreate_Contacts\', \'deleted\', \'bool\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_DELETED','module' => 'Contacts'), $this); echo '\' );
addToValidate(\'form_QuickCreate_Contacts\', \'assigned_user_id\', \'relate\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_ASSIGNED_TO_ID','module' => 'Contacts'), $this); echo '\' );
addToValidate(\'form_QuickCreate_Contacts\', \'assigned_user_name\', \'relate\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_ASSIGNED_TO_NAME','module' => 'Contacts'), $this); echo '\' );
addToValidate(\'form_QuickCreate_Contacts\', \'salutation\', \'enum\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_SALUTATION','module' => 'Contacts'), $this); echo '\' );
addToValidate(\'form_QuickCreate_Contacts\', \'first_name\', \'varchar\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_FIRST_NAME','module' => 'Contacts'), $this); echo '\' );
addToValidate(\'form_QuickCreate_Contacts\', \'last_name\', \'varchar\', true,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_LAST_NAME','module' => 'Contacts'), $this); echo '\' );
addToValidate(\'form_QuickCreate_Contacts\', \'full_name\', \'fullname\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_NAME','module' => 'Contacts'), $this); echo '\' );
addToValidate(\'form_QuickCreate_Contacts\', \'title\', \'varchar\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_TITLE','module' => 'Contacts'), $this); echo '\' );
addToValidate(\'form_QuickCreate_Contacts\', \'department\', \'varchar\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_DEPARTMENT','module' => 'Contacts'), $this); echo '\' );
addToValidate(\'form_QuickCreate_Contacts\', \'do_not_call\', \'bool\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_DO_NOT_CALL','module' => 'Contacts'), $this); echo '\' );
addToValidate(\'form_QuickCreate_Contacts\', \'phone_home\', \'phone\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_HOME_PHONE','module' => 'Contacts'), $this); echo '\' );
addToValidate(\'form_QuickCreate_Contacts\', \'phone_mobile\', \'phone\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_MOBILE_PHONE','module' => 'Contacts'), $this); echo '\' );
addToValidate(\'form_QuickCreate_Contacts\', \'phone_work\', \'phone\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_OFFICE_PHONE','module' => 'Contacts'), $this); echo '\' );
addToValidate(\'form_QuickCreate_Contacts\', \'phone_other\', \'phone\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_OTHER_PHONE','module' => 'Contacts'), $this); echo '\' );
addToValidate(\'form_QuickCreate_Contacts\', \'phone_fax\', \'phone\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_FAX_PHONE','module' => 'Contacts'), $this); echo '\' );
addToValidate(\'form_QuickCreate_Contacts\', \'email1\', \'varchar\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_EMAIL_ADDRESS','module' => 'Contacts'), $this); echo '\' );
addToValidate(\'form_QuickCreate_Contacts\', \'email2\', \'varchar\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_OTHER_EMAIL_ADDRESS','module' => 'Contacts'), $this); echo '\' );
addToValidate(\'form_QuickCreate_Contacts\', \'invalid_email\', \'bool\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_INVALID_EMAIL','module' => 'Contacts'), $this); echo '\' );
addToValidate(\'form_QuickCreate_Contacts\', \'email_opt_out\', \'bool\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_EMAIL_OPT_OUT','module' => 'Contacts'), $this); echo '\' );
addToValidate(\'form_QuickCreate_Contacts\', \'primary_address_street\', \'varchar\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_PRIMARY_ADDRESS_STREET','module' => 'Contacts'), $this); echo '\' );
addToValidate(\'form_QuickCreate_Contacts\', \'primary_address_street_2\', \'varchar\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_PRIMARY_ADDRESS_STREET_2','module' => 'Contacts'), $this); echo '\' );
addToValidate(\'form_QuickCreate_Contacts\', \'primary_address_street_3\', \'varchar\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_PRIMARY_ADDRESS_STREET_3','module' => 'Contacts'), $this); echo '\' );
addToValidate(\'form_QuickCreate_Contacts\', \'primary_address_city\', \'varchar\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_PRIMARY_ADDRESS_CITY','module' => 'Contacts'), $this); echo '\' );
addToValidate(\'form_QuickCreate_Contacts\', \'primary_address_state\', \'varchar\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_PRIMARY_ADDRESS_STATE','module' => 'Contacts'), $this); echo '\' );
addToValidate(\'form_QuickCreate_Contacts\', \'primary_address_postalcode\', \'varchar\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_PRIMARY_ADDRESS_POSTALCODE','module' => 'Contacts'), $this); echo '\' );
addToValidate(\'form_QuickCreate_Contacts\', \'primary_address_country\', \'varchar\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_PRIMARY_ADDRESS_COUNTRY','module' => 'Contacts'), $this); echo '\' );
addToValidate(\'form_QuickCreate_Contacts\', \'alt_address_street\', \'varchar\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_ALT_ADDRESS_STREET','module' => 'Contacts'), $this); echo '\' );
addToValidate(\'form_QuickCreate_Contacts\', \'alt_address_street_2\', \'varchar\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_ALT_ADDRESS_STREET_2','module' => 'Contacts'), $this); echo '\' );
addToValidate(\'form_QuickCreate_Contacts\', \'alt_address_street_3\', \'varchar\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_ALT_ADDRESS_STREET_3','module' => 'Contacts'), $this); echo '\' );
addToValidate(\'form_QuickCreate_Contacts\', \'alt_address_city\', \'varchar\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_ALT_ADDRESS_CITY','module' => 'Contacts'), $this); echo '\' );
addToValidate(\'form_QuickCreate_Contacts\', \'alt_address_state\', \'varchar\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_ALT_ADDRESS_STATE','module' => 'Contacts'), $this); echo '\' );
addToValidate(\'form_QuickCreate_Contacts\', \'alt_address_postalcode\', \'varchar\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_ALT_ADDRESS_POSTALCODE','module' => 'Contacts'), $this); echo '\' );
addToValidate(\'form_QuickCreate_Contacts\', \'alt_address_country\', \'varchar\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_ALT_ADDRESS_COUNTRY','module' => 'Contacts'), $this); echo '\' );
addToValidate(\'form_QuickCreate_Contacts\', \'assistant\', \'varchar\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_ASSISTANT','module' => 'Contacts'), $this); echo '\' );
addToValidate(\'form_QuickCreate_Contacts\', \'assistant_phone\', \'phone\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_ASSISTANT_PHONE','module' => 'Contacts'), $this); echo '\' );
addToValidate(\'form_QuickCreate_Contacts\', \'email_and_name1\', \'varchar\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_NAME','module' => 'Contacts'), $this); echo '\' );
addToValidate(\'form_QuickCreate_Contacts\', \'lead_source\', \'enum\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_LEAD_SOURCE','module' => 'Contacts'), $this); echo '\' );
addToValidate(\'form_QuickCreate_Contacts\', \'account_name\', \'relate\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_ACCOUNT_NAME','module' => 'Contacts'), $this); echo '\' );
addToValidate(\'form_QuickCreate_Contacts\', \'account_id\', \'relate\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_ACCOUNT_ID','module' => 'Contacts'), $this); echo '\' );
addToValidate(\'form_QuickCreate_Contacts\', \'opportunity_role_fields\', \'relate\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_ACCOUNT_NAME','module' => 'Contacts'), $this); echo '\' );
addToValidate(\'form_QuickCreate_Contacts\', \'opportunity_role_id\', \'varchar\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_OPPORTUNITY_ROLE_ID','module' => 'Contacts'), $this); echo '\' );
addToValidate(\'form_QuickCreate_Contacts\', \'opportunity_role\', \'enum\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_OPPORTUNITY_ROLE','module' => 'Contacts'), $this); echo '\' );
addToValidate(\'form_QuickCreate_Contacts\', \'reports_to_id\', \'id\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_REPORTS_TO_ID','module' => 'Contacts'), $this); echo '\' );
addToValidate(\'form_QuickCreate_Contacts\', \'report_to_name\', \'relate\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_REPORTS_TO','module' => 'Contacts'), $this); echo '\' );
addToValidate(\'form_QuickCreate_Contacts\', \'birthdate\', \'date\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_BIRTHDATE','module' => 'Contacts'), $this); echo '\' );
addToValidate(\'form_QuickCreate_Contacts\', \'campaign_id\', \'id\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_CAMPAIGN_ID','module' => 'Contacts'), $this); echo '\' );
addToValidate(\'form_QuickCreate_Contacts\', \'campaign_name\', \'relate\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_CAMPAIGN','module' => 'Contacts'), $this); echo '\' );
addToValidate(\'form_QuickCreate_Contacts\', \'c_accept_status_fields\', \'relate\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_LIST_ACCEPT_STATUS','module' => 'Contacts'), $this); echo '\' );
addToValidate(\'form_QuickCreate_Contacts\', \'m_accept_status_fields\', \'relate\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_LIST_ACCEPT_STATUS','module' => 'Contacts'), $this); echo '\' );
addToValidate(\'form_QuickCreate_Contacts\', \'accept_status_id\', \'varchar\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_LIST_ACCEPT_STATUS','module' => 'Contacts'), $this); echo '\' );
addToValidate(\'form_QuickCreate_Contacts\', \'accept_status_name\', \'enum\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_LIST_ACCEPT_STATUS','module' => 'Contacts'), $this); echo '\' );
addToValidate(\'form_QuickCreate_Contacts\', \'sync_contact\', \'bool\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_SYNC_CONTACT','module' => 'Contacts'), $this); echo '\' );
addToValidateBinaryDependency(\'form_QuickCreate_Contacts\', \'assigned_user_name\', \'alpha\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'ERR_SQS_NO_MATCH_FIELD','module' => 'Contacts'), $this); echo ': ';  echo smarty_function_sugar_translate(array('label' => 'LBL_ASSIGNED_TO','module' => 'Contacts'), $this); echo '\', \'assigned_user_id\' );
addToValidateBinaryDependency(\'form_QuickCreate_Contacts\', \'account_name\', \'alpha\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'ERR_SQS_NO_MATCH_FIELD','module' => 'Contacts'), $this); echo ': ';  echo smarty_function_sugar_translate(array('label' => 'LBL_ACCOUNT_NAME','module' => 'Contacts'), $this); echo '\', \'account_id\' );
</script><script language="javascript">if(typeof sqs_objects == \'undefined\'){var sqs_objects = new Array;}sqs_objects[\'form_QuickCreate_Contacts_account_name\']={"form":"form_QuickCreate_Contacts","method":"query","modules":["Accounts"],"group":"or","field_list":["name","id"],"populate_list":["form_QuickCreate_Contacts_account_name","account_id"],"conditions":[{"name":"name","op":"like_custom","end":"%","value":""}],"required_list":["account_id"],"order":"name","limit":"30","no_match_text":"No Match"};sqs_objects[\'form_QuickCreate_Contacts_assigned_user_name\']={"form":"form_QuickCreate_Contacts","method":"get_user_array","field_list":["user_name","id"],"populate_list":["assigned_user_name","assigned_user_id"],"required_list":["assigned_user_id"],"conditions":[{"name":"user_name","op":"like_custom","end":"%","value":""}],"limit":"30","no_match_text":"No Match"};</script>'; ?>