

<div class="clear"></div>
<form action="index.php" method="POST" name="{$form_name}" id="{$form_id}" {$enctype}>
<table width="100%" cellpadding="0" cellspacing="0" border="0" class="actionsContainer">
<tr>
<td class="buttons">
<input type="hidden" name="module" value="{$module}">
{if isset($smarty.request.isDuplicate) && $smarty.request.isDuplicate eq "true"}
<input type="hidden" name="record" value="">
<input type="hidden" name="duplicateSave" value="true">
<input type="hidden" name="duplicateId" value="{$fields.id.value}">
{else}
<input type="hidden" name="record" value="{$fields.id.value}">
{/if}
<input type="hidden" name="isDuplicate" value="false">
<input type="hidden" name="action">
<input type="hidden" name="return_module" value="{$smarty.request.return_module}">
<input type="hidden" name="return_action" value="{$smarty.request.return_action}">
<input type="hidden" name="return_id" value="{$smarty.request.return_id}">
<input type="hidden" name="module_tab"> 
<input type="hidden" name="contact_role">
{if !empty($smarty.request.return_module) || !empty($smarty.request.relate_to)}
<input type="hidden" name="relate_to" value="{if $smarty.request.return_relationship}{$smarty.request.return_relationship}{elseif $smarty.request.relate_to && empty($smarty.request.from_dcmenu)}{$smarty.request.relate_to}{elseif empty($isDCForm) && empty($smarty.request.from_dcmenu)}{$smarty.request.return_module}{/if}">
<input type="hidden" name="relate_id" value="{$smarty.request.return_id}">
{/if}
<input type="hidden" name="offset" value="{$offset}">
{if $bean->aclAccess("save")}<input title="{$APP.LBL_SAVE_BUTTON_TITLE}" accessKey="{$APP.LBL_SAVE_BUTTON_KEY}" class="button" onclick="this.form.action.value='Save';if(check_form('form_SubpanelQuickCreate_Cases'))return SUGAR.subpanelUtils.inlineSave(this.form.id, 'Cases_subpanel_save_button');return false;" type="submit" name="Cases_subpanel_save_button" id="Cases_subpanel_save_button" value="{$APP.LBL_SAVE_BUTTON_LABEL}">{/if} 
<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="return SUGAR.subpanelUtils.cancelCreate('Cases_subpanel_cancel_button');return false;" type="submit" name="Cases_subpanel_cancel_button" id="Cases_subpanel_cancel_button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}"> 
<input title="{$APP.LBL_FULL_FORM_BUTTON_TITLE}" accessKey="{$APP.LBL_FULL_FORM_BUTTON_KEY}" class="button" onclick="disableOnUnloadEditView(this.form); this.form.return_action.value='DetailView'; this.form.action.value='EditView'; if(typeof(this.form.to_pdf)!='undefined') this.form.to_pdf.value='0';" type="submit" name="Cases_subpanel_full_form_button" id="Cases_subpanel_full_form_button" value="{$APP.LBL_FULL_FORM_BUTTON_LABEL}"> <input type="hidden" name="full_form" value="full_form">
{if $bean->aclAccess("detail")}{if !empty($fields.id.value) && $isAuditEnabled}<input title="{$APP.LNK_VIEW_CHANGE_LOG}" class="button" onclick='open_popup("Audit", "600", "400", "&record={$fields.id.value}&module_name=Cases", true, false,  {ldelim} "call_back_function":"set_return","form_name":"EditView","field_to_name_array":[] {rdelim} ); return false;' type="submit" value="{$APP.LNK_VIEW_CHANGE_LOG}">{/if}{/if}
</td>
<td align='right'>
{$PAGINATION}
</td>
</tr>
</table>{sugar_include include=$includes}
<div id="form_SubpanelQuickCreate_Cases_tabs" 
>
<div >
<div id="">
{counter name="panelFieldCount" start=0 print=false assign="panelFieldCount"}
<table width="100%" border="0" cellspacing="1" cellpadding="0"  class="{$def.templateMeta.panelClass|default:'edit view'}">
<tr>
<td valign="top" id='name_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_SUBJECT' module='Cases'}
{/capture}
{$label|strip_semicolon}:
<span class="required">*</span>
</td>
<td valign="top" width='37.5%' >
{counter name="panelFieldCount"}

{if strlen($fields.name.value) <= 0}
{assign var="value" value=$fields.name.default_value }
{else}
{assign var="value" value=$fields.name.value }
{/if}  
<input type='text' name='{$fields.name.name}' 
id='{$fields.name.name}' size='65' 
maxlength='255' 
value='{$value}' title='' tabindex='100' > 
<td valign="top" id='priority_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_PRIORITY' module='Cases'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' >
{counter name="panelFieldCount"}

