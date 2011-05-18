

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
{if !empty($smarty.request.return_action) && ($smarty.request.return_action == "DetailView" && !empty($smarty.request.return_id))}<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="window.location.href='index.php?action=DetailView&module={$smarty.request.return_module}&record={$smarty.request.return_id}'; return false;" name="button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}" type="button"> {elseif !empty($smarty.request.return_action) && ($smarty.request.return_action == "DetailView" && !empty($fields.id.value))}<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="window.location.href='index.php?action=DetailView&module={$smarty.request.return_module}&record={$fields.id.value}'; return false;" type="button" name="button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}"> {elseif empty($smarty.request.return_action) || empty($smarty.request.return_id) && !empty($fields.id.value)}<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="window.location.href='index.php?action=index&module=Employees'; return false;" type="button" name="button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}"> {else}<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="window.location.href='index.php?action=index&module={$smarty.request.return_module}&record={$smarty.request.return_id}'; return false;" type="button" name="button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}"> {/if}
{if $bean->aclAccess("detail")}{if !empty($fields.id.value) && $isAuditEnabled}<input title="{$APP.LNK_VIEW_CHANGE_LOG}" class="button" onclick='open_popup("Audit", "600", "400", "&record={$fields.id.value}&module_name=Employees", true, false,  {ldelim} "call_back_function":"set_return","form_name":"EditView","field_to_name_array":[] {rdelim} ); return false;' type="submit" value="{$APP.LNK_VIEW_CHANGE_LOG}">{/if}{/if}
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
<td valign="top" id='employee_status_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_EMPLOYEE_STATUS' module='Employees'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' colspan='3'>
{counter name="panelFieldCount"}
<span id='employee_status'>
{$fields.employee_status.value}</span>
</tr>
<tr>
<td valign="top" id='first_name_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_FIRST_NAME' module='Employees'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' >
{counter name="panelFieldCount"}

{if strlen($fields.first_name.value) <= 0}
{assign var="value" value=$fields.first_name.default_value }
{else}
{assign var="value" value=$fields.first_name.value }
{/if}  
<input type='text' name='{$fields.first_name.name}' 
id='{$fields.first_name.name}' size='30' 
maxlength='30' 
value='{$value}' title='' tabindex='101' > 
<td valign="top" id='last_name_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_LAST_NAME' module='Employees'}
{/capture}
{$label|strip_semicolon}:
<span class="required">*</span>
</td>
<td valign="top" width='37.5%' >
{counter name="panelFieldCount"}

{if strlen($fields.last_name.value) <= 0}
{assign var="value" value=$fields.last_name.default_value }
{else}
{assign var="value" value=$fields.last_name.value }
{/if}  
<input type='text' name='{$fields.last_name.name}' 
id='{$fields.last_name.name}' size='30' 
maxlength='30' 
value='{$value}' title='' tabindex='102' > 
</tr>
<tr>
<td valign="top" id='title_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_TITLE' module='Employees'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' >
{counter name="panelFieldCount"}
{if $EDIT_REPORTS_TO}<input tabindex="103"  type="text" name="{$fields.title.name}" id="{$fields.title.name}" size="30" maxlength="50" value="{$fields.title.value}" title="" tabindex="t" >{else}{$fields.title.value}<input tabindex="103"  type="hidden" name="{$fields.title.name}" id="{$fields.title.name}" value="{$fields.title.value}">{/if}
<td valign="top" id='phone_work_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_OFFICE_PHONE' module='Employees'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' >
{counter name="panelFieldCount"}

