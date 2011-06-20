

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
{if $bean->aclAccess("save")}<input title="{$APP.LBL_SAVE_BUTTON_TITLE}" accessKey="{$APP.LBL_SAVE_BUTTON_KEY}" class="button primary" onclick="this.form.action.value='Popup';return check_form('form_QuickCreate_Accounts')" type="submit" name="Accounts_popupcreate_save_button" id="Accounts_popupcreate_save_button" value="{$APP.LBL_SAVE_BUTTON_LABEL}">{/if} 
<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="toggleDisplay('addform');return false;" name="Accounts_popup_cancel_button" type="submit"id="Accounts_popup_cancel_button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}"> 
{if $bean->aclAccess("detail")}{if !empty($fields.id.value) && $isAuditEnabled}<input title="{$APP.LNK_VIEW_CHANGE_LOG}" class="button" onclick='open_popup("Audit", "600", "400", "&record={$fields.id.value}&module_name=Accounts", true, false,  {ldelim} "call_back_function":"set_return","form_name":"EditView","field_to_name_array":[] {rdelim} ); return false;' type="submit" value="{$APP.LNK_VIEW_CHANGE_LOG}">{/if}{/if}
</td>
<td align='right'>
{$PAGINATION}
</td>
</tr>
</table>{sugar_include include=$includes}
<div id="form_QuickCreate_Accounts_tabs" 
>
<div >
<div id="DEFAULT">
{counter name="panelFieldCount" start=0 print=false assign="panelFieldCount"}
<table width="100%" border="0" cellspacing="1" cellpadding="0"  class="{$def.templateMeta.panelClass|default:'edit view'}">
<tr>
<td valign="top" id='name_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_NAME' module='Accounts'}
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
maxlength='150' 
value='{$value}' title='' tabindex='100' > 
</tr>
<tr>
<td valign="top" id='website_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_WEBSITE' module='Accounts'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' >
{counter name="panelFieldCount"}

{if !empty($fields.website.value)}
<input type='text' name='{$fields.website.name}' id='{$fields.website.name}' size='30' 
maxlength='255' value='{$fields.website.value}' title='' tabindex='101'>
{else}
<input type='text' name='{$fields.website.name}' id='{$fields.website.name}' size='30' 
maxlength='255' 
{if $displayView=='advanced_search'||$displayView=='basic_search'}value=''{else}value='http://'{/if} title='' tabindex='101'>
{/if}
<td valign="top" id='phone_office_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_PHONE_OFFICE' module='Accounts'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' >
{counter name="panelFieldCount"}

{if strlen($fields.phone_office.value) <= 0}
{assign var="value" value=$fields.phone_office.default_value }
{else}
{assign var="value" value=$fields.phone_office.value }
{/if}  
<input type='text' name='{$fields.phone_office.name}' 
id='{$fields.phone_office.name}' size='30' 
maxlength='100' 
value='{$value}' title='' tabindex='102' > 
</tr>
<tr>
<td valign="top" id='email1_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_EMAIL' module='Accounts'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' >
{counter name="panelFieldCount"}
<span id='email1'>
{$fields.email1.value}</span>
<td valign="top" id='phone_fax_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_FAX' module='Accounts'}
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
value='{$value}' title='' tabindex='104' > 
</tr>
<tr>
<td valign="top" id='industry_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_INDUSTRY' module='Accounts'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' >
{counter name="panelFieldCount"}

<select name="{$fields.industry.name}" 
id="{$fields.industry.name}" 
title='' tabindex="105"  
>
{if isset($fields.industry.value) && $fields.industry.value != ''}
{html_options options=$fields.industry.options selected=$fields.industry.value}
{else}
{html_options options=$fields.industry.options selected=$fields.industry.default}
{/if}
</select>
<td valign="top" id='account_type_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_TYPE' module='Accounts'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' >
{counter name="panelFieldCount"}

<select name="{$fields.account_type.name}" 
id="{$fields.account_type.name}" 
title='' tabindex="106"  
>
{if isset($fields.account_type.value) && $fields.account_type.value != ''}
{html_options options=$fields.account_type.options selected=$fields.account_type.value}
{else}
{html_options options=$fields.account_type.options selected=$fields.account_type.default}
{/if}
</select>
</tr>
<tr>
<td valign="top" id='assigned_user_name_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_ASSIGNED_TO' module='Accounts'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' colspan='3'>
{counter name="panelFieldCount"}

