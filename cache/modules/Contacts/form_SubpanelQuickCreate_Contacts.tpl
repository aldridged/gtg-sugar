

<form action="index.php" method="POST" name="{$form_name}" id="{$form_id}" {$enctype}>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
<td>
<input type="hidden" name="module" value="{$module}">
{if isset($smarty.request.isDuplicate) && $smarty.request.isDuplicate eq "true"}
<input type="hidden" name="record" value="">
{else}
<input type="hidden" name="record" value="{$fields.id.value}">
{/if}
<input type="hidden" name="isDuplicate" value="false">
<input type="hidden" name="action">
<input type="hidden" name="return_module" value="{$smarty.request.return_module}">
<input type="hidden" name="return_action" value="{$smarty.request.return_action}">
<input type="hidden" name="return_id" value="{$smarty.request.return_id}">
<input type="hidden" name="contact_role">
{if !empty($smarty.request.return_module)}
<input type="hidden" name="relate_to" value="{if $smarty.request.return_relationship}{$smarty.request.return_relationship}{elseif empty($isDCForm)}{$smarty.request.return_module}{/if}">
<input type="hidden" name="relate_id" value="{$smarty.request.return_id}">
{/if}
<input type="hidden" name="offset" value="{$offset}">
<input type="hidden" name="opportunity_id" value="{$smarty.request.opportunity_id}">   
<input type="hidden" name="case_id" value="{$smarty.request.case_id}">   
<input type="hidden" name="bug_id" value="{$smarty.request.bug_id}">   
<input type="hidden" name="email_id" value="{$smarty.request.email_id}">   
<input type="hidden" name="inbound_email_id" value="{$smarty.request.inbound_email_id}">   
<input type="hidden" name="reports_to_id" value="{$smarty.request.contact_id}">   
<input type="hidden" name="report_to_name" value="{$smarty.request.contact_name}">   

<input type="hidden" name="primary_address_street" value="{$smarty.request.primary_address_street}">
<input type="hidden" name="primary_address_city" value="{$smarty.request.primary_address_city}">
<input type="hidden" name="primary_address_state" value="{$smarty.request.primary_address_state}">
<input type="hidden" name="primary_address_country" value="{$smarty.request.primary_address_country}">
<input type="hidden" name="primary_address_postalcode" value="{$smarty.request.primary_address_postalcode}">
<input type="hidden" name="phone_work" value="{$smarty.request.phone_work}">
<input type="hidden" name="is_ajax_call" value="1">
<input type="hidden" name="to_pdf" value="1">

{if $bean->aclAccess("save")}<input title="{$APP.LBL_SAVE_BUTTON_TITLE}" accessKey="{$APP.LBL_SAVE_BUTTON_KEY}" class="button" onclick="this.form.action.value='Save';if(check_form('form_SubpanelQuickCreate_Contacts'))return SUGAR.subpanelUtils.inlineSave(this.form.id, 'Contacts_subpanel_save_button');return false;" type="submit" name="Contacts_subpanel_save_button" id="Contacts_subpanel_save_button" value="{$APP.LBL_SAVE_BUTTON_LABEL}">{/if} 
<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="return SUGAR.subpanelUtils.cancelCreate('Contacts_subpanel_cancel_button');return false;" type="submit" name="Contacts_subpanel_cancel_button" id="Contacts_subpanel_cancel_button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}"> 
<input title="{$APP.LBL_FULL_FORM_BUTTON_TITLE}" accessKey="{$APP.LBL_FULL_FORM_BUTTON_KEY}" class="button" onclick="disableOnUnloadEditView(this.form); this.form.return_action.value='DetailView'; this.form.action.value='EditView'; if(typeof(this.form.to_pdf)!='undefined') this.form.to_pdf.value='0';" type="submit" name="Contacts_subpanel_full_form_button" id="Contacts_subpanel_full_form_button" value="{$APP.LBL_FULL_FORM_BUTTON_LABEL}"> <input type="hidden" name="full_form" value="full_form">
{if $bean->aclAccess("detail")}{if !empty($fields.id.value) && $isAuditEnabled}<input title="{$APP.LNK_VIEW_CHANGE_LOG}" class="button" onclick='open_popup("Audit", "600", "400", "&record={$fields.id.value}&module_name=Contacts", true, false,  {ldelim} "call_back_function":"set_return","form_name":"EditView","field_to_name_array":[] {rdelim} ); return false;' type="submit" value="{$APP.LNK_VIEW_CHANGE_LOG}">{/if}{/if}
</td>
<td align='right'></td>
</tr>
</table>{sugar_include include=$includes}
<div id="form_SubpanelQuickCreate_Contacts_tabs" 
>
<div >
<div id="DEFAULT">
{counter name="panelFieldCount" start=0 print=false assign="panelFieldCount"}
<table width="100%" border="0" cellspacing="1" cellpadding="0"  class="{$def.templateMeta.panelClass|default:'edit view'}">
<tr>
<td valign="top" id='first_name_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_FIRST_NAME' module='Contacts'}
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
maxlength='100' 
value='{$value}' title='' tabindex='100' > 
<td valign="top" id='account_name_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_ACCOUNT_NAME' module='Contacts'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' >
{counter name="panelFieldCount"}

