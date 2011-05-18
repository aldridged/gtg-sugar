

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
{if !empty($smarty.request.return_action) && ($smarty.request.return_action == "DetailView" && !empty($smarty.request.return_id))}<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="window.location.href='index.php?action=DetailView&module={$smarty.request.return_module}&record={$smarty.request.return_id}'; return false;" name="button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}" type="button"> {elseif !empty($smarty.request.return_action) && ($smarty.request.return_action == "DetailView" && !empty($fields.id.value))}<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="window.location.href='index.php?action=DetailView&module={$smarty.request.return_module}&record={$fields.id.value}'; return false;" type="button" name="button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}"> {elseif empty($smarty.request.return_action) || empty($smarty.request.return_id) && !empty($fields.id.value)}<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="window.location.href='index.php?action=index&module=AOS_Invoices'; return false;" type="button" name="button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}"> {else}<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="window.location.href='index.php?action=index&module={$smarty.request.return_module}&record={$smarty.request.return_id}'; return false;" type="button" name="button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}"> {/if}
{if $bean->aclAccess("detail")}{if !empty($fields.id.value) && $isAuditEnabled}<input title="{$APP.LNK_VIEW_CHANGE_LOG}" class="button" onclick='open_popup("Audit", "600", "400", "&record={$fields.id.value}&module_name=AOS_Invoices", true, false,  {ldelim} "call_back_function":"set_return","form_name":"EditView","field_to_name_array":[] {rdelim} ); return false;' type="submit" value="{$APP.LNK_VIEW_CHANGE_LOG}">{/if}{/if}
</td>
<td align='right'>
{$PAGINATION}
</td>
</tr>
</table>{sugar_include include=$includes}
<div id="EditView_tabs" 
>
<div >
<div id="LBL_ACCOUNT_INFORMATION">
{counter name="panelFieldCount" start=0 print=false assign="panelFieldCount"}
<table width="100%" border="0" cellspacing="1" cellpadding="0"  class="{$def.templateMeta.panelClass|default:'edit view'}">
<tr>
<th align="left" colspan="8">
<h4>{sugar_translate label='LBL_ACCOUNT_INFORMATION' module='AOS_Invoices'}</h4>
</th>
</tr>
<tr>
<td valign="top" id='name_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_NAME' module='AOS_Invoices'}
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
id='{$fields.name.name}' size='30' 
maxlength='150' 
value='{$value}' title='' tabindex='100' > 
<td valign="top" id='number_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_INVOICE_NUMBER' module='AOS_Invoices'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' >
{counter name="panelFieldCount"}
{$fields.number.value}
</tr>
<tr>
<td valign="top" id='quote_number_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_QUOTE_NUMBER' module='AOS_Invoices'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' >
{counter name="panelFieldCount"}

{if strlen($fields.quote_number.value) <= 0}
{assign var="value" value=$fields.quote_number.default_value }
{else}
{assign var="value" value=$fields.quote_number.value }
{/if}  
<input type='text' name='{$fields.quote_number.name}' 
id='{$fields.quote_number.name}' size='30' maxlength='' value='{sugar_number_format precision=0 var=$value}' title='' tabindex='102' > 
<td valign="top" id='due_date_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_DUE_DATE' module='AOS_Invoices'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' >
{counter name="panelFieldCount"}

{assign var=date_value value=$fields.due_date.value }
<input autocomplete="off" type="text" name="{$fields.due_date.name}" id="{$fields.due_date.name}" value="{$date_value}" title=''  tabindex='103' size="11" maxlength="10">
<img border="0" src="{sugar_getimagepath file='jscalendar.gif'}" alt="{$APP.LBL_ENTER_DATE}" id="{$fields.due_date.name}_trigger" align="absmiddle" />
<script type="text/javascript">
Calendar.setup ({ldelim}
inputField : "{$fields.due_date.name}",
daFormat : "{$CALENDAR_FORMAT}",
button : "{$fields.due_date.name}_trigger",
singleClick : true,
dateStr : "{$date_value}",
step : 1,
weekNumbers:false
{rdelim}
);
</script>
</tr>
<tr>
<td valign="top" id='quote_date_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_QUOTE_DATE' module='AOS_Invoices'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' >
{counter name="panelFieldCount"}

{assign var=date_value value=$fields.quote_date.value }
<input autocomplete="off" type="text" name="{$fields.quote_date.name}" id="{$fields.quote_date.name}" value="{$date_value}" title=''  tabindex='104' size="11" maxlength="10">
<img border="0" src="{sugar_getimagepath file='jscalendar.gif'}" alt="{$APP.LBL_ENTER_DATE}" id="{$fields.quote_date.name}_trigger" align="absmiddle" />
<script type="text/javascript">
Calendar.setup ({ldelim}
inputField : "{$fields.quote_date.name}",
daFormat : "{$CALENDAR_FORMAT}",
button : "{$fields.quote_date.name}_trigger",
singleClick : true,
dateStr : "{$date_value}",
step : 1,
weekNumbers:false
{rdelim}
);
</script>
<td valign="top" id='invoice_date_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_INVOICE_DATE' module='AOS_Invoices'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' >
{counter name="panelFieldCount"}

