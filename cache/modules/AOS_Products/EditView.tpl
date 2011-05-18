

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
{if $bean->aclAccess("save")}<input title="{$APP.LBL_SAVE_BUTTON_TITLE}" accessKey="{$APP.LBL_SAVE_BUTTON_KEY}" class="button primary" onclick="{if $isDuplicate}this.form.return_id.value=''; {/if}this.form.action.value='Save'; return check_form('EditView');" type="submit" name="button" value="{$APP.LBL_SAVE_BUTTON_LABEL}">{/if} 
{if !empty($smarty.request.return_action) && ($smarty.request.return_action == "DetailView" && !empty($smarty.request.return_id))}<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="window.location.href='index.php?action=DetailView&module={$smarty.request.return_module}&record={$smarty.request.return_id}'; return false;" name="button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}" type="button"> {elseif !empty($smarty.request.return_action) && ($smarty.request.return_action == "DetailView" && !empty($fields.id.value))}<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="window.location.href='index.php?action=DetailView&module={$smarty.request.return_module}&record={$fields.id.value}'; return false;" type="button" name="button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}"> {elseif empty($smarty.request.return_action) || empty($smarty.request.return_id) && !empty($fields.id.value)}<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="window.location.href='index.php?action=index&module=AOS_Products'; return false;" type="button" name="button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}"> {else}<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="window.location.href='index.php?action=index&module={$smarty.request.return_module}&record={$smarty.request.return_id}'; return false;" type="button" name="button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}"> {/if}
{if $bean->aclAccess("detail")}{if !empty($fields.id.value) && $isAuditEnabled}<input title="{$APP.LNK_VIEW_CHANGE_LOG}" class="button" onclick='open_popup("Audit", "600", "400", "&record={$fields.id.value}&module_name=AOS_Products", true, false,  {ldelim} "call_back_function":"set_return","form_name":"EditView","field_to_name_array":[] {rdelim} ); return false;' type="submit" value="{$APP.LNK_VIEW_CHANGE_LOG}">{/if}{/if}
</td>
<td align='right'>
{$PAGINATION}
</td>
</tr>
</table>{sugar_include include=$includes}
<div id="EditView_tabs" 
>
<div >
<div id="DEFAULT">
{counter name="panelFieldCount" start=0 print=false assign="panelFieldCount"}
<table width="100%" border="0" cellspacing="1" cellpadding="0"  class="{$def.templateMeta.panelClass|default:'edit view'}">
<tr>
<td valign="top" id='maincode_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_MAINCODE' module='AOS_Products'}
{/capture}
{$label|strip_semicolon}:
<span class="required">*</span>
</td>
<td valign="top" width='37.5%' colspan='3'>
{counter name="panelFieldCount"}

<select name="{$fields.maincode.name}" 
id="{$fields.maincode.name}" 
title='' tabindex="100"  
>
{if isset($fields.maincode.value) && $fields.maincode.value != ''}
{html_options options=$fields.maincode.options selected=$fields.maincode.value}
{else}
{html_options options=$fields.maincode.options selected=$fields.maincode.default}
{/if}
</select>
</tr>
<tr>
<td valign="top" id='name_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_NAME' module='AOS_Products'}
{/capture}
{$label|strip_semicolon}:
<span class="required">*</span>
</td>
<td valign="top" width='37.5%' colspan='3'>
{counter name="panelFieldCount"}

{if strlen($fields.name.value) <= 0}
{assign var="value" value=$fields.name.default_value }
{else}
{assign var="value" value=$fields.name.value }
{/if}  
<input type='text' name='{$fields.name.name}' 
id='{$fields.name.name}' size='30' 
maxlength='255' 
value='{$value}' title='' tabindex='101' > 
</tr>
<tr>
<td valign="top" id='part_number_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_PART_NUMBER' module='AOS_Products'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' colspan='3'>
{counter name="panelFieldCount"}

{if strlen($fields.part_number.value) <= 0}
{assign var="value" value=$fields.part_number.default_value }
{else}
{assign var="value" value=$fields.part_number.value }
{/if}  
<input type='text' name='{$fields.part_number.name}' 
id='{$fields.part_number.name}' size='30' 
maxlength='25' 
value='{$value}' title='' tabindex='102' > 
</tr>
<tr>
<td valign="top" id='category_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_CATEGORY' module='AOS_Products'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' colspan='3'>
{counter name="panelFieldCount"}