<input type="text" name="{$fields.account_name.name}" class="sqsEnabled" tabindex="101" id="{$fields.account_name.name}" size="" value="{$fields.account_name.value}" title='' autocomplete="off"  >
<input type="hidden" name="{$fields.account_name.id_name}" 
id="{$fields.account_name.id_name}" 
value="{$fields.account_id.value}">
<span class="id-ff multiple">
<button type="button" name="btn_{$fields.account_name.name}" id="btn_{$fields.account_name.name}" tabindex="101" title="{$APP.LBL_SELECT_BUTTON_TITLE}" accessKey="{$APP.LBL_SELECT_BUTTON_KEY}" class="button firstChild" value="{$APP.LBL_SELECT_BUTTON_LABEL}" 
onclick='open_popup(
"{$fields.account_name.module}", 
600, 
400, 
"", 
true, 
false, 
{literal}{"call_back_function":"set_return","form_name":"form_SubpanelQuickCreate_Contacts","field_to_name_array":{"id":"account_id","name":"account_name"}}{/literal}, 
"single", 
true
);' ><img src="{sugar_getimagepath file="id-ff-select.png"}"></button><button type="button" name="btn_clr_{$fields.account_name.name}" id="btn_clr_{$fields.account_name.name}" tabindex="101" title="{$APP.LBL_CLEAR_BUTTON_TITLE}" accessKey="{$APP.LBL_CLEAR_BUTTON_KEY}" class="button lastChild" 
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
<td valign="top" id='last_name_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_LAST_NAME' module='Contacts'}
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
maxlength='100' 
value='{$value}' title='' tabindex='102' > 
<td valign="top" id='phone_work_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_OFFICE_PHONE' module='Contacts'}
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
maxlength='100' 
value='{$value}' title='' tabindex='103' > 
</tr>
<tr>
<td valign="top" id='title_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_TITLE' module='Contacts'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' >
{counter name="panelFieldCount"}

{if strlen($fields.title.value) <= 0}
{assign var="value" value=$fields.title.default_value }
{else}
{assign var="value" value=$fields.title.value }
{/if}  
<input type='text' name='{$fields.title.name}' 
id='{$fields.title.name}' size='30' 
maxlength='100' 
value='{$value}' title='' tabindex='104' > 
<td valign="top" id='phone_mobile_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_MOBILE_PHONE' module='Contacts'}
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
maxlength='100' 
value='{$value}' title='' tabindex='105' > 
</tr>
<tr>
<td valign="top" id='phone_fax_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_FAX_PHONE' module='Contacts'}
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
maxlength='100' 
value='{$value}' title='' tabindex='106' > 
<td valign="top" id='do_not_call_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_DO_NOT_CALL' module='Contacts'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' >
{counter name="panelFieldCount"}