{assign var=date_value value=$fields.invoice_date.value }
<input autocomplete="off" type="text" name="{$fields.invoice_date.name}" id="{$fields.invoice_date.name}" value="{$date_value}" title=''  tabindex='105' size="11" maxlength="10">
<img border="0" src="{sugar_getimagepath file='jscalendar.gif'}" alt="{$APP.LBL_ENTER_DATE}" id="{$fields.invoice_date.name}_trigger" align="absmiddle" />
<script type="text/javascript">
Calendar.setup ({ldelim}
inputField : "{$fields.invoice_date.name}",
daFormat : "{$CALENDAR_FORMAT}",
button : "{$fields.invoice_date.name}_trigger",
singleClick : true,
dateStr : "{$date_value}",
step : 1,
weekNumbers:false
{rdelim}
);
</script>
</tr>
<tr>
<td valign="top" id='assigned_user_name_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_ASSIGNED_TO_NAME' module='AOS_Invoices'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' >
{counter name="panelFieldCount"}

<input type="text" name="{$fields.assigned_user_name.name}" class="sqsEnabled" tabindex="106" id="{$fields.assigned_user_name.name}" size="" value="{$fields.assigned_user_name.value}" title='' autocomplete="off"  >
<input type="hidden" name="{$fields.assigned_user_name.id_name}" 
id="{$fields.assigned_user_name.id_name}" 
value="{$fields.assigned_user_id.value}">
<span class="id-ff multiple">
<button type="button" name="btn_{$fields.assigned_user_name.name}" id="btn_{$fields.assigned_user_name.name}" tabindex="106" title="{$APP.LBL_SELECT_BUTTON_TITLE}" accessKey="{$APP.LBL_SELECT_BUTTON_KEY}" class="button firstChild" value="{$APP.LBL_SELECT_BUTTON_LABEL}" 
onclick='open_popup(
"{$fields.assigned_user_name.module}", 
600, 
400, 
"", 
true, 
false, 
{literal}{"call_back_function":"set_return","form_name":"EditView","field_to_name_array":{"id":"assigned_user_id","user_name":"assigned_user_name"}}{/literal}, 
"single", 
true
);' ><img src="{sugar_getimagepath file="id-ff-select.png"}"></button><button type="button" name="btn_clr_{$fields.assigned_user_name.name}" id="btn_clr_{$fields.assigned_user_name.name}" tabindex="106" title="{$APP.LBL_CLEAR_BUTTON_TITLE}" accessKey="{$APP.LBL_CLEAR_BUTTON_KEY}" class="button lastChild" 
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
<td valign="top" id='status_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_STATUS' module='AOS_Invoices'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' >
{counter name="panelFieldCount"}

<select name="{$fields.status.name}" 
id="{$fields.status.name}" 
title='' tabindex="107"  
>
{if isset($fields.status.value) && $fields.status.value != ''}
{html_options options=$fields.status.options selected=$fields.status.value}
{else}
{html_options options=$fields.status.options selected=$fields.status.default}
{/if}
</select>
</tr>
<tr>
<td valign="top" id='description_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_DESCRIPTION' module='AOS_Invoices'}
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
title='' tabindex="108" >{$value}</textarea>
</tr>
</table>
</div>
{if $panelFieldCount == 0}
<script>document.getElementById("LBL_ACCOUNT_INFORMATION").style.display='none';</script>
{/if}
<div id="LBL_ADDRESS_INFORMATION">
{counter name="panelFieldCount" start=0 print=false assign="panelFieldCount"}
<table width="100%" border="0" cellspacing="1" cellpadding="0"  class="{$def.templateMeta.panelClass|default:'edit view'}">
<tr>
<th align="left" colspan="8">
<h4>{sugar_translate label='LBL_ADDRESS_INFORMATION' module='AOS_Invoices'}</h4>
</th>
</tr>
<tr>
<td valign="top" id='billing_account_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_BILLING_ACCOUNT' module='AOS_Invoices'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' >
{counter name="panelFieldCount"}
{$BillingAccount}
<td valign="top" id='_label' width='12.5%' scope="row">
</td>
<td valign="top" width='37.5%' >
</tr>
<tr>
<td valign="top" id='billing_contact_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_BILLING_CONTACT' module='AOS_Invoices'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' >
{counter name="panelFieldCount"}