{if strlen($fields.phone_work.value) <= 0}
{assign var="value" value=$fields.phone_work.default_value }
{else}
{assign var="value" value=$fields.phone_work.value }
{/if}  
<input type='text' name='{$fields.phone_work.name}' 
id='{$fields.phone_work.name}' size='30' 
maxlength='50' 
value='{$value}' title='' tabindex='104' > 
</tr>
<tr>
<td valign="top" id='department_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_DEPARTMENT' module='Employees'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' >
{counter name="panelFieldCount"}
{if $EDIT_REPORTS_TO}<input tabindex="105"  type="text" name="{$fields.department.name}" id="{$fields.department.name}" size="30" maxlength="50" value="{$fields.department.value}" title="" tabindex="t" >{else}{$fields.department.value}<input tabindex="105"  type="hidden" name="{$fields.department.name}" id="{$fields.department.name}" value="{$fields.department.value}">{/if}
<td valign="top" id='phone_mobile_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_MOBILE_PHONE' module='Employees'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' >
{counter name="panelFieldCount"}

{if strlen($fields.phone_mobile.value) <= 0}
{assign var="value" value=$fields.phone_mobile.default_value }
{else}
{assign var="value" value=$fields.phone_mobile.value }
{/if}  
<input type='text' name='{$fields.phone_mobile.name}' 
id='{$fields.phone_mobile.name}' size='30' 
maxlength='50' 
value='{$value}' title='' tabindex='106' > 
</tr>
<tr>
<td valign="top" id='reports_to_name_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_REPORTS_TO_NAME' module='Employees'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' >
{counter name="panelFieldCount"}
{if $EDIT_REPORTS_TO}<input tabindex="107"  type="text" name="{$fields.reports_to_name.name}" class="sqsEnabled" tabindex="0" id="{$fields.reports_to_name.name}" size="" value="{$fields.reports_to_name.value}" title="" autocomplete="off" >{$REPORTS_TO_JS}<input tabindex="107"  type="hidden" name="{$fields.reports_to_id.name}" id="{$fields.reports_to_id.name}" value="{$fields.reports_to_id.value}"> <span class="id-ff multiple"><button type="button" name="btn_{$fields.reports_to_name.name}" tabindex="0" title="{$APP.LBL_SELECT_BUTTON_TITLE}" accessKey="{$APP.LBL_SELECT_BUTTON_KEY}" class="button firstChild" value="{$APP.LBL_SELECT_BUTTON_LABEL}" onclick='open_popup("{$fields.reports_to_name.module}", 600, 400, "", true, false, {literal}{"call_back_function":"set_return","form_name":"EditView","field_to_name_array":{"id":"reports_to_id","name":"reports_to_name"}}{/literal}, "single", true);'><img src="themes/default/images/id-ff-select.png?s=6f529a54aebb0a43443edb49141ea870&c=1"></button><button type="button" name="btn_clr_{$fields.reports_to_name.name}" tabindex="0" title="{$APP.LBL_CLEAR_BUTTON_TITLE}" accessKey="{$APP.LBL_CLEAR_BUTTON_KEY}" class="button lastChild" onclick="this.form.{$fields.reports_to_name.name}.value = ''; this.form.{$fields.reports_to_id.name}.value = '';" value="{$APP.LBL_CLEAR_BUTTON_LABEL}"><img src="themes/default/images/id-ff-clear.png?s=6f529a54aebb0a43443edb49141ea870&c=1"></button></span>{else}{$fields.reports_to_name.value}<input tabindex="107"  type="hidden" name="{$fields.reports_to_id.name}" id="{$fields.reports_to_id.name}" value="{$fields.reports_to_id.value}">{/if}
<td valign="top" id='phone_other_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_OTHER_PHONE' module='Employees'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' >
{counter name="panelFieldCount"}

{if strlen($fields.phone_other.value) <= 0}
{assign var="value" value=$fields.phone_other.default_value }
{else}
{assign var="value" value=$fields.phone_other.value }
{/if}  
<input type='text' name='{$fields.phone_other.name}' 
id='{$fields.phone_other.name}' size='30' 
maxlength='50' 
value='{$value}' title='' tabindex='108' > 
</tr>
<tr>
<td valign="top" id='_label' width='12.5%' scope="row">
</td>
<td valign="top" width='37.5%' >
<td valign="top" id='phone_fax_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_FAX' module='Employees'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' >
{counter name="panelFieldCount"}