{if strval($fields.do_not_call.value) == "1" || strval($fields.do_not_call.value) == "yes" || strval($fields.do_not_call.value) == "on"} 
{assign var="checked" value="CHECKED"}
{else}
{assign var="checked" value=""}
{/if}
<input type="hidden" name="{$fields.do_not_call.name}" value="0"> 
<input type="checkbox" id="{$fields.do_not_call.name}" 
name="{$fields.do_not_call.name}" 
value="1" title='' tabindex="107" {$checked} >
</tr>
<tr>
<td valign="top" id='email1_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_EMAIL_ADDRESS' module='Contacts'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' >
{counter name="panelFieldCount"}
<span id='email1'>
{$fields.email1.value}</span>
<td valign="top" id='lead_source_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_LEAD_SOURCE' module='Contacts'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' >
{counter name="panelFieldCount"}

<select name="{$fields.lead_source.name}" 
id="{$fields.lead_source.name}" 
title='' tabindex="109"  
>
{if isset($fields.lead_source.value) && $fields.lead_source.value != ''}
{html_options options=$fields.lead_source.options selected=$fields.lead_source.value}
{else}
{html_options options=$fields.lead_source.options selected=$fields.lead_source.default}
{/if}
</select>
</tr>
<tr>
<td valign="top" id='assigned_user_name_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_ASSIGNED_TO_NAME' module='Contacts'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' colspan='3'>
{counter name="panelFieldCount"}

<input type="text" name="{$fields.assigned_user_name.name}" class="sqsEnabled" tabindex="110" id="{$fields.assigned_user_name.name}" size="" value="{$fields.assigned_user_name.value}" title='' autocomplete="off"  >
<input type="hidden" name="{$fields.assigned_user_name.id_name}" 
id="{$fields.assigned_user_name.id_name}" 
value="{$fields.assigned_user_id.value}">
<span class="id-ff multiple">
<button type="button" name="btn_{$fields.assigned_user_name.name}" id="btn_{$fields.assigned_user_name.name}" tabindex="110" title="{$APP.LBL_SELECT_BUTTON_TITLE}" accessKey="{$APP.LBL_SELECT_BUTTON_KEY}" class="button firstChild" value="{$APP.LBL_SELECT_BUTTON_LABEL}" 
onclick='open_popup(
"{$fields.assigned_user_name.module}", 
600, 
400, 
"", 
true, 
false, 
{literal}{"call_back_function":"set_return","form_name":"form_SubpanelQuickCreate_Contacts","field_to_name_array":{"id":"assigned_user_id","user_name":"assigned_user_name"}}{/literal}, 
"single", 
true
);' ><img src="{sugar_getimagepath file="id-ff-select.png"}"></button><button type="button" name="btn_clr_{$fields.assigned_user_name.name}" id="btn_clr_{$fields.assigned_user_name.name}" tabindex="110" title="{$APP.LBL_CLEAR_BUTTON_TITLE}" accessKey="{$APP.LBL_CLEAR_BUTTON_KEY}" class="button lastChild" 
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
</table>
</div>
{if $panelFieldCount == 0}
<script>document.getElementById("DEFAULT").style.display='none';</script>
{/if}
</div></div>

<div class="buttons">
{if $bean->aclAccess("save")}<input title="{$APP.LBL_SAVE_BUTTON_TITLE}" accessKey="{$APP.LBL_SAVE_BUTTON_KEY}" class="button" onclick="this.form.action.value='Save';if(check_form('form_SubpanelQuickCreate_Contacts'))return SUGAR.subpanelUtils.inlineSave(this.form.id, 'Contacts_subpanel_save_button');return false;" type="submit" name="Contacts_subpanel_save_button" id="Contacts_subpanel_save_button" value="{$APP.LBL_SAVE_BUTTON_LABEL}">{/if} 
<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="return SUGAR.subpanelUtils.cancelCreate('Contacts_subpanel_cancel_button');return false;" type="submit" name="Contacts_subpanel_cancel_button" id="Contacts_subpanel_cancel_button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}"> 
<input title="{$APP.LBL_FULL_FORM_BUTTON_TITLE}" accessKey="{$APP.LBL_FULL_FORM_BUTTON_KEY}" class="button" onclick="disableOnUnloadEditView(this.form); this.form.return_action.value='DetailView'; this.form.action.value='EditView'; if(typeof(this.form.to_pdf)!='undefined') this.form.to_pdf.value='0';" type="submit" name="Contacts_subpanel_full_form_button" id="Contacts_subpanel_full_form_button" value="{$APP.LBL_FULL_FORM_BUTTON_LABEL}"> <input type="hidden" name="full_form" value="full_form">
{if $bean->aclAccess("detail")}{if !empty($fields.id.value) && $isAuditEnabled}<input title="{$APP.LNK_VIEW_CHANGE_LOG}" class="button" onclick='open_popup("Audit", "600", "400", "&record={$fields.id.value}&module_name=Contacts", true, false,  {ldelim} "call_back_function":"set_return","form_name":"EditView","field_to_name_array":[] {rdelim} ); return false;' type="submit" value="{$APP.LNK_VIEW_CHANGE_LOG}">{/if}{/if}
</div>
</form>
{$set_focus_block}
<script type="text/javascript">
YAHOO.util.Event.onContentReady("form_QuickCreate_Accounts", 
    function () {ldelim} initEditView(document.forms.form_SubpanelQuickCreate_Contacts) {rdelim});