<input type="text" name="{$fields.billing_contact.name}" class="sqsEnabled" tabindex="111" id="{$fields.billing_contact.name}" size="" value="{$fields.billing_contact.value}" title='' autocomplete="off"  >
<input type="hidden" name="{$fields.billing_contact.id_name}" 
id="{$fields.billing_contact.id_name}" 
value="{$fields.billing_contact_id.value}">
<span class="id-ff multiple">
<button type="button" name="btn_{$fields.billing_contact.name}" id="btn_{$fields.billing_contact.name}" tabindex="111" title="{$APP.LBL_SELECT_BUTTON_TITLE}" accessKey="{$APP.LBL_SELECT_BUTTON_KEY}" class="button firstChild" value="{$APP.LBL_SELECT_BUTTON_LABEL}" 
onclick='open_popup(
"{$fields.billing_contact.module}", 
600, 
400, 
"", 
true, 
false, 
{literal}{"call_back_function":"set_return","form_name":"EditView","field_to_name_array":{"id":"billing_contact_id","name":"billing_contact"}}{/literal}, 
"single", 
true
);' ><img src="{sugar_getimagepath file="id-ff-select.png"}"></button><button type="button" name="btn_clr_{$fields.billing_contact.name}" id="btn_clr_{$fields.billing_contact.name}" tabindex="111" title="{$APP.LBL_CLEAR_BUTTON_TITLE}" accessKey="{$APP.LBL_CLEAR_BUTTON_KEY}" class="button lastChild" 
onclick="this.form.{$fields.billing_contact.name}.value = ''; this.form.{$fields.billing_contact.id_name}.value = '';" 
value="{$APP.LBL_CLEAR_BUTTON_LABEL}" ><img src="{sugar_getimagepath file="id-ff-clear.png"}"></button>
</span>
<script type="text/javascript">
<!--
if(typeof QSProcessedFieldsArray != 'undefined') 
	QSProcessedFieldsArray["{$form_name}_{$fields.billing_contact.name}"] = false;
	

enableQS(false);
-->	
</script>
<td valign="top" id='_label' width='12.5%' scope="row">
</td>
<td valign="top" width='37.5%' >
</tr>
<tr>
<td valign="top" width='37.5%' colspan='2'>
{counter name="panelFieldCount"}

<script type="text/javascript" src='{sugar_getjspath file="include/SugarFields/Fields/Address/SugarFieldAddress.js"}'></script>
<fieldset id='BILLING_address_fieldset'>
<legend>{sugar_translate label='LBL_BILLING_ADDRESS' module=''}</legend>
<table border="0" cellspacing="1" cellpadding="0" class="edit" width="100%">
<tr>
<td valign="top" id="billing_address_street_label" width='25%' scope='row' >
{sugar_translate label='LBL_STREET' module=''}:
{if $fields.billing_address_street.required || false}
<span class="required">{$APP.LBL_REQUIRED_SYMBOL}</span>
{/if}
</td>
<td width="*">
<textarea id="billing_address_street" name="billing_address_street" maxlength="150" rows="2" cols="30" tabindex="113">{$fields.billing_address_street.value}</textarea>
</td>
</tr>
<tr>
<td id="billing_address_city_label" width='%' scope='row' >
{sugar_translate label='LBL_CITY' module=''}:
{if $fields.billing_address_city.required || false}
<span class="required">{$APP.LBL_REQUIRED_SYMBOL}</span>
{/if}
</td>
<td>
<input type="text" name="billing_address_city" id="billing_address_city" size="30" maxlength='150' value='{$fields.billing_address_city.value}' tabindex="113">
</td>
</tr>
<tr>
<td id="billing_address_state_label" width='%' scope='row' >
{sugar_translate label='LBL_STATE' module=''}:
{if $fields.billing_address_state.required || false}
<span class="required">{$APP.LBL_REQUIRED_SYMBOL}</span>
{/if}
</td>
<td>
<input type="text" name="billing_address_state" id="billing_address_state" size="30" maxlength='150' value='{$fields.billing_address_state.value}' tabindex="113">
</td>
</tr>
<tr>
<td id="billing_address_postalcode_label" width='%' scope='row' >
{sugar_translate label='LBL_POSTAL_CODE' module=''}:
{if $fields.billing_address_postalcode.required || false}
<span class="required">{$APP.LBL_REQUIRED_SYMBOL}</span>
{/if}
</td>
<td>
<input type="text" name="billing_address_postalcode" id="billing_address_postalcode" size="30" maxlength='150' value='{$fields.billing_address_postalcode.value}' tabindex="113">
</td>
</tr>
<tr>
<td id="billing_address_country_label" width='%' scope='row' >
{sugar_translate label='LBL_COUNTRY' module=''}:
{if $fields.billing_address_country.required || false}
<span class="required">{$APP.LBL_REQUIRED_SYMBOL}</span>
{/if}
</td>
<td>
<input type="text" name="billing_address_country" id="billing_address_country" size="30" maxlength='150' value='{$fields.billing_address_country.value}' tabindex="113">
</td>
</tr>
<tr>
<td colspan='2' NOWRAP>&nbsp;</td>
</tr>
</table>
</fieldset>
<script type="text/javascript">
    var fromKey = '';
    var toKey = 'billing';
    var checkbox = toKey + "_checkbox";
    var obj = new TestCheckboxReady(checkbox);