{if strlen($fields.phone_fax.value) <= 0}
{assign var="value" value=$fields.phone_fax.default_value }
{else}
{assign var="value" value=$fields.phone_fax.value }
{/if}  
<input type='text' name='{$fields.phone_fax.name}' 
id='{$fields.phone_fax.name}' size='30' 
maxlength='50' 
value='{$value}' title='' tabindex='110' > 
</tr>
<tr>
<td valign="top" id='_label' width='12.5%' scope="row">
</td>
<td valign="top" width='37.5%' >
<td valign="top" id='phone_home_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_HOME_PHONE' module='Employees'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' >
{counter name="panelFieldCount"}

{if strlen($fields.phone_home.value) <= 0}
{assign var="value" value=$fields.phone_home.default_value }
{else}
{assign var="value" value=$fields.phone_home.value }
{/if}  
<input type='text' name='{$fields.phone_home.name}' 
id='{$fields.phone_home.name}' size='30' 
maxlength='50' 
value='{$value}' title='' tabindex='112' > 
</tr>
<tr>
<td valign="top" id='messenger_type_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_MESSENGER_TYPE' module='Employees'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' colspan='3'>
{counter name="panelFieldCount"}
<span id='messenger_type'>
{$fields.messenger_type.value}</span>
</tr>
<tr>
<td valign="top" id='messenger_id_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_MESSENGER_ID' module='Employees'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' colspan='3'>
{counter name="panelFieldCount"}

{if strlen($fields.messenger_id.value) <= 0}
{assign var="value" value=$fields.messenger_id.default_value }
{else}
{assign var="value" value=$fields.messenger_id.value }
{/if}  
<input type='text' name='{$fields.messenger_id.name}' 
id='{$fields.messenger_id.name}' size='30' 
maxlength='100' 
value='{$value}' title='' tabindex='114' > 
</tr>
<tr>
<td valign="top" id='description_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_NOTES' module='Employees'}
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
title='' tabindex="115" >{$value}</textarea>
</tr>
<tr>
<td valign="top" id='address_street_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_PRIMARY_ADDRESS' module='Employees'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' >
{counter name="panelFieldCount"}

{if empty($fields.address_street.value)}
{assign var="value" value=$fields.address_street.default_value }
{else}
{assign var="value" value=$fields.address_street.value }
{/if}  
<textarea  id='{$fields.address_street.name}' name='{$fields.address_street.name}'
rows="2" 
cols="30" 
title='' tabindex="116" >{$value}</textarea>
<td valign="top" id='address_city_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_CITY' module='Employees'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' >
{counter name="panelFieldCount"}

{if strlen($fields.address_city.value) <= 0}
{assign var="value" value=$fields.address_city.default_value }
{else}
{assign var="value" value=$fields.address_city.value }
{/if}  
<input type='text' name='{$fields.address_city.name}' 
id='{$fields.address_city.name}' size='30' 
maxlength='100' 
value='{$value}' title='' tabindex='117' > 
</tr>
<tr>
<td valign="top" id='address_state_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_STATE' module='Employees'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' >
{counter name="panelFieldCount"}

{if strlen($fields.address_state.value) <= 0}
{assign var="value" value=$fields.address_state.default_value }
{else}
{assign var="value" value=$fields.address_state.value }
{/if}  
<input type='text' name='{$fields.address_state.name}' 
id='{$fields.address_state.name}' size='30' 
maxlength='100' 
value='{$value}' title='' tabindex='118' > 
<td valign="top" id='address_postalcode_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_POSTAL_CODE' module='Employees'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' >
{counter name="panelFieldCount"}