<select name="{$fields.category.name}" 
id="{$fields.category.name}" 
title='' tabindex="103"  
>
{if isset($fields.category.value) && $fields.category.value != ''}
{html_options options=$fields.category.options selected=$fields.category.value}
{else}
{html_options options=$fields.category.options selected=$fields.category.default}
{/if}
</select>
</tr>
<tr>
<td valign="top" id='type_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_TYPE' module='AOS_Products'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' colspan='3'>
{counter name="panelFieldCount"}

<select name="{$fields.type.name}" 
id="{$fields.type.name}" 
title='' tabindex="104"  
>
{if isset($fields.type.value) && $fields.type.value != ''}
{html_options options=$fields.type.options selected=$fields.type.value}
{else}
{html_options options=$fields.type.options selected=$fields.type.default}
{/if}
</select>
</tr>
<tr>
<td valign="top" id='cost_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_COST' module='AOS_Products'}
{/capture}
{$label|strip_semicolon}:
<span class="required">*</span>
</td>
<td valign="top" width='37.5%' colspan='3'>
{counter name="panelFieldCount"}

{if strlen($fields.cost.value) <= 0}
{assign var="value" value=$fields.cost.default_value }
{else}
{assign var="value" value=$fields.cost.value }
{/if}  
<input type='text' name='{$fields.cost.name}' 
id='{$fields.cost.name}' size='30' maxlength='' value='{sugar_number_format var=$value}' title='' tabindex='105' > 
</tr>
<tr>
<td valign="top" id='price_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_PRICE' module='AOS_Products'}
{/capture}
{$label|strip_semicolon}:
<span class="required">*</span>
</td>
<td valign="top" width='37.5%' colspan='3'>
{counter name="panelFieldCount"}

{if strlen($fields.price.value) <= 0}
{assign var="value" value=$fields.price.default_value }
{else}
{assign var="value" value=$fields.price.value }
{/if}  
<input type='text' name='{$fields.price.name}' 
id='{$fields.price.name}' size='30' maxlength='' value='{sugar_number_format var=$value}' title='' tabindex='106' > 
</tr>
<tr>
<td valign="top" id='url_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_URL' module='AOS_Products'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' colspan='3'>
{counter name="panelFieldCount"}

{if strlen($fields.url.value) <= 0}
{assign var="value" value=$fields.url.default_value }
{else}
{assign var="value" value=$fields.url.value }
{/if}  
<input type='text' name='{$fields.url.name}' 
id='{$fields.url.name}' size='30' 
maxlength='25' 
value='{$value}' title='' tabindex='107' > 
</tr>
<tr>
<td valign="top" id='contact_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_CONTACT' module='AOS_Products'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' colspan='3'>
{counter name="panelFieldCount"}

<input type="text" name="{$fields.contact.name}" class="sqsEnabled" tabindex="108" id="{$fields.contact.name}" size="" value="{$fields.contact.value}" title='' autocomplete="off"  >
<input type="hidden" name="{$fields.contact.id_name}" 
id="{$fields.contact.id_name}" 
value="{$fields.contact_id.value}">
<span class="id-ff multiple">
<button type="button" name="btn_{$fields.contact.name}" id="btn_{$fields.contact.name}" tabindex="108" title="{$APP.LBL_SELECT_BUTTON_TITLE}" accessKey="{$APP.LBL_SELECT_BUTTON_KEY}" class="button firstChild" value="{$APP.LBL_SELECT_BUTTON_LABEL}" 
onclick='open_popup(
"{$fields.contact.module}", 
600, 
400, 
"", 
true, 
false, 
{literal}{"call_back_function":"set_return","form_name":"EditView","field_to_name_array":{"id":"contact_id","name":"contact"}}{/literal}, 
"single", 
true
);' ><img src="{sugar_getimagepath file="id-ff-select.png"}"></button><button type="button" name="btn_clr_{$fields.contact.name}" id="btn_clr_{$fields.contact.name}" tabindex="108" title="{$APP.LBL_CLEAR_BUTTON_TITLE}" accessKey="{$APP.LBL_CLEAR_BUTTON_KEY}" class="button lastChild" 
onclick="this.form.{$fields.contact.name}.value = ''; this.form.{$fields.contact.id_name}.value = '';" 
value="{$APP.LBL_CLEAR_BUTTON_LABEL}" ><img src="{sugar_getimagepath file="id-ff-clear.png"}"></button>
</span>
<script type="text/javascript">
<!--
if(typeof QSProcessedFieldsArray != 'undefined') 
	QSProcessedFieldsArray["{$form_name}_{$fields.contact.name}"] = false;
	