</script>
<td valign="top" width='37.5%' colspan='2'>
{counter name="panelFieldCount"}

<script type="text/javascript" src='{sugar_getjspath file="include/SugarFields/Fields/Address/SugarFieldAddress.js"}'></script>
<fieldset id='SHIPPING_address_fieldset'>
<legend>{sugar_translate label='LBL_SHIPPING_ADDRESS' module=''}</legend>
<table border="0" cellspacing="1" cellpadding="0" class="edit" width="100%">
<tr>
<td valign="top" id="shipping_address_street_label" width='25%' scope='row' >
{sugar_translate label='LBL_STREET' module=''}:
{if $fields.shipping_address_street.required || false}
<span class="required">{$APP.LBL_REQUIRED_SYMBOL}</span>
{/if}
</td>
<td width="*">
<textarea id="shipping_address_street" name="shipping_address_street" maxlength="150" rows="2" cols="30" tabindex="114">{$fields.shipping_address_street.value}</textarea>
</td>
</tr>
<tr>
<td id="shipping_address_city_label" width='%' scope='row' >
{sugar_translate label='LBL_CITY' module=''}:
{if $fields.shipping_address_city.required || false}
<span class="required">{$APP.LBL_REQUIRED_SYMBOL}</span>
{/if}
</td>
<td>
<input type="text" name="shipping_address_city" id="shipping_address_city" size="30" maxlength='150' value='{$fields.shipping_address_city.value}' tabindex="114">
</td>
</tr>
<tr>
<td id="shipping_address_state_label" width='%' scope='row' >
{sugar_translate label='LBL_STATE' module=''}:
{if $fields.shipping_address_state.required || false}
<span class="required">{$APP.LBL_REQUIRED_SYMBOL}</span>
{/if}
</td>
<td>
<input type="text" name="shipping_address_state" id="shipping_address_state" size="30" maxlength='150' value='{$fields.shipping_address_state.value}' tabindex="114">
</td>
</tr>
<tr>
<td id="shipping_address_postalcode_label" width='%' scope='row' >
{sugar_translate label='LBL_POSTAL_CODE' module=''}:
{if $fields.shipping_address_postalcode.required || false}
<span class="required">{$APP.LBL_REQUIRED_SYMBOL}</span>
{/if}
</td>
<td>
<input type="text" name="shipping_address_postalcode" id="shipping_address_postalcode" size="30" maxlength='150' value='{$fields.shipping_address_postalcode.value}' tabindex="114">
</td>
</tr>
<tr>
<td id="shipping_address_country_label" width='%' scope='row' >
{sugar_translate label='LBL_COUNTRY' module=''}:
{if $fields.shipping_address_country.required || false}
<span class="required">{$APP.LBL_REQUIRED_SYMBOL}</span>
{/if}
</td>
<td>
<input type="text" name="shipping_address_country" id="shipping_address_country" size="30" maxlength='150' value='{$fields.shipping_address_country.value}' tabindex="114">
</td>
</tr>
<tr>
<td scope='row' NOWRAP>
{sugar_translate label='LBL_COPY_ADDRESS_FROM_LEFT' module=''}:
</td>
<td>
<input id="shipping_checkbox" name="shipping_checkbox" type="checkbox" onclick="syncFields('billing', 'shipping');"; CHECKED>
</td>
</tr>
</table>
</fieldset>
<script type="text/javascript">
    var fromKey = 'billing';
    var toKey = 'shipping';
    var checkbox = toKey + "_checkbox";
    var obj = new TestCheckboxReady(checkbox);
</script>
</tr>
</table>
</div>
{if $panelFieldCount == 0}
<script>document.getElementById("LBL_ADDRESS_INFORMATION").style.display='none';</script>
{/if}
<div id="LBL_PANEL1">
{counter name="panelFieldCount" start=0 print=false assign="panelFieldCount"}
<table width="100%" border="0" cellspacing="1" cellpadding="0"  class="{$def.templateMeta.panelClass|default:'edit view'}">
<tr>
<th align="left" colspan="8">
<h4>{sugar_translate label='LBL_PANEL1' module='AOS_Invoices'}</h4>
</th>
</tr>
<tr>
<td valign="top" id='template_ddown_c_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_TEMPLATE_DDOWN_C' module='AOS_Invoices'}
{/capture}
{$label|strip_semicolon}:
<span class="required">*</span>
</td>
<td valign="top" width='37.5%' colspan='3'>
{counter name="panelFieldCount"}