{if strlen($fields.address_postalcode.value) <= 0}
{assign var="value" value=$fields.address_postalcode.default_value }
{else}
{assign var="value" value=$fields.address_postalcode.value }
{/if}  
<input type='text' name='{$fields.address_postalcode.name}' 
id='{$fields.address_postalcode.name}' size='30' 
maxlength='9' 
value='{$value}' title='' tabindex='119' > 
</tr>
<tr>
<td valign="top" id='address_country_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_COUNTRY' module='Employees'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' colspan='3'>
{counter name="panelFieldCount"}

{if strlen($fields.address_country.value) <= 0}
{assign var="value" value=$fields.address_country.default_value }
{else}
{assign var="value" value=$fields.address_country.value }
{/if}  
<input type='text' name='{$fields.address_country.name}' 
id='{$fields.address_country.name}' size='30' 
maxlength='100' 
value='{$value}' title='' tabindex='120' > 
</tr>
<tr>
<td valign="top" id='email1_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_EMAIL' module='Employees'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' colspan='3'>
{counter name="panelFieldCount"}
<span id='email1'>
{$fields.email1.value}</span>
</tr>
</table>
</div>
{if $panelFieldCount == 0}
<script>document.getElementById("DEFAULT").style.display='none';</script>
{/if}
</div></div>