enableQS(false);
-->	
</script>
</tr>
<tr>
<td valign="top" id='description_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_DESCRIPTION' module='AOS_Products'}
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
rows="6" 
cols="80" 
title='' tabindex="109" >{$value}</textarea>
<td valign="top" id='_label' width='12.5%' scope="row">
</td>
<td valign="top" width='37.5%' >
</tr>
</table>
</div>
{if $panelFieldCount == 0}
<script>document.getElementById("DEFAULT").style.display='none';</script>
{/if}
</div></div>

<div class="buttons">
{if $bean->aclAccess("save")}<input title="{$APP.LBL_SAVE_BUTTON_TITLE}" accessKey="{$APP.LBL_SAVE_BUTTON_KEY}" class="button primary" onclick="{if $isDuplicate}this.form.return_id.value=''; {/if}this.form.action.value='Save'; return check_form('EditView');" type="submit" name="button" value="{$APP.LBL_SAVE_BUTTON_LABEL}">{/if} 
{if !empty($smarty.request.return_action) && ($smarty.request.return_action == "DetailView" && !empty($smarty.request.return_id))}<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="window.location.href='index.php?action=DetailView&module={$smarty.request.return_module}&record={$smarty.request.return_id}'; return false;" name="button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}" type="button"> {elseif !empty($smarty.request.return_action) && ($smarty.request.return_action == "DetailView" && !empty($fields.id.value))}<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="window.location.href='index.php?action=DetailView&module={$smarty.request.return_module}&record={$fields.id.value}'; return false;" type="button" name="button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}"> {elseif empty($smarty.request.return_action) || empty($smarty.request.return_id) && !empty($fields.id.value)}<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="window.location.href='index.php?action=index&module=AOS_Products'; return false;" type="button" name="button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}"> {else}<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="window.location.href='index.php?action=index&module={$smarty.request.return_module}&record={$smarty.request.return_id}'; return false;" type="button" name="button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}"> {/if}
{if $bean->aclAccess("detail")}{if !empty($fields.id.value) && $isAuditEnabled}<input title="{$APP.LNK_VIEW_CHANGE_LOG}" class="button" onclick='open_popup("Audit", "600", "400", "&record={$fields.id.value}&module_name=AOS_Products", true, false,  {ldelim} "call_back_function":"set_return","form_name":"EditView","field_to_name_array":[] {rdelim} ); return false;' type="submit" value="{$APP.LNK_VIEW_CHANGE_LOG}">{/if}{/if}
</div>
</form>
{$set_focus_block}
<script type="text/javascript">
YAHOO.util.Event.onContentReady("form_QuickCreate_Accounts", 
    function () {ldelim} initEditView(document.forms.EditView) {rdelim});