<select name="{$fields.priority.name}" 
id="{$fields.priority.name}" 
title='' tabindex="101"  
>
{if isset($fields.priority.value) && $fields.priority.value != ''}
{html_options options=$fields.priority.options selected=$fields.priority.value}
{else}
{html_options options=$fields.priority.options selected=$fields.priority.default}
{/if}
</select>
</tr>
<tr>
<td valign="top" id='status_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_STATUS' module='Cases'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' >
{counter name="panelFieldCount"}

<select name="{$fields.status.name}" 
id="{$fields.status.name}" 
title='' tabindex="102"  
>
{if isset($fields.status.value) && $fields.status.value != ''}
{html_options options=$fields.status.options selected=$fields.status.value}
{else}
{html_options options=$fields.status.options selected=$fields.status.default}
{/if}
</select>
<td valign="top" id='account_name_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_ACCOUNT_NAME' module='Cases'}
{/capture}
{$label|strip_semicolon}:
<span class="required">*</span>
</td>
<td valign="top" width='37.5%' >
{counter name="panelFieldCount"}

<input type="text" name="{$fields.account_name.name}" class="sqsEnabled" tabindex="103" id="{$fields.account_name.name}" size="" value="{$fields.account_name.value}" title='' autocomplete="off"  >
<input type="hidden" name="{$fields.account_name.id_name}" 
id="{$fields.account_name.id_name}" 
value="{$fields.account_id.value}">
<span class="id-ff multiple">
<button type="button" name="btn_{$fields.account_name.name}" id="btn_{$fields.account_name.name}" tabindex="103" title="{$APP.LBL_SELECT_BUTTON_TITLE}" accessKey="{$APP.LBL_SELECT_BUTTON_KEY}" class="button firstChild" value="{$APP.LBL_SELECT_BUTTON_LABEL}" 
onclick='open_popup(
"{$fields.account_name.module}", 
600, 
400, 
"", 
true, 
false, 
{literal}{"call_back_function":"set_return","form_name":"form_SubpanelQuickCreate_Cases","field_to_name_array":{"id":"account_id","name":"account_name"}}{/literal}, 
"single", 
true
);' ><img src="{sugar_getimagepath file="id-ff-select.png"}"></button><button type="button" name="btn_clr_{$fields.account_name.name}" id="btn_clr_{$fields.account_name.name}" tabindex="103" title="{$APP.LBL_CLEAR_BUTTON_TITLE}" accessKey="{$APP.LBL_CLEAR_BUTTON_KEY}" class="button lastChild" 
onclick="this.form.{$fields.account_name.name}.value = ''; this.form.{$fields.account_name.id_name}.value = '';" 
value="{$APP.LBL_CLEAR_BUTTON_LABEL}" ><img src="{sugar_getimagepath file="id-ff-clear.png"}"></button>
</span>
<script type="text/javascript">
<!--
if(typeof QSProcessedFieldsArray != 'undefined') 
	QSProcessedFieldsArray["{$form_name}_{$fields.account_name.name}"] = false;
	

enableQS(false);
-->	
</script>
</tr>
<tr>
<td valign="top" id='assigned_user_name_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_ASSIGNED_TO_NAME' module='Cases'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' colspan='3'>
{counter name="panelFieldCount"}

<input type="text" name="{$fields.assigned_user_name.name}" class="sqsEnabled" tabindex="104" id="{$fields.assigned_user_name.name}" size="" value="{$fields.assigned_user_name.value}" title='' autocomplete="off"  >
<input type="hidden" name="{$fields.assigned_user_name.id_name}" 
id="{$fields.assigned_user_name.id_name}" 
value="{$fields.assigned_user_id.value}">
<span class="id-ff multiple">
<button type="button" name="btn_{$fields.assigned_user_name.name}" id="btn_{$fields.assigned_user_name.name}" tabindex="104" title="{$APP.LBL_SELECT_BUTTON_TITLE}" accessKey="{$APP.LBL_SELECT_BUTTON_KEY}" class="button firstChild" value="{$APP.LBL_SELECT_BUTTON_LABEL}" 
onclick='open_popup(
"{$fields.assigned_user_name.module}", 
600, 
400, 
"", 
true, 
false, 
{literal}{"call_back_function":"set_return","form_name":"form_SubpanelQuickCreate_Cases","field_to_name_array":{"id":"assigned_user_id","user_name":"assigned_user_name"}}{/literal}, 
"single", 
true
);' ><img src="{sugar_getimagepath file="id-ff-select.png"}"></button><button type="button" name="btn_clr_{$fields.assigned_user_name.name}" id="btn_clr_{$fields.assigned_user_name.name}" tabindex="104" title="{$APP.LBL_CLEAR_BUTTON_TITLE}" accessKey="{$APP.LBL_CLEAR_BUTTON_KEY}" class="button lastChild" 
onclick="this.form.{$fields.assigned_user_name.name}.value = ''; this.form.{$fields.assigned_user_name.id_name}.value = '';" 
value="{$APP.LBL_CLEAR_BUTTON_LABEL}" ><img src="{sugar_getimagepath file="id-ff-clear.png"}"></button>
</span>
<script type="text/javascript">
<!--
if(typeof QSProcessedFieldsArray != 'undefined') 
	QSProcessedFieldsArray["{$form_name}_{$fields.assigned_user_name.name}"] = false;
	