<input type="text" name="{$fields.assigned_user_name.name}" class="sqsEnabled" tabindex="107" id="{$fields.assigned_user_name.name}" size="" value="{$fields.assigned_user_name.value}" title='' autocomplete="off"  >
<input type="hidden" name="{$fields.assigned_user_name.id_name}" 
id="{$fields.assigned_user_name.id_name}" 
value="{$fields.assigned_user_id.value}">
<span class="id-ff multiple">
<button type="button" name="btn_{$fields.assigned_user_name.name}" id="btn_{$fields.assigned_user_name.name}" tabindex="107" title="{$APP.LBL_SELECT_BUTTON_TITLE}" accessKey="{$APP.LBL_SELECT_BUTTON_KEY}" class="button firstChild" value="{$APP.LBL_SELECT_BUTTON_LABEL}" 
onclick='open_popup(
"{$fields.assigned_user_name.module}", 
600, 
400, 
"", 
true, 
false, 
{literal}{"call_back_function":"set_return","form_name":"form_QuickCreate_Accounts","field_to_name_array":{"id":"assigned_user_id","user_name":"assigned_user_name"}}{/literal}, 
"single", 
true
);' ><img src="{sugar_getimagepath file="id-ff-select.png"}"></button><button type="button" name="btn_clr_{$fields.assigned_user_name.name}" id="btn_clr_{$fields.assigned_user_name.name}" tabindex="107" title="{$APP.LBL_CLEAR_BUTTON_TITLE}" accessKey="{$APP.LBL_CLEAR_BUTTON_KEY}" class="button lastChild" 
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
{if $bean->aclAccess("save")}<input title="{$APP.LBL_SAVE_BUTTON_TITLE}" accessKey="{$APP.LBL_SAVE_BUTTON_KEY}" class="button primary" onclick="this.form.action.value='Popup';return check_form('form_QuickCreate_Accounts')" type="submit" name="Accounts_popupcreate_save_button" id="Accounts_popupcreate_save_button" value="{$APP.LBL_SAVE_BUTTON_LABEL}">{/if} 
<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="toggleDisplay('addform');return false;" name="Accounts_popup_cancel_button" type="submit"id="Accounts_popup_cancel_button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}"> 
{if $bean->aclAccess("detail")}{if !empty($fields.id.value) && $isAuditEnabled}<input title="{$APP.LNK_VIEW_CHANGE_LOG}" class="button" onclick='open_popup("Audit", "600", "400", "&record={$fields.id.value}&module_name=Accounts", true, false,  {ldelim} "call_back_function":"set_return","form_name":"EditView","field_to_name_array":[] {rdelim} ); return false;' type="submit" value="{$APP.LNK_VIEW_CHANGE_LOG}">{/if}{/if}
</div>
</form>
{$set_focus_block}
<script type="text/javascript">
YAHOO.util.Event.onContentReady("form_QuickCreate_Accounts", 
    function () {ldelim} initEditView(document.forms.form_QuickCreate_Accounts) {rdelim});