//window.setTimeout(, 100);
window.onbeforeunload = function () {ldelim} return onUnloadEditView(); {rdelim};
</script>{literal}
<script type="text/javascript">
addToValidate('EditView', 'id', 'id', false,'{/literal}{sugar_translate label='LBL_ID' module='AOS_Products'}{literal}' );
addToValidate('EditView', 'name', 'name', true,'{/literal}{sugar_translate label='LBL_NAME' module='AOS_Products'}{literal}' );
addToValidate('EditView', 'date_entered_date', 'date', false,'Date Created' );
addToValidate('EditView', 'date_modified_date', 'date', false,'Date Modified' );
addToValidate('EditView', 'modified_user_id', 'assigned_user_name', false,'{/literal}{sugar_translate label='LBL_MODIFIED' module='AOS_Products'}{literal}' );
addToValidate('EditView', 'modified_by_name', 'relate', false,'{/literal}{sugar_translate label='LBL_MODIFIED_NAME' module='AOS_Products'}{literal}' );
addToValidate('EditView', 'created_by', 'assigned_user_name', false,'{/literal}{sugar_translate label='LBL_CREATED' module='AOS_Products'}{literal}' );
addToValidate('EditView', 'created_by_name', 'relate', false,'{/literal}{sugar_translate label='LBL_CREATED' module='AOS_Products'}{literal}' );
addToValidate('EditView', 'description', 'text', false,'{/literal}{sugar_translate label='LBL_DESCRIPTION' module='AOS_Products'}{literal}' );
addToValidate('EditView', 'deleted', 'bool', false,'{/literal}{sugar_translate label='LBL_DELETED' module='AOS_Products'}{literal}' );
addToValidate('EditView', 'assigned_user_id', 'relate', false,'{/literal}{sugar_translate label='LBL_ASSIGNED_TO_ID' module='AOS_Products'}{literal}' );
addToValidate('EditView', 'assigned_user_name', 'relate', false,'{/literal}{sugar_translate label='LBL_ASSIGNED_TO_NAME' module='AOS_Products'}{literal}' );
addToValidate('EditView', 'maincode', 'enum', true,'{/literal}{sugar_translate label='LBL_MAINCODE' module='AOS_Products'}{literal}' );
addToValidate('EditView', 'part_number', 'varchar', false,'{/literal}{sugar_translate label='LBL_PART_NUMBER' module='AOS_Products'}{literal}' );
addToValidate('EditView', 'category', 'enum', false,'{/literal}{sugar_translate label='LBL_CATEGORY' module='AOS_Products'}{literal}' );
addToValidate('EditView', 'type', 'enum', false,'{/literal}{sugar_translate label='LBL_TYPE' module='AOS_Products'}{literal}' );
addToValidate('EditView', 'cost', 'currency', true,'{/literal}{sugar_translate label='LBL_COST' module='AOS_Products'}{literal}' );
addToValidate('EditView', 'currency_id', 'id', false,'{/literal}{sugar_translate label='LBL_CURRENCY' module='AOS_Products'}{literal}' );
addToValidate('EditView', 'price', 'currency', true,'{/literal}{sugar_translate label='LBL_PRICE' module='AOS_Products'}{literal}' );
addToValidate('EditView', 'url', 'varchar', false,'{/literal}{sugar_translate label='LBL_URL' module='AOS_Products'}{literal}' );
addToValidate('EditView', 'contact_id', 'id', false,'{/literal}{sugar_translate label='' module='AOS_Products'}{literal}' );
addToValidate('EditView', 'contact', 'relate', false,'{/literal}{sugar_translate label='LBL_CONTACT' module='AOS_Products'}{literal}' );
addToValidate('EditView', 'glcode_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_GLCODE' module='AOS_Products'}{literal}' );
addToValidateBinaryDependency('EditView', 'assigned_user_name', 'alpha', false,'{/literal}{sugar_translate label='ERR_SQS_NO_MATCH_FIELD' module='AOS_Products'}{literal}: {/literal}{sugar_translate label='LBL_ASSIGNED_TO' module='AOS_Products'}{literal}', 'assigned_user_id' );
addToValidateBinaryDependency('EditView', 'contact', 'alpha', false,'{/literal}{sugar_translate label='ERR_SQS_NO_MATCH_FIELD' module='AOS_Products'}{literal}: {/literal}{sugar_translate label='LBL_CONTACT' module='AOS_Products'}{literal}', 'contact_id' );
</script><script language="javascript">if(typeof sqs_objects == 'undefined'){var sqs_objects = new Array;}sqs_objects['EditView_contact']={"form":"EditView","method":"get_contact_array","modules":["Contacts"],"field_list":["salutation","first_name","last_name","id"],"populate_list":["contact","contact_id","contact_id","contact_id"],"required_list":["contact_id"],"group":"or","conditions":[{"name":"first_name","op":"like_custom","end":"%","value":""},{"name":"last_name","op":"like_custom","end":"%","value":""}],"order":"last_name","limit":"30","no_match_text":"No Match"};</script>{/literal}