enableQS(false);
-->	
</script>
</tr>
<tr>
<td valign="top" id='description_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_DESCRIPTION' module='Cases'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' colspan='3'>
{counter name="panelFieldCount"}

{if empty($fields.description.value)}
{assign var="value" value=$fields.description.default_value }
{else}
{assign var="value" value=$fields.description.value }
{/if}  
<textarea  id='{$fields.description.name}' name='{$fields.description.name}'
rows="4" 
cols="60" 
title='' tabindex="105" >{$value}</textarea>
</tr>
</table>
</div>
{if $panelFieldCount == 0}
<script>document.getElementById("").style.display='none';</script>
{/if}
</div></div>

<div class="buttons">
{if $bean->aclAccess("save")}<input title="{$APP.LBL_SAVE_BUTTON_TITLE}" accessKey="{$APP.LBL_SAVE_BUTTON_KEY}" class="button" onclick="this.form.action.value='Save';if(check_form('form_SubpanelQuickCreate_Cases'))return SUGAR.subpanelUtils.inlineSave(this.form.id, 'Cases_subpanel_save_button');return false;" type="submit" name="Cases_subpanel_save_button" id="Cases_subpanel_save_button" value="{$APP.LBL_SAVE_BUTTON_LABEL}">{/if} 
<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="return SUGAR.subpanelUtils.cancelCreate('Cases_subpanel_cancel_button');return false;" type="submit" name="Cases_subpanel_cancel_button" id="Cases_subpanel_cancel_button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}"> 
<input title="{$APP.LBL_FULL_FORM_BUTTON_TITLE}" accessKey="{$APP.LBL_FULL_FORM_BUTTON_KEY}" class="button" onclick="disableOnUnloadEditView(this.form); this.form.return_action.value='DetailView'; this.form.action.value='EditView'; if(typeof(this.form.to_pdf)!='undefined') this.form.to_pdf.value='0';" type="submit" name="Cases_subpanel_full_form_button" id="Cases_subpanel_full_form_button" value="{$APP.LBL_FULL_FORM_BUTTON_LABEL}"> <input type="hidden" name="full_form" value="full_form">
{if $bean->aclAccess("detail")}{if !empty($fields.id.value) && $isAuditEnabled}<input title="{$APP.LNK_VIEW_CHANGE_LOG}" class="button" onclick='open_popup("Audit", "600", "400", "&record={$fields.id.value}&module_name=Cases", true, false,  {ldelim} "call_back_function":"set_return","form_name":"EditView","field_to_name_array":[] {rdelim} ); return false;' type="submit" value="{$APP.LNK_VIEW_CHANGE_LOG}">{/if}{/if}
</div>
</form>
{$set_focus_block}
<script type="text/javascript">
YAHOO.util.Event.onContentReady("form_QuickCreate_Accounts", 
    function () {ldelim} initEditView(document.forms.form_SubpanelQuickCreate_Cases) {rdelim});