//window.setTimeout(, 100);
window.onbeforeunload = function () {ldelim} return onUnloadEditView(); {rdelim};
</script>{literal}
<script type="text/javascript">
addToValidate('form_QuickCreate_Accounts', 'id', 'id', false,'{/literal}{sugar_translate label='LBL_ID' module='Accounts'}{literal}' );
addToValidate('form_QuickCreate_Accounts', 'name', 'name', true,'{/literal}{sugar_translate label='LBL_NAME' module='Accounts'}{literal}' );
addToValidate('form_QuickCreate_Accounts', 'date_entered_date', 'date', false,'Date Created' );
addToValidate('form_QuickCreate_Accounts', 'date_modified_date', 'date', false,'Date Modified' );
addToValidate('form_QuickCreate_Accounts', 'modified_user_id', 'assigned_user_name', false,'{/literal}{sugar_translate label='LBL_MODIFIED' module='Accounts'}{literal}' );
addToValidate('form_QuickCreate_Accounts', 'modified_by_name', 'relate', false,'{/literal}{sugar_translate label='LBL_MODIFIED_NAME' module='Accounts'}{literal}' );
addToValidate('form_QuickCreate_Accounts', 'created_by', 'assigned_user_name', false,'{/literal}{sugar_translate label='LBL_CREATED' module='Accounts'}{literal}' );
addToValidate('form_QuickCreate_Accounts', 'created_by_name', 'relate', false,'{/literal}{sugar_translate label='LBL_CREATED' module='Accounts'}{literal}' );
addToValidate('form_QuickCreate_Accounts', 'description', 'text', false,'{/literal}{sugar_translate label='LBL_DESCRIPTION' module='Accounts'}{literal}' );
addToValidate('form_QuickCreate_Accounts', 'deleted', 'bool', false,'{/literal}{sugar_translate label='LBL_DELETED' module='Accounts'}{literal}' );
addToValidate('form_QuickCreate_Accounts', 'assigned_user_id', 'relate', false,'{/literal}{sugar_translate label='LBL_ASSIGNED_TO_ID' module='Accounts'}{literal}' );
addToValidate('form_QuickCreate_Accounts', 'assigned_user_name', 'relate', false,'{/literal}{sugar_translate label='LBL_ASSIGNED_TO_NAME' module='Accounts'}{literal}' );
addToValidate('form_QuickCreate_Accounts', 'account_type', 'enum', false,'{/literal}{sugar_translate label='LBL_TYPE' module='Accounts'}{literal}' );
addToValidate('form_QuickCreate_Accounts', 'industry', 'enum', false,'{/literal}{sugar_translate label='LBL_INDUSTRY' module='Accounts'}{literal}' );
addToValidate('form_QuickCreate_Accounts', 'annual_revenue', 'varchar', false,'{/literal}{sugar_translate label='LBL_ANNUAL_REVENUE' module='Accounts'}{literal}' );
addToValidate('form_QuickCreate_Accounts', 'phone_fax', 'phone', false,'{/literal}{sugar_translate label='LBL_FAX' module='Accounts'}{literal}' );
addToValidate('form_QuickCreate_Accounts', 'billing_address_street', 'varchar', false,'{/literal}{sugar_translate label='LBL_BILLING_ADDRESS_STREET' module='Accounts'}{literal}' );
addToValidate('form_QuickCreate_Accounts', 'billing_address_street_2', 'varchar', false,'{/literal}{sugar_translate label='LBL_BILLING_ADDRESS_STREET_2' module='Accounts'}{literal}' );
addToValidate('form_QuickCreate_Accounts', 'billing_address_street_3', 'varchar', false,'{/literal}{sugar_translate label='LBL_BILLING_ADDRESS_STREET_3' module='Accounts'}{literal}' );
addToValidate('form_QuickCreate_Accounts', 'billing_address_street_4', 'varchar', false,'{/literal}{sugar_translate label='LBL_BILLING_ADDRESS_STREET_4' module='Accounts'}{literal}' );
addToValidate('form_QuickCreate_Accounts', 'billing_address_city', 'varchar', false,'{/literal}{sugar_translate label='LBL_BILLING_ADDRESS_CITY' module='Accounts'}{literal}' );
addToValidate('form_QuickCreate_Accounts', 'billing_address_state', 'varchar', false,'{/literal}{sugar_translate label='LBL_BILLING_ADDRESS_STATE' module='Accounts'}{literal}' );
addToValidate('form_QuickCreate_Accounts', 'billing_address_postalcode', 'varchar', false,'{/literal}{sugar_translate label='LBL_BILLING_ADDRESS_POSTALCODE' module='Accounts'}{literal}' );
addToValidate('form_QuickCreate_Accounts', 'billing_address_country', 'varchar', false,'{/literal}{sugar_translate label='LBL_BILLING_ADDRESS_COUNTRY' module='Accounts'}{literal}' );
addToValidate('form_QuickCreate_Accounts', 'rating', 'varchar', false,'{/literal}{sugar_translate label='LBL_RATING' module='Accounts'}{literal}' );
addToValidate('form_QuickCreate_Accounts', 'phone_office', 'phone', false,'{/literal}{sugar_translate label='LBL_PHONE_OFFICE' module='Accounts'}{literal}' );
addToValidate('form_QuickCreate_Accounts', 'phone_alternate', 'phone', false,'{/literal}{sugar_translate label='LBL_PHONE_ALT' module='Accounts'}{literal}' );
addToValidate('form_QuickCreate_Accounts', 'website', 'url', false,'{/literal}{sugar_translate label='LBL_WEBSITE' module='Accounts'}{literal}' );
addToValidate('form_QuickCreate_Accounts', 'ownership', 'varchar', false,'{/literal}{sugar_translate label='LBL_OWNERSHIP' module='Accounts'}{literal}' );
addToValidate('form_QuickCreate_Accounts', 'employees', 'varchar', false,'{/literal}{sugar_translate label='LBL_EMPLOYEES' module='Accounts'}{literal}' );
addToValidate('form_QuickCreate_Accounts', 'ticker_symbol', 'varchar', false,'{/literal}{sugar_translate label='LBL_TICKER_SYMBOL' module='Accounts'}{literal}' );
addToValidate('form_QuickCreate_Accounts', 'shipping_address_street', 'varchar', false,'{/literal}{sugar_translate label='LBL_SHIPPING_ADDRESS_STREET' module='Accounts'}{literal}' );
addToValidate('form_QuickCreate_Accounts', 'shipping_address_street_2', 'varchar', false,'{/literal}{sugar_translate label='LBL_SHIPPING_ADDRESS_STREET_2' module='Accounts'}{literal}' );
addToValidate('form_QuickCreate_Accounts', 'shipping_address_street_3', 'varchar', false,'{/literal}{sugar_translate label='LBL_SHIPPING_ADDRESS_STREET_3' module='Accounts'}{literal}' );
addToValidate('form_QuickCreate_Accounts', 'shipping_address_street_4', 'varchar', false,'{/literal}{sugar_translate label='LBL_SHIPPING_ADDRESS_STREET_4' module='Accounts'}{literal}' );
addToValidate('form_QuickCreate_Accounts', 'shipping_address_city', 'varchar', false,'{/literal}{sugar_translate label='LBL_SHIPPING_ADDRESS_CITY' module='Accounts'}{literal}' );
addToValidate('form_QuickCreate_Accounts', 'shipping_address_state', 'varchar', false,'{/literal}{sugar_translate label='LBL_SHIPPING_ADDRESS_STATE' module='Accounts'}{literal}' );
addToValidate('form_QuickCreate_Accounts', 'shipping_address_postalcode', 'varchar', false,'{/literal}{sugar_translate label='LBL_SHIPPING_ADDRESS_POSTALCODE' module='Accounts'}{literal}' );
addToValidate('form_QuickCreate_Accounts', 'shipping_address_country', 'varchar', false,'{/literal}{sugar_translate label='LBL_SHIPPING_ADDRESS_COUNTRY' module='Accounts'}{literal}' );
addToValidate('form_QuickCreate_Accounts', 'email1', 'varchar', false,'{/literal}{sugar_translate label='LBL_EMAIL' module='Accounts'}{literal}' );
addToValidate('form_QuickCreate_Accounts', 'parent_id', 'id', false,'{/literal}{sugar_translate label='LBL_PARENT_ACCOUNT_ID' module='Accounts'}{literal}' );
addToValidate('form_QuickCreate_Accounts', 'sic_code', 'varchar', false,'{/literal}{sugar_translate label='LBL_SIC_CODE' module='Accounts'}{literal}' );
addToValidate('form_QuickCreate_Accounts', 'parent_name', 'relate', false,'{/literal}{sugar_translate label='LBL_MEMBER_OF' module='Accounts'}{literal}' );
addToValidate('form_QuickCreate_Accounts', 'email_opt_out', 'bool', false,'{/literal}{sugar_translate label='LBL_EMAIL_OPT_OUT' module='Accounts'}{literal}' );
addToValidate('form_QuickCreate_Accounts', 'invalid_email', 'bool', false,'{/literal}{sugar_translate label='LBL_INVALID_EMAIL' module='Accounts'}{literal}' );
addToValidate('form_QuickCreate_Accounts', 'campaign_id', 'id', false,'{/literal}{sugar_translate label='LBL_CAMPAIGN_ID' module='Accounts'}{literal}' );
addToValidate('form_QuickCreate_Accounts', 'campaign_name', 'relate', false,'{/literal}{sugar_translate label='LBL_CAMPAIGN' module='Accounts'}{literal}' );
addToValidateBinaryDependency('form_QuickCreate_Accounts', 'assigned_user_name', 'alpha', false,'{/literal}{sugar_translate label='ERR_SQS_NO_MATCH_FIELD' module='Accounts'}{literal}: {/literal}{sugar_translate label='LBL_ASSIGNED_TO' module='Accounts'}{literal}', 'assigned_user_id' );
</script><script language="javascript">if(typeof sqs_objects == 'undefined'){var sqs_objects = new Array;}sqs_objects['form_QuickCreate_Accounts_assigned_user_name']={"form":"form_QuickCreate_Accounts","method":"get_user_array","field_list":["user_name","id"],"populate_list":["assigned_user_name","assigned_user_id"],"required_list":["assigned_user_id"],"conditions":[{"name":"user_name","op":"like_custom","end":"%","value":""}],"limit":"30","no_match_text":"No Match"};</script>{/literal}