<div class="buttons">
{if $bean->aclAccess("save")}<input title="{$APP.LBL_SAVE_BUTTON_TITLE}" accessKey="{$APP.LBL_SAVE_BUTTON_KEY}" class="button primary" onclick="{if $isDuplicate}this.form.return_id.value=''; {/if}this.form.action.value='Save'; return check_form('EditView');" type="submit" name="button" value="{$APP.LBL_SAVE_BUTTON_LABEL}">{/if} 
{if !empty($smarty.request.return_action) && ($smarty.request.return_action == "DetailView" && !empty($smarty.request.return_id))}<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="window.location.href='index.php?action=DetailView&module={$smarty.request.return_module}&record={$smarty.request.return_id}'; return false;" name="button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}" type="button"> {elseif !empty($smarty.request.return_action) && ($smarty.request.return_action == "DetailView" && !empty($fields.id.value))}<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="window.location.href='index.php?action=DetailView&module={$smarty.request.return_module}&record={$fields.id.value}'; return false;" type="button" name="button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}"> {elseif empty($smarty.request.return_action) || empty($smarty.request.return_id) && !empty($fields.id.value)}<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="window.location.href='index.php?action=index&module=Employees'; return false;" type="button" name="button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}"> {else}<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="window.location.href='index.php?action=index&module={$smarty.request.return_module}&record={$smarty.request.return_id}'; return false;" type="button" name="button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}"> {/if}
{if $bean->aclAccess("detail")}{if !empty($fields.id.value) && $isAuditEnabled}<input title="{$APP.LNK_VIEW_CHANGE_LOG}" class="button" onclick='open_popup("Audit", "600", "400", "&record={$fields.id.value}&module_name=Employees", true, false,  {ldelim} "call_back_function":"set_return","form_name":"EditView","field_to_name_array":[] {rdelim} ); return false;' type="submit" value="{$APP.LNK_VIEW_CHANGE_LOG}">{/if}{/if}
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
addToValidate('EditView', 'id', 'id', false,'{/literal}{sugar_translate label='LBL_ID' module='Employees'}{literal}' );
addToValidate('EditView', 'user_name', 'user_name', false,'{/literal}{sugar_translate label='LBL_USER_NAME' module='Employees'}{literal}' );
addToValidate('EditView', 'user_hash', 'varchar', false,'{/literal}{sugar_translate label='LBL_USER_HASH' module='Employees'}{literal}' );
addToValidate('EditView', 'system_generated_password', 'bool', true,'{/literal}{sugar_translate label='LBL_SYSTEM_GENERATED_PASSWORD' module='Employees'}{literal}' );
addToValidate('EditView', 'pwd_last_changed_date', 'date', false,'LBL_PSW_MODIFIED' );
addToValidate('EditView', 'authenticate_id', 'varchar', false,'{/literal}{sugar_translate label='LBL_AUTHENTICATE_ID' module='Employees'}{literal}' );
addToValidate('EditView', 'sugar_login', 'bool', false,'{/literal}{sugar_translate label='LBL_SUGAR_LOGIN' module='Employees'}{literal}' );
addToValidate('EditView', 'first_name', 'name', false,'{/literal}{sugar_translate label='LBL_FIRST_NAME' module='Employees'}{literal}' );
addToValidate('EditView', 'last_name', 'name', true,'{/literal}{sugar_translate label='LBL_LAST_NAME' module='Employees'}{literal}' );
addToValidate('EditView', 'full_name', 'name', false,'{/literal}{sugar_translate label='LBL_NAME' module='Employees'}{literal}' );
addToValidate('EditView', 'name', 'varchar', false,'{/literal}{sugar_translate label='LBL_NAME' module='Employees'}{literal}' );
addToValidate('EditView', 'reports_to_id', 'id', false,'{/literal}{sugar_translate label='LBL_REPORTS_TO_ID' module='Employees'}{literal}' );
addToValidate('EditView', 'reports_to_name', 'relate', false,'{/literal}{sugar_translate label='LBL_REPORTS_TO_NAME' module='Employees'}{literal}' );
addToValidate('EditView', 'is_admin', 'bool', false,'{/literal}{sugar_translate label='LBL_IS_ADMIN' module='Employees'}{literal}' );
addToValidate('EditView', 'external_auth_only', 'bool', false,'{/literal}{sugar_translate label='LBL_EXT_AUTHENTICATE' module='Employees'}{literal}' );
addToValidate('EditView', 'receive_notifications', 'bool', false,'{/literal}{sugar_translate label='LBL_RECEIVE_NOTIFICATIONS' module='Employees'}{literal}' );
addToValidate('EditView', 'description', 'text', false,'{/literal}{sugar_translate label='LBL_DESCRIPTION' module='Employees'}{literal}' );
addToValidate('EditView', 'date_entered_date', 'date', true,'Date Created' );
addToValidate('EditView', 'date_modified_date', 'date', true,'Date Modified' );
addToValidate('EditView', 'modified_user_id', 'assigned_user_name', false,'{/literal}{sugar_translate label='LBL_MODIFIED_BY_ID' module='Employees'}{literal}' );
addToValidate('EditView', 'modified_by_name', 'varchar', false,'{/literal}{sugar_translate label='LBL_MODIFIED_BY' module='Employees'}{literal}' );
addToValidate('EditView', 'created_by', 'assigned_user_name', false,'{/literal}{sugar_translate label='LBL_ASSIGNED_TO' module='Employees'}{literal}' );
addToValidate('EditView', 'title', 'varchar', false,'{/literal}{sugar_translate label='LBL_TITLE' module='Employees'}{literal}' );
addToValidate('EditView', 'department', 'varchar', false,'{/literal}{sugar_translate label='LBL_DEPARTMENT' module='Employees'}{literal}' );
addToValidate('EditView', 'phone_home', 'phone', false,'{/literal}{sugar_translate label='LBL_HOME_PHONE' module='Employees'}{literal}' );
addToValidate('EditView', 'phone_mobile', 'phone', false,'{/literal}{sugar_translate label='LBL_MOBILE_PHONE' module='Employees'}{literal}' );
addToValidate('EditView', 'phone_work', 'phone', false,'{/literal}{sugar_translate label='LBL_WORK_PHONE' module='Employees'}{literal}' );
addToValidate('EditView', 'phone_other', 'phone', false,'{/literal}{sugar_translate label='LBL_OTHER_PHONE' module='Employees'}{literal}' );
addToValidate('EditView', 'phone_fax', 'phone', false,'{/literal}{sugar_translate label='LBL_FAX_PHONE' module='Employees'}{literal}' );
addToValidate('EditView', 'status', 'enum', false,'{/literal}{sugar_translate label='LBL_STATUS' module='Employees'}{literal}' );
addToValidate('EditView', 'address_street', 'varchar', false,'{/literal}{sugar_translate label='LBL_ADDRESS_STREET' module='Employees'}{literal}' );
addToValidate('EditView', 'address_city', 'varchar', false,'{/literal}{sugar_translate label='LBL_ADDRESS_CITY' module='Employees'}{literal}' );
addToValidate('EditView', 'address_state', 'varchar', false,'{/literal}{sugar_translate label='LBL_ADDRESS_STATE' module='Employees'}{literal}' );
addToValidate('EditView', 'address_country', 'varchar', false,'{/literal}{sugar_translate label='LBL_ADDRESS_COUNTRY' module='Employees'}{literal}' );
addToValidate('EditView', 'address_postalcode', 'varchar', false,'{/literal}{sugar_translate label='LBL_ADDRESS_POSTALCODE' module='Employees'}{literal}' );
addToValidate('EditView', 'deleted', 'bool', false,'{/literal}{sugar_translate label='LBL_DELETED' module='Employees'}{literal}' );
addToValidate('EditView', 'portal_only', 'bool', false,'{/literal}{sugar_translate label='LBL_PORTAL_ONLY_USER' module='Employees'}{literal}' );
addToValidate('EditView', 'employee_status', 'varchar', false,'{/literal}{sugar_translate label='LBL_EMPLOYEE_STATUS' module='Employees'}{literal}' );
addToValidate('EditView', 'messenger_id', 'varchar', false,'{/literal}{sugar_translate label='LBL_MESSENGER_ID' module='Employees'}{literal}' );
addToValidate('EditView', 'messenger_type', 'varchar', false,'{/literal}{sugar_translate label='LBL_MESSENGER_TYPE' module='Employees'}{literal}' );
addToValidate('EditView', 'email1', 'varchar', false,'{/literal}{sugar_translate label='LBL_EMAIL' module='Employees'}{literal}' );
addToValidate('EditView', 'is_group', 'bool', false,'{/literal}{sugar_translate label='LBL_GROUP_USER' module='Employees'}{literal}' );
addToValidate('EditView', 'c_accept_status_fields', 'relate', false,'{/literal}{sugar_translate label='LBL_LIST_ACCEPT_STATUS' module='Employees'}{literal}' );
addToValidate('EditView', 'm_accept_status_fields', 'relate', false,'{/literal}{sugar_translate label='LBL_LIST_ACCEPT_STATUS' module='Employees'}{literal}' );
addToValidate('EditView', 'accept_status_id', 'varchar', false,'{/literal}{sugar_translate label='LBL_LIST_ACCEPT_STATUS' module='Employees'}{literal}' );
addToValidate('EditView', 'accept_status_name', 'enum', false,'{/literal}{sugar_translate label='LBL_LIST_ACCEPT_STATUS' module='Employees'}{literal}' );
addToValidateBinaryDependency('EditView', 'assigned_user_name', 'alpha', false,'{/literal}{sugar_translate label='ERR_SQS_NO_MATCH_FIELD' module='Employees'}{literal}: {/literal}{sugar_translate label='LBL_ASSIGNED_TO' module='Employees'}{literal}', 'assigned_user_id' );
addToValidateBinaryDependency('EditView', 'reports_to_name', 'alpha', false,'{/literal}{sugar_translate label='ERR_SQS_NO_MATCH_FIELD' module='Employees'}{literal}: {/literal}{sugar_translate label='LBL_REPORTS_TO_NAME' module='Employees'}{literal}', 'reports_to_id' );
</script><script language="javascript">if(typeof sqs_objects == 'undefined'){var sqs_objects = new Array;}sqs_objects['EditView_reports_to_name']={"form":"EditView","method":"get_user_array","field_list":["user_name","id"],"populate_list":["reports_to_name","reports_to_id"],"required_list":["reports_to_id"],"conditions":[{"name":"user_name","op":"like_custom","end":"%","value":""}],"limit":"30","no_match_text":"No Match"};</script>{/literal}
