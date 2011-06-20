<?php /* Smarty version 2.6.11, created on 2011-06-17 11:18:51
         compiled from cache/modules/Notes/form_SubpanelQuickCreate_Notes.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'sugar_include', 'cache/modules/Notes/form_SubpanelQuickCreate_Notes.tpl', 37, false),array('function', 'counter', 'cache/modules/Notes/form_SubpanelQuickCreate_Notes.tpl', 42, false),array('function', 'sugar_translate', 'cache/modules/Notes/form_SubpanelQuickCreate_Notes.tpl', 47, false),array('function', 'sugar_getimagepath', 'cache/modules/Notes/form_SubpanelQuickCreate_Notes.tpl', 70, false),array('function', 'html_options', 'cache/modules/Notes/form_SubpanelQuickCreate_Notes.tpl', 94, false),array('modifier', 'default', 'cache/modules/Notes/form_SubpanelQuickCreate_Notes.tpl', 43, false),array('modifier', 'strip_semicolon', 'cache/modules/Notes/form_SubpanelQuickCreate_Notes.tpl', 49, false),)), $this); ?>


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
" class="button" onclick="this.form.action.value='Save';if(check_form('form_SubpanelQuickCreate_Notes'))return SUGAR.subpanelUtils.inlineSave(this.form.id, 'Notes_subpanel_save_button');return false;" type="submit" name="Notes_subpanel_save_button" id="Notes_subpanel_save_button" value="<?php echo $this->_tpl_vars['APP']['LBL_SAVE_BUTTON_LABEL']; ?>
"><?php endif; ?> 
<input title="<?php echo $this->_tpl_vars['APP']['LBL_CANCEL_BUTTON_TITLE']; ?>
" accessKey="<?php echo $this->_tpl_vars['APP']['LBL_CANCEL_BUTTON_KEY']; ?>
" class="button" onclick="return SUGAR.subpanelUtils.cancelCreate('Notes_subpanel_cancel_button');return false;" type="submit" name="Notes_subpanel_cancel_button" id="Notes_subpanel_cancel_button" value="<?php echo $this->_tpl_vars['APP']['LBL_CANCEL_BUTTON_LABEL']; ?>
"> 
<input title="<?php echo $this->_tpl_vars['APP']['LBL_FULL_FORM_BUTTON_TITLE']; ?>
" accessKey="<?php echo $this->_tpl_vars['APP']['LBL_FULL_FORM_BUTTON_KEY']; ?>
" class="button" onclick="disableOnUnloadEditView(this.form); this.form.return_action.value='DetailView'; this.form.action.value='EditView'; if(typeof(this.form.to_pdf)!='undefined') this.form.to_pdf.value='0';" type="submit" name="Notes_subpanel_full_form_button" id="Notes_subpanel_full_form_button" value="<?php echo $this->_tpl_vars['APP']['LBL_FULL_FORM_BUTTON_LABEL']; ?>
"> <input type="hidden" name="full_form" value="full_form">
<?php if ($this->_tpl_vars['bean']->aclAccess('detail')):  if (! empty ( $this->_tpl_vars['fields']['id']['value'] ) && $this->_tpl_vars['isAuditEnabled']): ?><input title="<?php echo $this->_tpl_vars['APP']['LNK_VIEW_CHANGE_LOG']; ?>
" class="button" onclick='open_popup("Audit", "600", "400", "&record=<?php echo $this->_tpl_vars['fields']['id']['value']; ?>
&module_name=Notes", true, false,  { "call_back_function":"set_return","form_name":"EditView","field_to_name_array":[] } ); return false;' type="submit" value="<?php echo $this->_tpl_vars['APP']['LNK_VIEW_CHANGE_LOG']; ?>
"><?php endif;  endif; ?>
</td>
<td align='right'>
<?php echo $this->_tpl_vars['PAGINATION']; ?>

</td>
</tr>
</table><?php echo smarty_function_sugar_include(array('include' => $this->_tpl_vars['includes']), $this);?>

<div id="form_SubpanelQuickCreate_Notes_tabs" 
>
<div >
<div id="DEFAULT">
<?php echo smarty_function_counter(array('name' => 'panelFieldCount','start' => 0,'print' => false,'assign' => 'panelFieldCount'), $this);?>

<table width="100%" border="0" cellspacing="1" cellpadding="0"  class="<?php echo ((is_array($_tmp=@$this->_tpl_vars['def']['templateMeta']['panelClass'])) ? $this->_run_mod_handler('default', true, $_tmp, 'edit view') : smarty_modifier_default($_tmp, 'edit view')); ?>
">
<tr>
<td valign="top" id='contact_name_label' width='12.5%' scope="row">
<?php ob_start();  echo smarty_function_sugar_translate(array('label' => 'LBL_CONTACT_NAME','module' => 'Notes'), $this);?>

<?php $this->_smarty_vars['capture']['label'] = ob_get_contents();  $this->assign('label', ob_get_contents());ob_end_clean();  echo ((is_array($_tmp=$this->_tpl_vars['label'])) ? $this->_run_mod_handler('strip_semicolon', true, $_tmp) : smarty_modifier_strip_semicolon($_tmp)); ?>
:
</td>
<td valign="top" width='37.5%' >
<?php echo smarty_function_counter(array('name' => 'panelFieldCount'), $this);?>


<input type="text" name="<?php echo $this->_tpl_vars['fields']['contact_name']['name']; ?>
" class="sqsEnabled" tabindex="100" id="<?php echo $this->_tpl_vars['fields']['contact_name']['name']; ?>
" size="" value="<?php echo $this->_tpl_vars['fields']['contact_name']['value']; ?>
" title='' autocomplete="off"  >
<input type="hidden" name="<?php echo $this->_tpl_vars['fields']['contact_name']['id_name']; ?>
" 
id="<?php echo $this->_tpl_vars['fields']['contact_name']['id_name']; ?>
" 
value="<?php echo $this->_tpl_vars['fields']['contact_id']['value']; ?>
">
<span class="id-ff multiple">
<button type="button" name="btn_<?php echo $this->_tpl_vars['fields']['contact_name']['name']; ?>
" id="btn_<?php echo $this->_tpl_vars['fields']['contact_name']['name']; ?>
" tabindex="100" title="<?php echo $this->_tpl_vars['APP']['LBL_SELECT_BUTTON_TITLE']; ?>
" accessKey="<?php echo $this->_tpl_vars['APP']['LBL_SELECT_BUTTON_KEY']; ?>
" class="button firstChild" value="<?php echo $this->_tpl_vars['APP']['LBL_SELECT_BUTTON_LABEL']; ?>
" 
onclick='open_popup(
"<?php echo $this->_tpl_vars['fields']['contact_name']['module']; ?>
", 
600, 
400, 
"", 
true, 
false, 
<?php echo '{"call_back_function":"set_return","form_name":"form_SubpanelQuickCreate_Notes","field_to_name_array":{"id":"contact_id","last_name":"contact_name"}}'; ?>
, 
"single", 
true
);' ><img src="<?php echo smarty_function_sugar_getimagepath(array('file' => "id-ff-select.png"), $this);?>
"></button><button type="button" name="btn_clr_<?php echo $this->_tpl_vars['fields']['contact_name']['name']; ?>
" id="btn_clr_<?php echo $this->_tpl_vars['fields']['contact_name']['name']; ?>
" tabindex="100" title="<?php echo $this->_tpl_vars['APP']['LBL_CLEAR_BUTTON_TITLE']; ?>
" accessKey="<?php echo $this->_tpl_vars['APP']['LBL_CLEAR_BUTTON_KEY']; ?>
" class="button lastChild" 
onclick="this.form.<?php echo $this->_tpl_vars['fields']['contact_name']['name']; ?>
.value = ''; this.form.<?php echo $this->_tpl_vars['fields']['contact_name']['id_name']; ?>
.value = '';" 
value="<?php echo $this->_tpl_vars['APP']['LBL_CLEAR_BUTTON_LABEL']; ?>
" ><img src="<?php echo smarty_function_sugar_getimagepath(array('file' => "id-ff-clear.png"), $this);?>
"></button>
</span>
<script type="text/javascript">
<!--
if(typeof QSProcessedFieldsArray != 'undefined') 
	QSProcessedFieldsArray["<?php echo $this->_tpl_vars['form_name']; ?>
_<?php echo $this->_tpl_vars['fields']['contact_name']['name']; ?>
"] = false;
	

enableQS(false);
-->	
</script>
<td valign="top" id='parent_name_label' width='12.5%' scope="row">
<?php ob_start();  echo smarty_function_sugar_translate(array('label' => 'LBL_RELATED_TO','module' => 'Notes'), $this);?>

<?php $this->_smarty_vars['capture']['label'] = ob_get_contents();  $this->assign('label', ob_get_contents());ob_end_clean();  echo ((is_array($_tmp=$this->_tpl_vars['label'])) ? $this->_run_mod_handler('strip_semicolon', true, $_tmp) : smarty_modifier_strip_semicolon($_tmp)); ?>
:
</td>
<td valign="top" width='37.5%' >
<?php echo smarty_function_counter(array('name' => 'panelFieldCount'), $this);?>


<select name='parent_type' tabindex="101" id='parent_type' title='' 
onchange='document.<?php echo $this->_tpl_vars['form_name']; ?>
.<?php echo $this->_tpl_vars['fields']['parent_name']['name']; ?>
.value="";document.<?php echo $this->_tpl_vars['form_name']; ?>
.parent_id.value=""; <?php echo $this->_tpl_vars['fields']['parent_name']['name']; ?>
changeQS(); checkParentType(document.<?php echo $this->_tpl_vars['form_name']; ?>
.parent_type.value, document.<?php echo $this->_tpl_vars['form_name']; ?>
.btn_<?php echo $this->_tpl_vars['fields']['parent_name']['name']; ?>
);'>
<?php echo smarty_function_html_options(array('options' => $this->_tpl_vars['fields']['parent_name']['options'],'selected' => $this->_tpl_vars['fields']['parent_type']['value'],'sortoptions' => true), $this);?>

</select>
<?php if (empty ( $this->_tpl_vars['fields']['parent_name']['options'][$this->_tpl_vars['fields']['parent_type']['value']] )):  $this->assign('keepParent', 0);  else:  $this->assign('keepParent', 1);  endif; ?>
<input type="text" name="<?php echo $this->_tpl_vars['fields']['parent_name']['name']; ?>
" id="<?php echo $this->_tpl_vars['fields']['parent_name']['name']; ?>
" class="sqsEnabled" tabindex="101" 
size="" <?php if ($this->_tpl_vars['keepParent']): ?>value="<?php echo $this->_tpl_vars['fields']['parent_name']['value']; ?>
"<?php endif; ?> autocomplete="off"><input type="hidden" name="<?php echo $this->_tpl_vars['fields']['parent_id']['name']; ?>
" id="<?php echo $this->_tpl_vars['fields']['parent_id']['name']; ?>
"  
<?php if ($this->_tpl_vars['keepParent']): ?>value="<?php echo $this->_tpl_vars['fields']['parent_id']['value']; ?>
"<?php endif; ?>>
<span class="id-ff multiple">
<button type="button" name="btn_<?php echo $this->_tpl_vars['fields']['parent_name']['name']; ?>
" id="btn_<?php echo $this->_tpl_vars['fields']['parent_name']['name']; ?>
" tabindex="101" 
title="<?php echo $this->_tpl_vars['APP']['LBL_SELECT_BUTTON_TITLE']; ?>
" accessKey="<?php echo $this->_tpl_vars['APP']['LBL_SELECT_BUTTON_KEY']; ?>
" class="button firstChild" value="<?php echo $this->_tpl_vars['APP']['LBL_SELECT_BUTTON_LABEL']; ?>
" 
onclick='open_popup(document.<?php echo $this->_tpl_vars['form_name']; ?>
.parent_type.value, 600, 400, "", true, false, <?php echo '{"call_back_function":"set_return","form_name":"form_SubpanelQuickCreate_Notes","field_to_name_array":{"id":"parent_id","name":"parent_name"}}'; ?>
, "single", true);' ><img src="<?php echo smarty_function_sugar_getimagepath(array('file' => "id-ff-select.png"), $this);?>
"></button><button type="button" name="btn_clr_<?php echo $this->_tpl_vars['fields']['parent_name']['name']; ?>
" id="btn_clr_<?php echo $this->_tpl_vars['fields']['parent_name']['name']; ?>
" tabindex="101" title="<?php echo $this->_tpl_vars['APP']['LBL_CLEAR_BUTTON_TITLE']; ?>
" accessKey="<?php echo $this->_tpl_vars['APP']['LBL_CLEAR_BUTTON_KEY']; ?>
" class="button lastChild" onclick="this.form.<?php echo $this->_tpl_vars['fields']['parent_name']['name']; ?>
.value = ''; this.form.<?php echo $this->_tpl_vars['fields']['parent_id']['name']; ?>
.value = '';" value="<?php echo $this->_tpl_vars['APP']['LBL_CLEAR_BUTTON_LABEL']; ?>
" ><img src="<?php echo smarty_function_sugar_getimagepath(array('file' => "id-ff-clear.png"), $this);?>
"></button>
</span>
<script type="text/javascript">
function <?php echo $this->_tpl_vars['fields']['parent_name']['name']; ?>
changeQS() <?php echo '{
'; ?>

	new_module = document.forms["<?php echo $this->_tpl_vars['form_name']; ?>
"].elements["parent_type"].value;
<?php echo '
	if(typeof(disabledModules[new_module]) != \'undefined\') {
'; ?>

		sqs_objects["<?php echo $this->_tpl_vars['form_name']; ?>
_parent_name"]["disable"] = true;
		document.forms["<?php echo $this->_tpl_vars['form_name']; ?>
"].elements["parent_name"].readOnly = true;
<?php echo '
	} else {
'; ?>

		sqs_objects["<?php echo $this->_tpl_vars['form_name']; ?>
_parent_name"]["disable"] = false;
		document.forms["<?php echo $this->_tpl_vars['form_name']; ?>
"].elements["parent_name"].readOnly = false;
<?php echo '
	}
'; ?>

	sqs_objects["<?php echo $this->_tpl_vars['form_name']; ?>
_parent_name"]["modules"] = new Array(new_module);
	if(typeof QSProcessedFieldsArray != 'undefined')
<?php echo '
    {
'; ?>

	   QSProcessedFieldsArray["<?php echo $this->_tpl_vars['form_name']; ?>
_parent_name"] = false;
<?php echo '
	}	
'; ?>
    
    enableQS(false);
<?php echo '
}
'; ?>

</script>
<?php echo '
<script>var disabledModules=[];</script>
'; ?>

<?php echo '
<script language="javascript">if(typeof sqs_objects == \'undefined\'){var sqs_objects = new Array;}sqs_objects[\'form_SubpanelQuickCreate_Notes_parent_name\']={"form":"form_SubpanelQuickCreate_Notes","method":"query","modules":["';  if (! empty ( $this->_tpl_vars['fields']['parent_type']['value'] )):  echo $this->_tpl_vars['fields']['parent_type']['value'];  else: ?>Accounts<?php endif;  echo '"],"group":"or","field_list":["name","id"],"populate_list":["parent_name","parent_id"],"required_list":["parent_id"],"conditions":[{"name":"name","op":"like_custom","end":"%","value":""}],"order":"name","limit":"30","no_match_text":"No Match"};</script>
'; ?>

</tr>
<tr>
<td valign="top" id='name_label' width='12.5%' scope="row">
<?php ob_start();  echo smarty_function_sugar_translate(array('label' => 'LBL_SUBJECT','module' => 'Notes'), $this);?>

<?php $this->_smarty_vars['capture']['label'] = ob_get_contents();  $this->assign('label', ob_get_contents());ob_end_clean();  echo ((is_array($_tmp=$this->_tpl_vars['label'])) ? $this->_run_mod_handler('strip_semicolon', true, $_tmp) : smarty_modifier_strip_semicolon($_tmp)); ?>
:
<span class="required">*</span>
</td>
<td valign="top" width='37.5%' colspan='3'>
<?php echo smarty_function_counter(array('name' => 'panelFieldCount'), $this);?>


<?php if (strlen ( $this->_tpl_vars['fields']['name']['value'] ) <= 0):  $this->assign('value', $this->_tpl_vars['fields']['name']['default_value']);  else:  $this->assign('value', $this->_tpl_vars['fields']['name']['value']);  endif; ?>  
<input type='text' name='<?php echo $this->_tpl_vars['fields']['name']['name']; ?>
' 
id='<?php echo $this->_tpl_vars['fields']['name']['name']; ?>
' size='100' 
maxlength='255' 
value='<?php echo $this->_tpl_vars['value']; ?>
' title='' tabindex='102' > 
</tr>
<tr>
<td valign="top" id='filename_label' width='12.5%' scope="row">
<?php ob_start();  echo smarty_function_sugar_translate(array('label' => 'LBL_FILENAME','module' => 'Notes'), $this);?>

<?php $this->_smarty_vars['capture']['label'] = ob_get_contents();  $this->assign('label', ob_get_contents());ob_end_clean();  echo ((is_array($_tmp=$this->_tpl_vars['label'])) ? $this->_run_mod_handler('strip_semicolon', true, $_tmp) : smarty_modifier_strip_semicolon($_tmp)); ?>
:
</td>
<td valign="top" width='37.5%' colspan='3'>
<?php echo smarty_function_counter(array('name' => 'panelFieldCount'), $this);?>

<span id='new_attachment' style='display:<?php if (! empty ( $this->_tpl_vars['fields']['filename']['value'] )): ?>none<?php endif; ?>'>
<input tabindex="103"  name="uploadfile" tabindex="3" type="file" size="60"/>
</span>
<span id='old_attachment' style='display:<?php if (empty ( $this->_tpl_vars['fields']['filename']['value'] )): ?>none<?php endif; ?>'>
<input tabindex="103"  type='hidden' name='deleteAttachment' value='0'>
<?php echo $this->_tpl_vars['fields']['filename']['value']; ?>
<input tabindex="103"  type='hidden' name='old_filename' value='<?php echo $this->_tpl_vars['fields']['filename']['value']; ?>
'/><input tabindex="103"  type='hidden' name='old_id' value='<?php echo $this->_tpl_vars['fields']['id']['value']; ?>
'/>
<input tabindex="103"  type='button' class='button' value='<?php echo $this->_tpl_vars['APP']['LBL_REMOVE']; ?>
' onclick='ajaxStatus.showStatus(SUGAR.language.get("Notes", "LBL_REMOVING_ATTACHMENT"));this.form.deleteAttachment.value=1;this.form.action.value="EditView";SUGAR.dashlets.postForm(this.form, deleteAttachmentCallBack);this.form.deleteAttachment.value=0;this.form.action.value="";' >       
</span>
</tr>
<tr>
<td valign="top" id='description_label' width='12.5%' scope="row">
<?php ob_start();  echo smarty_function_sugar_translate(array('label' => 'LBL_NOTE_STATUS','module' => 'Notes'), $this);?>

<?php $this->_smarty_vars['capture']['label'] = ob_get_contents();  $this->assign('label', ob_get_contents());ob_end_clean();  echo ((is_array($_tmp=$this->_tpl_vars['label'])) ? $this->_run_mod_handler('strip_semicolon', true, $_tmp) : smarty_modifier_strip_semicolon($_tmp)); ?>
:
</td>
<td valign="top" width='37.5%' colspan='3'>
<?php echo smarty_function_counter(array('name' => 'panelFieldCount'), $this);?>


<?php if (empty ( $this->_tpl_vars['fields']['description']['value'] )):  $this->assign('value', $this->_tpl_vars['fields']['description']['default_value']);  else:  $this->assign('value', $this->_tpl_vars['fields']['description']['value']);  endif; ?>  
<textarea  id='<?php echo $this->_tpl_vars['fields']['description']['name']; ?>
' name='<?php echo $this->_tpl_vars['fields']['description']['name']; ?>
'
rows="6" 
cols="75" 
title='' tabindex="104" ><?php echo $this->_tpl_vars['value']; ?>
</textarea>
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
" class="button" onclick="this.form.action.value='Save';if(check_form('form_SubpanelQuickCreate_Notes'))return SUGAR.subpanelUtils.inlineSave(this.form.id, 'Notes_subpanel_save_button');return false;" type="submit" name="Notes_subpanel_save_button" id="Notes_subpanel_save_button" value="<?php echo $this->_tpl_vars['APP']['LBL_SAVE_BUTTON_LABEL']; ?>
"><?php endif; ?> 
<input title="<?php echo $this->_tpl_vars['APP']['LBL_CANCEL_BUTTON_TITLE']; ?>
" accessKey="<?php echo $this->_tpl_vars['APP']['LBL_CANCEL_BUTTON_KEY']; ?>
" class="button" onclick="return SUGAR.subpanelUtils.cancelCreate('Notes_subpanel_cancel_button');return false;" type="submit" name="Notes_subpanel_cancel_button" id="Notes_subpanel_cancel_button" value="<?php echo $this->_tpl_vars['APP']['LBL_CANCEL_BUTTON_LABEL']; ?>
"> 
<input title="<?php echo $this->_tpl_vars['APP']['LBL_FULL_FORM_BUTTON_TITLE']; ?>
" accessKey="<?php echo $this->_tpl_vars['APP']['LBL_FULL_FORM_BUTTON_KEY']; ?>
" class="button" onclick="disableOnUnloadEditView(this.form); this.form.return_action.value='DetailView'; this.form.action.value='EditView'; if(typeof(this.form.to_pdf)!='undefined') this.form.to_pdf.value='0';" type="submit" name="Notes_subpanel_full_form_button" id="Notes_subpanel_full_form_button" value="<?php echo $this->_tpl_vars['APP']['LBL_FULL_FORM_BUTTON_LABEL']; ?>
"> <input type="hidden" name="full_form" value="full_form">
<?php if ($this->_tpl_vars['bean']->aclAccess('detail')):  if (! empty ( $this->_tpl_vars['fields']['id']['value'] ) && $this->_tpl_vars['isAuditEnabled']): ?><input title="<?php echo $this->_tpl_vars['APP']['LNK_VIEW_CHANGE_LOG']; ?>
" class="button" onclick='open_popup("Audit", "600", "400", "&record=<?php echo $this->_tpl_vars['fields']['id']['value']; ?>
&module_name=Notes", true, false,  { "call_back_function":"set_return","form_name":"EditView","field_to_name_array":[] } ); return false;' type="submit" value="<?php echo $this->_tpl_vars['APP']['LNK_VIEW_CHANGE_LOG']; ?>
"><?php endif;  endif; ?>
</div>
</form>
<?php echo $this->_tpl_vars['set_focus_block']; ?>

<!-- Begin Meta-Data Javascript -->
<script type="text/javascript" src="include/javascript/dashlets.js?s=<?php echo $this->_tpl_vars['SUGAR_VERSION']; ?>
&c=<?php echo $this->_tpl_vars['JS_CUSTOM_VERSION']; ?>
"></script>
<script>
function deleteAttachmentCallBack(text) 
<?php echo ' { '; ?>
 
if(text == 'true') <?php echo ' { '; ?>
 
document.getElementById('new_attachment').style.display = '';
ajaxStatus.hideStatus();
document.getElementById('old_attachment').innerHTML = ''; 
<?php echo ' } '; ?>
 else <?php echo ' { '; ?>
 
document.getElementById('new_attachment').style.display = 'none';
ajaxStatus.flashStatus(SUGAR.language.get('Notes', 'ERR_REMOVING_ATTACHMENT'), 2000); 
<?php echo ' } '; ?>
  
<?php echo ' } '; ?>
 
</script>
<script>toggle_portal_flag(); function toggle_portal_flag()  <?php echo ' { '; ?>
 <?php echo $this->_tpl_vars['TOGGLE_JS']; ?>
 <?php echo ' } '; ?>
 </script>
<!-- End Meta-Data Javascript -->
<script type="text/javascript">
YAHOO.util.Event.onContentReady("form_QuickCreate_Accounts", 
    function () { initEditView(document.forms.form_SubpanelQuickCreate_Notes) });
//window.setTimeout(, 100);
window.onbeforeunload = function () { return onUnloadEditView(); };
</script><?php echo '
<script type="text/javascript">
addToValidate(\'form_SubpanelQuickCreate_Notes\', \'assigned_user_id\', \'relate\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_ASSIGNED_TO_ID','module' => 'Notes'), $this); echo '\' );
addToValidate(\'form_SubpanelQuickCreate_Notes\', \'assigned_user_name\', \'relate\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_ASSIGNED_TO_NAME','module' => 'Notes'), $this); echo '\' );
addToValidate(\'form_SubpanelQuickCreate_Notes\', \'id\', \'id\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_ID','module' => 'Notes'), $this); echo '\' );
addToValidate(\'form_SubpanelQuickCreate_Notes\', \'date_entered_date\', \'date\', false,\'Date Created\' );
addToValidate(\'form_SubpanelQuickCreate_Notes\', \'date_modified_date\', \'date\', false,\'Date Modified\' );
addToValidate(\'form_SubpanelQuickCreate_Notes\', \'modified_user_id\', \'assigned_user_name\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_MODIFIED','module' => 'Notes'), $this); echo '\' );
addToValidate(\'form_SubpanelQuickCreate_Notes\', \'modified_by_name\', \'relate\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_MODIFIED_BY','module' => 'Notes'), $this); echo '\' );
addToValidate(\'form_SubpanelQuickCreate_Notes\', \'created_by\', \'assigned_user_name\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_CREATED_BY','module' => 'Notes'), $this); echo '\' );
addToValidate(\'form_SubpanelQuickCreate_Notes\', \'created_by_name\', \'relate\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_CREATED_BY','module' => 'Notes'), $this); echo '\' );
addToValidate(\'form_SubpanelQuickCreate_Notes\', \'name\', \'name\', true,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_NOTE_SUBJECT','module' => 'Notes'), $this); echo '\' );
addToValidate(\'form_SubpanelQuickCreate_Notes\', \'filename\', \'varchar\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_FILENAME','module' => 'Notes'), $this); echo '\' );
addToValidate(\'form_SubpanelQuickCreate_Notes\', \'file_mime_type\', \'varchar\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_FILE_MIME_TYPE','module' => 'Notes'), $this); echo '\' );
addToValidate(\'form_SubpanelQuickCreate_Notes\', \'file_url\', \'function\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_FILE_URL','module' => 'Notes'), $this); echo '\' );
addToValidate(\'form_SubpanelQuickCreate_Notes\', \'parent_type\', \'parent_type\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_PARENT_TYPE','module' => 'Notes'), $this); echo '\' );
addToValidate(\'form_SubpanelQuickCreate_Notes\', \'parent_id\', \'id\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_PARENT_ID','module' => 'Notes'), $this); echo '\' );
addToValidate(\'form_SubpanelQuickCreate_Notes\', \'contact_id\', \'id\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_CONTACT_ID','module' => 'Notes'), $this); echo '\' );
addToValidate(\'form_SubpanelQuickCreate_Notes\', \'portal_flag\', \'bool\', true,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_PORTAL_FLAG','module' => 'Notes'), $this); echo '\' );
addToValidate(\'form_SubpanelQuickCreate_Notes\', \'embed_flag\', \'bool\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_EMBED_FLAG','module' => 'Notes'), $this); echo '\' );
addToValidate(\'form_SubpanelQuickCreate_Notes\', \'description\', \'text\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_DESCRIPTION','module' => 'Notes'), $this); echo '\' );
addToValidate(\'form_SubpanelQuickCreate_Notes\', \'deleted\', \'bool\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_DELETED','module' => 'Notes'), $this); echo '\' );
addToValidate(\'form_SubpanelQuickCreate_Notes\', \'parent_name\', \'parent\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_RELATED_TO','module' => 'Notes'), $this); echo '\' );
addToValidate(\'form_SubpanelQuickCreate_Notes\', \'contact_name\', \'relate\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_CONTACT_NAME','module' => 'Notes'), $this); echo '\' );
addToValidate(\'form_SubpanelQuickCreate_Notes\', \'contact_phone\', \'phone\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_PHONE','module' => 'Notes'), $this); echo '\' );
addToValidate(\'form_SubpanelQuickCreate_Notes\', \'contact_email\', \'varchar\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_EMAIL_ADDRESS','module' => 'Notes'), $this); echo '\' );
addToValidate(\'form_SubpanelQuickCreate_Notes\', \'account_id\', \'id\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_ACCOUNT_ID','module' => 'Notes'), $this); echo '\' );
addToValidate(\'form_SubpanelQuickCreate_Notes\', \'opportunity_id\', \'id\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_OPPORTUNITY_ID','module' => 'Notes'), $this); echo '\' );
addToValidate(\'form_SubpanelQuickCreate_Notes\', \'acase_id\', \'id\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_CASE_ID','module' => 'Notes'), $this); echo '\' );
addToValidate(\'form_SubpanelQuickCreate_Notes\', \'lead_id\', \'id\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'LBL_LEAD_ID','module' => 'Notes'), $this); echo '\' );
addToValidateBinaryDependency(\'form_SubpanelQuickCreate_Notes\', \'assigned_user_name\', \'alpha\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'ERR_SQS_NO_MATCH_FIELD','module' => 'Notes'), $this); echo ': ';  echo smarty_function_sugar_translate(array('label' => 'LBL_ASSIGNED_TO','module' => 'Notes'), $this); echo '\', \'assigned_user_id\' );
addToValidateBinaryDependency(\'form_SubpanelQuickCreate_Notes\', \'contact_name\', \'alpha\', false,\'';  echo smarty_function_sugar_translate(array('label' => 'ERR_SQS_NO_MATCH_FIELD','module' => 'Notes'), $this); echo ': ';  echo smarty_function_sugar_translate(array('label' => 'LBL_CONTACT_NAME','module' => 'Notes'), $this); echo '\', \'contact_id\' );
</script><script language="javascript">if(typeof sqs_objects == \'undefined\'){var sqs_objects = new Array;}sqs_objects[\'form_SubpanelQuickCreate_Notes_contact_name\']={"form":"form_SubpanelQuickCreate_Notes","method":"get_contact_array","modules":["Contacts"],"field_list":["salutation","first_name","last_name","id"],"populate_list":["contact_name","contact_id","contact_id","contact_id"],"required_list":["contact_id"],"group":"or","conditions":[{"name":"first_name","op":"like_custom","end":"%","value":""},{"name":"last_name","op":"like_custom","end":"%","value":""}],"order":"last_name","limit":"30","no_match_text":"No Match"};</script>'; ?>