//window.setTimeout(, 100);
window.onbeforeunload = function () {ldelim} return onUnloadEditView(); {rdelim};
</script>{literal}
<script type="text/javascript">
addToValidate('form_SubpanelQuickCreate_Contacts', 'id', 'id', false,'{/literal}{sugar_translate label='LBL_ID' module='Contacts'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Contacts', 'name', 'name', false,'{/literal}{sugar_translate label='LBL_NAME' module='Contacts'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Contacts', 'date_entered_date', 'date', false,'Date Created' );
addToValidate('form_SubpanelQuickCreate_Contacts', 'date_modified_date', 'date', false,'Date Modified' );
addToValidate('form_SubpanelQuickCreate_Contacts', 'modified_user_id', 'assigned_user_name', false,'{/literal}{sugar_translate label='LBL_MODIFIED' module='Contacts'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Contacts', 'modified_by_name', 'relate', false,'{/literal}{sugar_translate label='LBL_MODIFIED_NAME' module='Contacts'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Contacts', 'created_by', 'assigned_user_name', false,'{/literal}{sugar_translate label='LBL_CREATED' module='Contacts'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Contacts', 'created_by_name', 'relate', false,'{/literal}{sugar_translate label='LBL_CREATED' module='Contacts'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Contacts', 'description', 'text', false,'{/literal}{sugar_translate label='LBL_DESCRIPTION' module='Contacts'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Contacts', 'deleted', 'bool', false,'{/literal}{sugar_translate label='LBL_DELETED' module='Contacts'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Contacts', 'assigned_user_id', 'relate', false,'{/literal}{sugar_translate label='LBL_ASSIGNED_TO_ID' module='Contacts'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Contacts', 'assigned_user_name', 'relate', false,'{/literal}{sugar_translate label='LBL_ASSIGNED_TO_NAME' module='Contacts'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Contacts', 'salutation', 'enum', false,'{/literal}{sugar_translate label='LBL_SALUTATION' module='Contacts'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Contacts', 'first_name', 'varchar', false,'{/literal}{sugar_translate label='LBL_FIRST_NAME' module='Contacts'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Contacts', 'last_name', 'varchar', true,'{/literal}{sugar_translate label='LBL_LAST_NAME' module='Contacts'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Contacts', 'full_name', 'fullname', false,'{/literal}{sugar_translate label='LBL_NAME' module='Contacts'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Contacts', 'title', 'varchar', false,'{/literal}{sugar_translate label='LBL_TITLE' module='Contacts'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Contacts', 'department', 'varchar', false,'{/literal}{sugar_translate label='LBL_DEPARTMENT' module='Contacts'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Contacts', 'do_not_call', 'bool', false,'{/literal}{sugar_translate label='LBL_DO_NOT_CALL' module='Contacts'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Contacts', 'phone_home', 'phone', false,'{/literal}{sugar_translate label='LBL_HOME_PHONE' module='Contacts'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Contacts', 'phone_mobile', 'phone', false,'{/literal}{sugar_translate label='LBL_MOBILE_PHONE' module='Contacts'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Contacts', 'phone_work', 'phone', false,'{/literal}{sugar_translate label='LBL_OFFICE_PHONE' module='Contacts'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Contacts', 'phone_other', 'phone', false,'{/literal}{sugar_translate label='LBL_OTHER_PHONE' module='Contacts'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Contacts', 'phone_fax', 'phone', false,'{/literal}{sugar_translate label='LBL_FAX_PHONE' module='Contacts'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Contacts', 'email1', 'varchar', false,'{/literal}{sugar_translate label='LBL_EMAIL_ADDRESS' module='Contacts'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Contacts', 'email2', 'varchar', false,'{/literal}{sugar_translate label='LBL_OTHER_EMAIL_ADDRESS' module='Contacts'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Contacts', 'invalid_email', 'bool', false,'{/literal}{sugar_translate label='LBL_INVALID_EMAIL' module='Contacts'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Contacts', 'email_opt_out', 'bool', false,'{/literal}{sugar_translate label='LBL_EMAIL_OPT_OUT' module='Contacts'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Contacts', 'primary_address_street', 'varchar', false,'{/literal}{sugar_translate label='LBL_PRIMARY_ADDRESS_STREET' module='Contacts'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Contacts', 'primary_address_street_2', 'varchar', false,'{/literal}{sugar_translate label='LBL_PRIMARY_ADDRESS_STREET_2' module='Contacts'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Contacts', 'primary_address_street_3', 'varchar', false,'{/literal}{sugar_translate label='LBL_PRIMARY_ADDRESS_STREET_3' module='Contacts'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Contacts', 'primary_address_city', 'varchar', false,'{/literal}{sugar_translate label='LBL_PRIMARY_ADDRESS_CITY' module='Contacts'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Contacts', 'primary_address_state', 'varchar', false,'{/literal}{sugar_translate label='LBL_PRIMARY_ADDRESS_STATE' module='Contacts'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Contacts', 'primary_address_postalcode', 'varchar', false,'{/literal}{sugar_translate label='LBL_PRIMARY_ADDRESS_POSTALCODE' module='Contacts'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Contacts', 'primary_address_country', 'varchar', false,'{/literal}{sugar_translate label='LBL_PRIMARY_ADDRESS_COUNTRY' module='Contacts'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Contacts', 'alt_address_street', 'varchar', false,'{/literal}{sugar_translate label='LBL_ALT_ADDRESS_STREET' module='Contacts'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Contacts', 'alt_address_street_2', 'varchar', false,'{/literal}{sugar_translate label='LBL_ALT_ADDRESS_STREET_2' module='Contacts'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Contacts', 'alt_address_street_3', 'varchar', false,'{/literal}{sugar_translate label='LBL_ALT_ADDRESS_STREET_3' module='Contacts'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Contacts', 'alt_address_city', 'varchar', false,'{/literal}{sugar_translate label='LBL_ALT_ADDRESS_CITY' module='Contacts'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Contacts', 'alt_address_state', 'varchar', false,'{/literal}{sugar_translate label='LBL_ALT_ADDRESS_STATE' module='Contacts'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Contacts', 'alt_address_postalcode', 'varchar', false,'{/literal}{sugar_translate label='LBL_ALT_ADDRESS_POSTALCODE' module='Contacts'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Contacts', 'alt_address_country', 'varchar', false,'{/literal}{sugar_translate label='LBL_ALT_ADDRESS_COUNTRY' module='Contacts'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Contacts', 'assistant', 'varchar', false,'{/literal}{sugar_translate label='LBL_ASSISTANT' module='Contacts'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Contacts', 'assistant_phone', 'phone', false,'{/literal}{sugar_translate label='LBL_ASSISTANT_PHONE' module='Contacts'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Contacts', 'email_and_name1', 'varchar', false,'{/literal}{sugar_translate label='LBL_NAME' module='Contacts'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Contacts', 'lead_source', 'enum', false,'{/literal}{sugar_translate label='LBL_LEAD_SOURCE' module='Contacts'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Contacts', 'account_name', 'relate', false,'{/literal}{sugar_translate label='LBL_ACCOUNT_NAME' module='Contacts'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Contacts', 'account_id', 'relate', false,'{/literal}{sugar_translate label='LBL_ACCOUNT_ID' module='Contacts'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Contacts', 'opportunity_role_fields', 'relate', false,'{/literal}{sugar_translate label='LBL_ACCOUNT_NAME' module='Contacts'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Contacts', 'opportunity_role_id', 'varchar', false,'{/literal}{sugar_translate label='LBL_OPPORTUNITY_ROLE_ID' module='Contacts'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Contacts', 'opportunity_role', 'enum', false,'{/literal}{sugar_translate label='LBL_OPPORTUNITY_ROLE' module='Contacts'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Contacts', 'reports_to_id', 'id', false,'{/literal}{sugar_translate label='LBL_REPORTS_TO_ID' module='Contacts'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Contacts', 'report_to_name', 'relate', false,'{/literal}{sugar_translate label='LBL_REPORTS_TO' module='Contacts'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Contacts', 'birthdate', 'date', false,'{/literal}{sugar_translate label='LBL_BIRTHDATE' module='Contacts'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Contacts', 'campaign_id', 'id', false,'{/literal}{sugar_translate label='LBL_CAMPAIGN_ID' module='Contacts'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Contacts', 'campaign_name', 'relate', false,'{/literal}{sugar_translate label='LBL_CAMPAIGN' module='Contacts'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Contacts', 'c_accept_status_fields', 'relate', false,'{/literal}{sugar_translate label='LBL_LIST_ACCEPT_STATUS' module='Contacts'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Contacts', 'm_accept_status_fields', 'relate', false,'{/literal}{sugar_translate label='LBL_LIST_ACCEPT_STATUS' module='Contacts'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Contacts', 'accept_status_id', 'varchar', false,'{/literal}{sugar_translate label='LBL_LIST_ACCEPT_STATUS' module='Contacts'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Contacts', 'accept_status_name', 'enum', false,'{/literal}{sugar_translate label='LBL_LIST_ACCEPT_STATUS' module='Contacts'}{literal}' );
addToValidate('form_SubpanelQuickCreate_Contacts', 'sync_contact', 'bool', false,'{/literal}{sugar_translate label='LBL_SYNC_CONTACT' module='Contacts'}{literal}' );
addToValidateBinaryDependency('form_SubpanelQuickCreate_Contacts', 'assigned_user_name', 'alpha', false,'{/literal}{sugar_translate label='ERR_SQS_NO_MATCH_FIELD' module='Contacts'}{literal}: {/literal}{sugar_translate label='LBL_ASSIGNED_TO' module='Contacts'}{literal}', 'assigned_user_id' );
addToValidateBinaryDependency('form_SubpanelQuickCreate_Contacts', 'account_name', 'alpha', false,'{/literal}{sugar_translate label='ERR_SQS_NO_MATCH_FIELD' module='Contacts'}{literal}: {/literal}{sugar_translate label='LBL_ACCOUNT_NAME' module='Contacts'}{literal}', 'account_id' );
</script><script language="javascript">if(typeof sqs_objects == 'undefined'){var sqs_objects = new Array;}sqs_objects['form_SubpanelQuickCreate_Contacts_account_name']={"form":"form_SubpanelQuickCreate_Contacts","method":"query","modules":["Accounts"],"group":"or","field_list":["name","id"],"populate_list":["form_SubpanelQuickCreate_Contacts_account_name","account_id"],"conditions":[{"name":"name","op":"like_custom","end":"%","value":""}],"required_list":["account_id"],"order":"name","limit":"30","no_match_text":"No Match"};sqs_objects['form_SubpanelQuickCreate_Contacts_assigned_user_name']={"form":"form_SubpanelQuickCreate_Contacts","method":"get_user_array","field_list":["user_name","id"],"populate_list":["assigned_user_name","assigned_user_id"],"required_list":["assigned_user_id"],"conditions":[{"name":"user_name","op":"like_custom","end":"%","value":""}],"limit":"30","no_match_text":"No Match"};</script>{/literal}