<input type="hidden" id="{$fields.template_ddown_c.name}_multiselect"
name="{$fields.template_ddown_c.name}_multiselect" value="true">
{multienum_to_array string=$fields.template_ddown_c.value default=$fields.template_ddown_c.default assign="values"}
<select id="{$fields.template_ddown_c.name}"
name="{$fields.template_ddown_c.name}[]"
multiple="true" size='6' style="width:150" title='' tabindex="115">
{html_options options=$fields.template_ddown_c.options selected=$values}
</select>
<td valign="top" id='_label' width='12.5%' scope="row">
</td>
<td valign="top" width='37.5%' >
</tr>
</table>
</div>
{if $panelFieldCount == 0}
<script>document.getElementById("LBL_PANEL1").style.display='none';</script>
{/if}
<div id="LBL_LINE_ITEMS">
{counter name="panelFieldCount" start=0 print=false assign="panelFieldCount"}
<table width="100%" border="0" cellspacing="1" cellpadding="0"  class="{$def.templateMeta.panelClass|default:'edit view'}">
<tr>
<th align="left" colspan="8">
<h4>{sugar_translate label='LBL_LINE_ITEMS' module='AOS_Invoices'}</h4>
</th>
</tr>
<tr>
<td valign="top" id='line_items_c_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_LINE_ITEMS' module='AOS_Invoices'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' colspan='3'>
{counter name="panelFieldCount"}
{$LINE_ITEMS}
</tr>
<tr>
<td valign="top" id='grand_total_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_GRAND_TOTAL_AMOUNT' module='AOS_Invoices'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' colspan='3'>
{counter name="panelFieldCount"}
{$CURRENCY}
</tr>
<tr>
<td valign="top" id='subtotal_amount_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_SUBTOTAL_AMOUNT' module='AOS_Invoices'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' colspan='3'>
{counter name="panelFieldCount"}

{if strlen($fields.subtotal_amount.value) <= 0}
{assign var="value" value=$fields.subtotal_amount.default_value }
{else}
{assign var="value" value=$fields.subtotal_amount.value }
{/if}  
<input type='text' name='{$fields.subtotal_amount.name}'
id='{$fields.subtotal_amount.name}'
size='30'
maxlength=''value='{sugar_number_format var=$value precision=2 }'
title=''
tabindex='118' > 
</tr>
<tr>
<td valign="top" id='tax_amount_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_TAX_AMOUNT' module='AOS_Invoices'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' colspan='3'>
{counter name="panelFieldCount"}

{if strlen($fields.tax_amount.value) <= 0}
{assign var="value" value=$fields.tax_amount.default_value }
{else}
{assign var="value" value=$fields.tax_amount.value }
{/if}  
<input type='text' name='{$fields.tax_amount.name}'
id='{$fields.tax_amount.name}'
size='30'
maxlength=''value='{sugar_number_format var=$value precision=2 }'
title=''
tabindex='119' > 
</tr>
<tr>
<td valign="top" id='shipping_amount_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_SHIPPING_AMOUNT' module='AOS_Invoices'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' colspan='3'>
{counter name="panelFieldCount"}
<input tabindex="120"  type="text" tabindex="6" title="" value="{$fields.shipping_amount.value}" onBlur="calculateGrandTotal();" maxlength="16" size="30" id="shipping_amount" name="shipping_amount">
</tr>
<tr>
<td valign="top" id='total_amount_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_TOTAL_AMOUNT' module='AOS_Invoices'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' colspan='3'>
{counter name="panelFieldCount"}

{if strlen($fields.total_amount.value) <= 0}
{assign var="value" value=$fields.total_amount.default_value }
{else}
{assign var="value" value=$fields.total_amount.value }
{/if}  
<input type='text' name='{$fields.total_amount.name}'
id='{$fields.total_amount.name}'
size='30'
maxlength=''value='{sugar_number_format var=$value precision=2 }'
title=''
tabindex='121' > 
<td valign="top" id='_label' width='12.5%' scope="row">
</td>
<td valign="top" width='37.5%' >
</tr>
</table>
</div>
{if $panelFieldCount == 0}
<script>document.getElementById("LBL_LINE_ITEMS").style.display='none';</script>
{/if}
</div></div>