//window.setTimeout(, 100);
window.onbeforeunload = function () {ldelim} return onUnloadEditView(); {rdelim};
</script>{literal}
<script type="text/javascript">
addToValidate('form_SubpanelQuickCreate_Cases', 'id', 'id', false,'{/literal}{sugar_translate label='LBL_ID' module='Cases'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Cases', 'name', 'name', true,'{/literal}{sugar_translate label='LBL_SUBJECT' module='Cases'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Cases', 'date_entered_date', 'date', false,'Date Created' );
addToValidate('form_SubpanelQuickCreate_Cases', 'date_modified_date', 'date', false,'Date Modified' );
addToValidate('form_SubpanelQuickCreate_Cases', 'modified_user_id', 'assigned_user_name', false,'{/literal}{sugar_translate label='LBL_MODIFIED' module='Cases'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Cases', 'modified_by_name', 'relate', false,'{/literal}{sugar_translate label='LBL_MODIFIED_NAME' module='Cases'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Cases', 'created_by', 'assigned_user_name', false,'{/literal}{sugar_translate label='LBL_CREATED' module='Cases'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Cases', 'created_by_name', 'relate', false,'{/literal}{sugar_translate label='LBL_CREATED' module='Cases'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Cases', 'description', 'text', false,'{/literal}{sugar_translate label='LBL_DESCRIPTION' module='Cases'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Cases', 'deleted', 'bool', false,'{/literal}{sugar_translate label='LBL_DELETED' module='Cases'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Cases', 'assigned_user_id', 'relate', false,'{/literal}{sugar_translate label='LBL_ASSIGNED_TO_ID' module='Cases'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Cases', 'assigned_user_name', 'relate', false,'{/literal}{sugar_translate label='LBL_ASSIGNED_TO_NAME' module='Cases'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Cases', 'case_number', 'int', true,'{/literal}{sugar_translate label='LBL_NUMBER' module='Cases'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Cases', 'type', 'enum', false,'{/literal}{sugar_translate label='LBL_TYPE' module='Cases'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Cases', 'status', 'enum', false,'{/literal}{sugar_translate label='LBL_STATUS' module='Cases'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Cases', 'priority', 'enum', false,'{/literal}{sugar_translate label='LBL_PRIORITY' module='Cases'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Cases', 'resolution', 'text', false,'{/literal}{sugar_translate label='LBL_RESOLUTION' module='Cases'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Cases', 'work_log', 'text', false,'{/literal}{sugar_translate label='LBL_WORK_LOG' module='Cases'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Cases', 'account_name', 'relate', true,'{/literal}{sugar_translate label='LBL_ACCOUNT_NAME' module='Cases'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Cases', 'account_id', 'relate', false,'{/literal}{sugar_translate label='LBL_ACCOUNT_ID' module='Cases'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Cases', 'duedate_c', 'date', false,'{/literal}{sugar_translate label='LBL_DUEDATE' module='Cases'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Cases', 'resolveddate_c', 'date', false,'{/literal}{sugar_translate label='LBL_RESOLVEDDATE' module='Cases'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Cases', 'jobnumber_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_JOBNUMBER' module='Cases'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Cases', 'contactname_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_CONTACTNAME' module='Cases'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Cases', 'contactphone_c', 'phone', false,'{/literal}{sugar_translate label='LBL_CONTACTPHONE' module='Cases'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Cases', 'ticketnumber_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_TICKETNUMBER' module='Cases'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Cases', 'category_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_CATEGORY' module='Cases'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Cases', 'workgroup_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_WORKGROUP' module='Cases'}{literal}' );
addToValidateBinaryDependency('form_SubpanelQuickCreate_Cases', 'assigned_user_name', 'alpha', false,'{/literal}{sugar_translate label='ERR_SQS_NO_MATCH_FIELD' module='Cases'}{literal}: {/literal}{sugar_translate label='LBL_ASSIGNED_TO' module='Cases'}{literal}', 'assigned_user_id' );
addToValidateBinaryDependency('form_SubpanelQuickCreate_Cases', 'account_name', 'alpha', true,'{/literal}{sugar_translate label='ERR_SQS_NO_MATCH_FIELD' module='Cases'}{literal}: {/literal}{sugar_translate label='LBL_ACCOUNT_NAME' module='Cases'}{literal}', 'account_id' );
</script><script language="javascript">if(typeof sqs_objects == 'undefined'){var sqs_objects = new Array;}sqs_objects['form_SubpanelQuickCreate_Cases_account_name']={"form":"form_SubpanelQuickCreate_Cases","method":"query","modules":["Accounts"],"group":"or","field_list":["name","id"],"populate_list":["form_SubpanelQuickCreate_Cases_account_name","account_id"],"conditions":[{"name":"name","op":"like_custom","end":"%","value":""}],"required_list":["account_id"],"order":"name","limit":"30","no_match_text":"No Match"};sqs_objects['form_SubpanelQuickCreate_Cases_assigned_user_name']={"form":"form_SubpanelQuickCreate_Cases","method":"get_user_array","field_list":["user_name","id"],"populate_list":["assigned_user_name","assigned_user_id"],"required_list":["assigned_user_id"],"conditions":[{"name":"user_name","op":"like_custom","end":"%","value":""}],"limit":"30","no_match_text":"No Match"};</script>{/literal}