<div class="buttons">
{if $bean->aclAccess("save")}<input title="{$APP.LBL_SAVE_BUTTON_TITLE}" accessKey="{$APP.LBL_SAVE_BUTTON_KEY}" class="button primary" onclick="{if $isDuplicate}this.form.return_id.value=''; {/if}this.form.action.value='Save'; return check_form('EditView');" type="submit" name="button" value="{$APP.LBL_SAVE_BUTTON_LABEL}">{/if} 
{if !empty($smarty.request.return_action) && ($smarty.request.return_action == "DetailView" && !empty($smarty.request.return_id))}<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="window.location.href='index.php?action=DetailView&module={$smarty.request.return_module}&record={$smarty.request.return_id}'; return false;" name="button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}" type="button"> {elseif !empty($smarty.request.return_action) && ($smarty.request.return_action == "DetailView" && !empty($fields.id.value))}<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="window.location.href='index.php?action=DetailView&module={$smarty.request.return_module}&record={$fields.id.value}'; return false;" type="button" name="button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}"> {elseif empty($smarty.request.return_action) || empty($smarty.request.return_id) && !empty($fields.id.value)}<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="window.location.href='index.php?action=index&module=AOS_Invoices'; return false;" type="button" name="button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}"> {else}<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="window.location.href='index.php?action=index&module={$smarty.request.return_module}&record={$smarty.request.return_id}'; return false;" type="button" name="button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}"> {/if}
{if $bean->aclAccess("detail")}{if !empty($fields.id.value) && $isAuditEnabled}<input title="{$APP.LNK_VIEW_CHANGE_LOG}" class="button" onclick='open_popup("Audit", "600", "400", "&record={$fields.id.value}&module_name=AOS_Invoices", true, false,  {ldelim} "call_back_function":"set_return","form_name":"EditView","field_to_name_array":[] {rdelim} ); return false;' type="submit" value="{$APP.LNK_VIEW_CHANGE_LOG}">{/if}{/if}
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
addToValidate('EditView', 'id', 'id', false,'{/literal}{sugar_translate label='LBL_ID' module='AOS_Invoices'}{literal}' );
addToValidate('EditView', 'name', 'name', true,'{/literal}{sugar_translate label='LBL_NAME' module='AOS_Invoices'}{literal}' );
addToValidate('EditView', 'date_entered_date', 'date', false,'Date Created' );
addToValidate('EditView', 'date_modified_date', 'date', false,'Date Modified' );
addToValidate('EditView', 'modified_user_id', 'assigned_user_name', false,'{/literal}{sugar_translate label='LBL_MODIFIED' module='AOS_Invoices'}{literal}' );
addToValidate('EditView', 'modified_by_name', 'relate', false,'{/literal}{sugar_translate label='LBL_MODIFIED_NAME' module='AOS_Invoices'}{literal}' );
addToValidate('EditView', 'created_by', 'assigned_user_name', false,'{/literal}{sugar_translate label='LBL_CREATED' module='AOS_Invoices'}{literal}' );
addToValidate('EditView', 'created_by_name', 'relate', false,'{/literal}{sugar_translate label='LBL_CREATED' module='AOS_Invoices'}{literal}' );
addToValidate('EditView', 'description', 'text', false,'{/literal}{sugar_translate label='LBL_DESCRIPTION' module='AOS_Invoices'}{literal}' );
addToValidate('EditView', 'deleted', 'bool', false,'{/literal}{sugar_translate label='LBL_DELETED' module='AOS_Invoices'}{literal}' );
addToValidate('EditView', 'assigned_user_id', 'relate', false,'{/literal}{sugar_translate label='LBL_ASSIGNED_TO_ID' module='AOS_Invoices'}{literal}' );
addToValidate('EditView', 'assigned_user_name', 'relate', false,'{/literal}{sugar_translate label='LBL_ASSIGNED_TO_NAME' module='AOS_Invoices'}{literal}' );
addToValidate('EditView', 'aos_invoices_type', 'enum', false,'{/literal}{sugar_translate label='LBL_TYPE' module='AOS_Invoices'}{literal}' );
addToValidate('EditView', 'industry', 'enum', false,'{/literal}{sugar_translate label='LBL_INDUSTRY' module='AOS_Invoices'}{literal}' );
addToValidate('EditView', 'annual_revenue', 'varchar', false,'{/literal}{sugar_translate label='LBL_ANNUAL_REVENUE' module='AOS_Invoices'}{literal}' );
addToValidate('EditView', 'phone_fax', 'phone', false,'{/literal}{sugar_translate label='LBL_FAX' module='AOS_Invoices'}{literal}' );
addToValidate('EditView', 'billing_address_street', 'varchar', false,'{/literal}{sugar_translate label='LBL_BILLING_ADDRESS_STREET' module='AOS_Invoices'}{literal}' );
addToValidate('EditView', 'billing_address_street_2', 'varchar', false,'{/literal}{sugar_translate label='LBL_BILLING_ADDRESS_STREET_2' module='AOS_Invoices'}{literal}' );
addToValidate('EditView', 'billing_address_street_3', 'varchar', false,'{/literal}{sugar_translate label='LBL_BILLING_ADDRESS_STREET_3' module='AOS_Invoices'}{literal}' );
addToValidate('EditView', 'billing_address_street_4', 'varchar', false,'{/literal}{sugar_translate label='LBL_BILLING_ADDRESS_STREET_4' module='AOS_Invoices'}{literal}' );
addToValidate('EditView', 'billing_address_city', 'varchar', false,'{/literal}{sugar_translate label='LBL_BILLING_ADDRESS_CITY' module='AOS_Invoices'}{literal}' );
addToValidate('EditView', 'billing_address_state', 'varchar', false,'{/literal}{sugar_translate label='LBL_BILLING_ADDRESS_STATE' module='AOS_Invoices'}{literal}' );
addToValidate('EditView', 'billing_address_postalcode', 'varchar', false,'{/literal}{sugar_translate label='LBL_BILLING_ADDRESS_POSTALCODE' module='AOS_Invoices'}{literal}' );
addToValidate('EditView', 'billing_address_country', 'varchar', false,'{/literal}{sugar_translate label='LBL_BILLING_ADDRESS_COUNTRY' module='AOS_Invoices'}{literal}' );
addToValidate('EditView', 'rating', 'varchar', false,'{/literal}{sugar_translate label='LBL_RATING' module='AOS_Invoices'}{literal}' );
addToValidate('EditView', 'phone_office', 'phone', false,'{/literal}{sugar_translate label='LBL_PHONE_OFFICE' module='AOS_Invoices'}{literal}' );
addToValidate('EditView', 'phone_alternate', 'phone', false,'{/literal}{sugar_translate label='LBL_PHONE_ALT' module='AOS_Invoices'}{literal}' );
addToValidate('EditView', 'website', 'url', false,'{/literal}{sugar_translate label='LBL_WEBSITE' module='AOS_Invoices'}{literal}' );
addToValidate('EditView', 'ownership', 'varchar', false,'{/literal}{sugar_translate label='LBL_OWNERSHIP' module='AOS_Invoices'}{literal}' );
addToValidate('EditView', 'employees', 'varchar', false,'{/literal}{sugar_translate label='LBL_EMPLOYEES' module='AOS_Invoices'}{literal}' );
addToValidate('EditView', 'ticker_symbol', 'varchar', false,'{/literal}{sugar_translate label='LBL_TICKER_SYMBOL' module='AOS_Invoices'}{literal}' );
addToValidate('EditView', 'shipping_address_street', 'varchar', false,'{/literal}{sugar_translate label='LBL_SHIPPING_ADDRESS_STREET' module='AOS_Invoices'}{literal}' );
addToValidate('EditView', 'shipping_address_street_2', 'varchar', false,'{/literal}{sugar_translate label='LBL_SHIPPING_ADDRESS_STREET_2' module='AOS_Invoices'}{literal}' );
addToValidate('EditView', 'shipping_address_street_3', 'varchar', false,'{/literal}{sugar_translate label='LBL_SHIPPING_ADDRESS_STREET_3' module='AOS_Invoices'}{literal}' );
addToValidate('EditView', 'shipping_address_street_4', 'varchar', false,'{/literal}{sugar_translate label='LBL_SHIPPING_ADDRESS_STREET_4' module='AOS_Invoices'}{literal}' );
addToValidate('EditView', 'shipping_address_city', 'varchar', false,'{/literal}{sugar_translate label='LBL_SHIPPING_ADDRESS_CITY' module='AOS_Invoices'}{literal}' );
addToValidate('EditView', 'shipping_address_state', 'varchar', false,'{/literal}{sugar_translate label='LBL_SHIPPING_ADDRESS_STATE' module='AOS_Invoices'}{literal}' );
addToValidate('EditView', 'shipping_address_postalcode', 'varchar', false,'{/literal}{sugar_translate label='LBL_SHIPPING_ADDRESS_POSTALCODE' module='AOS_Invoices'}{literal}' );
addToValidate('EditView', 'shipping_address_country', 'varchar', false,'{/literal}{sugar_translate label='LBL_SHIPPING_ADDRESS_COUNTRY' module='AOS_Invoices'}{literal}' );
addToValidate('EditView', 'email1', 'varchar', false,'{/literal}{sugar_translate label='LBL_EMAIL' module='AOS_Invoices'}{literal}' );
addToValidate('EditView', 'billing_account_id', 'id', false,'{/literal}{sugar_translate label='' module='AOS_Invoices'}{literal}' );
addToValidate('EditView', 'billing_account', 'relate', false,'{/literal}{sugar_translate label='LBL_BILLING_ACCOUNT' module='AOS_Invoices'}{literal}' );
addToValidate('EditView', 'billing_contact_id', 'id', false,'{/literal}{sugar_translate label='' module='AOS_Invoices'}{literal}' );
addToValidate('EditView', 'billing_contact', 'relate', false,'{/literal}{sugar_translate label='LBL_BILLING_CONTACT' module='AOS_Invoices'}{literal}' );
addToValidate('EditView', 'number', 'varchar', false,'{/literal}{sugar_translate label='LBL_INVOICE_NUMBER' module='AOS_Invoices'}{literal}' );
addToValidate('EditView', 'shipping_account_id', 'id', false,'{/literal}{sugar_translate label='' module='AOS_Invoices'}{literal}' );
addToValidate('EditView', 'shipping_account', 'relate', false,'{/literal}{sugar_translate label='LBL_SHIPPING_ACCOUNT' module='AOS_Invoices'}{literal}' );
addToValidate('EditView', 'shipping_contact_id', 'id', false,'{/literal}{sugar_translate label='' module='AOS_Invoices'}{literal}' );
addToValidate('EditView', 'shipping_contact', 'relate', false,'{/literal}{sugar_translate label='LBL_SHIPPING_CONTACT' module='AOS_Invoices'}{literal}' );
addToValidate('EditView', 'subtotal_amount', 'float', false,'{/literal}{sugar_translate label='LBL_SUBTOTAL_AMOUNT' module='AOS_Invoices'}{literal}' );
addToValidate('EditView', 'tax_amount', 'float', false,'{/literal}{sugar_translate label='LBL_TAX_AMOUNT' module='AOS_Invoices'}{literal}' );
addToValidate('EditView', 'shipping_amount', 'float', false,'{/literal}{sugar_translate label='LBL_SHIPPING_AMOUNT' module='AOS_Invoices'}{literal}' );
addToValidate('EditView', 'total_amount', 'float', false,'{/literal}{sugar_translate label='LBL_TOTAL_AMOUNT' module='AOS_Invoices'}{literal}' );
addToValidate('EditView', 'quote_number', 'int', false,'{/literal}{sugar_translate label='LBL_QUOTE_NUMBER' module='AOS_Invoices'}{literal}' );
addToValidate('EditView', 'quote_date', 'date', false,'{/literal}{sugar_translate label='LBL_QUOTE_DATE' module='AOS_Invoices'}{literal}' );
addToValidate('EditView', 'invoice_date', 'date', false,'{/literal}{sugar_translate label='LBL_INVOICE_DATE' module='AOS_Invoices'}{literal}' );
addToValidate('EditView', 'due_date', 'date', false,'{/literal}{sugar_translate label='LBL_DUE_DATE' module='AOS_Invoices'}{literal}' );
addToValidate('EditView', 'status', 'enum', false,'{/literal}{sugar_translate label='LBL_STATUS' module='AOS_Invoices'}{literal}' );
addToValidate('EditView', 'template_ddown_c[]', 'multienum', true,'{/literal}{sugar_translate label='LBL_TEMPLATE_DDOWN_C' module='AOS_Invoices'}{literal}' );
addToValidateBinaryDependency('EditView', 'assigned_user_name', 'alpha', false,'{/literal}{sugar_translate label='ERR_SQS_NO_MATCH_FIELD' module='AOS_Invoices'}{literal}: {/literal}{sugar_translate label='LBL_ASSIGNED_TO' module='AOS_Invoices'}{literal}', 'assigned_user_id' );
addToValidateBinaryDependency('EditView', 'billing_account', 'alpha', false,'{/literal}{sugar_translate label='ERR_SQS_NO_MATCH_FIELD' module='AOS_Invoices'}{literal}: {/literal}{sugar_translate label='LBL_BILLING_ACCOUNT' module='AOS_Invoices'}{literal}', 'billing_account_id' );
addToValidateBinaryDependency('EditView', 'billing_contact', 'alpha', false,'{/literal}{sugar_translate label='ERR_SQS_NO_MATCH_FIELD' module='AOS_Invoices'}{literal}: {/literal}{sugar_translate label='LBL_BILLING_CONTACT' module='AOS_Invoices'}{literal}', 'billing_contact_id' );
</script><script language="javascript">if(typeof sqs_objects == 'undefined'){var sqs_objects = new Array;}sqs_objects['EditView_assigned_user_name']={"form":"EditView","method":"get_user_array","field_list":["user_name","id"],"populate_list":["assigned_user_name","assigned_user_id"],"required_list":["assigned_user_id"],"conditions":[{"name":"user_name","op":"like_custom","end":"%","value":""}],"limit":"30","no_match_text":"No Match"};sqs_objects['EditView_billing_account']={"form":"EditView","method":"query","modules":["Accounts"],"group":"or","field_list":["name","id"],"populate_list":["EditView_billing_account","billing_account_id"],"conditions":[{"name":"name","op":"like_custom","end":"%","value":""}],"required_list":["billing_account_id"],"order":"name","limit":"30","no_match_text":"No Match"};sqs_objects['EditView_billing_contact']={"form":"EditView","method":"get_contact_array","modules":["Contacts"],"field_list":["salutation","first_name","last_name","id"],"populate_list":["billing_contact","billing_contact_id","billing_contact_id","billing_contact_id"],"required_list":["billing_contact_id"],"group":"or","conditions":[{"name":"first_name","op":"like_custom","end":"%","value":""},{"name":"last_name","op":"like_custom","end":"%","value":""}],"order":"last_name","limit":"30","no_match_text":"No Match"};</script>{/literal}
