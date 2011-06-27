

<table cellpadding="1" cellspacing="0" border="0" width="100%" class="actionsContainer">
<tr>
<td class="buttons" align="left" NOWRAP>
<form action="index.php" method="post" name="DetailView" id="form">
<input type="hidden" name="module" value="{$module}">
<input type="hidden" name="record" value="{$fields.id.value}">
<input type="hidden" name="return_action">
<input type="hidden" name="return_module">
<input type="hidden" name="return_id">
<input type="hidden" name="module_tab"> 
<input type="hidden" name="isDuplicate" value="false">
<input type="hidden" name="offset" value="{$offset}">
<input type="hidden" name="action" value="EditView">
{if $bean->aclAccess("edit")}<input title="{$APP.LBL_EDIT_BUTTON_TITLE}" accessKey="{$APP.LBL_EDIT_BUTTON_KEY}" class="button primary" onclick="this.form.return_module.value='AOS_Quotes'; this.form.return_action.value='DetailView'; this.form.return_id.value='{$id}'; this.form.action.value='EditView';" type="submit" name="Edit" id="edit_button" value="{$APP.LBL_EDIT_BUTTON_LABEL}">{/if} 
{if $bean->aclAccess("edit")}<input title="{$APP.LBL_DUPLICATE_BUTTON_TITLE}" accessKey="{$APP.LBL_DUPLICATE_BUTTON_KEY}" class="button" onclick="this.form.return_module.value='AOS_Quotes'; this.form.return_action.value='DetailView'; this.form.isDuplicate.value=true; this.form.action.value='EditView'; this.form.return_id.value='{$id}';" type="submit" name="Duplicate" value="{$APP.LBL_DUPLICATE_BUTTON_LABEL}" id="duplicate_button">{/if} 
{if $bean->aclAccess("delete")}<input title="{$APP.LBL_DELETE_BUTTON_TITLE}" accessKey="{$APP.LBL_DELETE_BUTTON_KEY}" class="button" onclick="this.form.return_module.value='AOS_Quotes'; this.form.return_action.value='ListView'; this.form.action.value='Delete'; return confirm('{$APP.NTC_DELETE_CONFIRMATION}');" type="submit" name="Delete" value="{$APP.LBL_DELETE_BUTTON_LABEL}">{/if} 
{if $bean->aclAccess("edit")}<input title="{$APP.LBL_DUP_MERGE}" accessKey="M" class="button" onclick="this.form.return_module.value='AOS_Quotes'; this.form.return_action.value='DetailView'; this.form.return_id.value='{$id}'; this.form.action.value='Step1'; this.form.module.value='MergeRecords';" type="submit" name="Merge" value="{$APP.LBL_DUP_MERGE}">{/if} 
<td class="buttons" align="left" NOWRAP>
<input type="submit" class="button" onClick="this.form.action.value='generatePdf';" value="{$MOD.LBL_PRINT_AS_PDF}">
</td>
<td class="buttons" align="left" NOWRAP>
<input type="submit" class="button" onClick="this.form.action.value='sendEmail';" value="{$MOD.LBL_EMAIL_QUOTE}">
</td>
<td class="buttons" align="left" NOWRAP>
<input type="submit" class="button" onClick="this.form.action.value='converToInvoice';" value="{$MOD.LBL_CONVERT_TO_INVOICE}">
</td>
</form>
</td>
<td class="buttons" align="left" NOWRAP>
{if $bean->aclAccess("detail")}{if !empty($fields.id.value) && $isAuditEnabled}<input title="{$APP.LNK_VIEW_CHANGE_LOG}" class="button" onclick='open_popup("Audit", "600", "400", "&record={$fields.id.value}&module_name=AOS_Quotes", true, false,  {ldelim} "call_back_function":"set_return","form_name":"EditView","field_to_name_array":[] {rdelim} ); return false;' type="submit" value="{$APP.LNK_VIEW_CHANGE_LOG}">{/if}{/if}
</td>
<td align="right" width="100%">{$ADMIN_EDIT}
{$PAGINATION}
</td>
</tr>
</table>{sugar_include include=$includes}
<div id="AOS_Quotes_detailview_tabs" 
>
<div >
<div id='DEFAULT' class='detail view'>
{counter name="panelFieldCount" start=0 print=false assign="panelFieldCount"}
<table id='detailpanel_1' cellspacing='{$gridline}'>
<tr>
<td width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_NAME' module='AOS_Quotes'}
{/capture}
{$label|strip_semicolon}:
</td>
<td width='37.5%' >
{counter name="panelFieldCount"}
<span id='name'>
<span id='{$fields.name.name}'>{$fields.name.value}</span>
</span>
</td>
<td width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_OPPORTUNITY' module='AOS_Quotes'}
{/capture}
{$label|strip_semicolon}:
</td>
<td width='37.5%' >
{counter name="panelFieldCount"}

{if !empty($fields.opportunity_id.value)}<a href="index.php?module=Opportunities&action=DetailView&record={$fields.opportunity_id.value}">{/if}
{$fields.opportunity.value}
{if !empty($fields.opportunity_id.value)}</a>{/if}
</td>
</tr>
<tr>
<td width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_QUOTE_NUMBER' module='AOS_Quotes'}
{/capture}
{$label|strip_semicolon}:
</td>
<td width='37.5%' >
{counter name="panelFieldCount"}
<span id='number'>
<span id='{$fields.number.name}'>{$fields.number.value}</span>
</span>
</td>
<td width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_STAGE' module='AOS_Quotes'}
{/capture}
{$label|strip_semicolon}:
</td>
<td width='37.5%' >
{counter name="panelFieldCount"}
<span id='stage'>

{if is_string($fields.stage.options)}
{ $fields.stage.options}
{else if}
{ $fields.stage.options[$fields.stage.value]}
{/if}
</span>
</td>
</tr>
<tr>
<td width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_EXPIRATION' module='AOS_Quotes'}
{/capture}
{$label|strip_semicolon}:
</td>
<td width='37.5%' >
{counter name="panelFieldCount"}
<span id='expiration'>
<span id='{$fields.expiration.name}'>{$fields.expiration.value}</span>
</span>
</td>
<td width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_INVOICE_STATUS' module='AOS_Quotes'}
{/capture}
{$label|strip_semicolon}:
</td>
<td width='37.5%' >
{counter name="panelFieldCount"}
<span id='invoice_status'>

{if is_string($fields.invoice_status.options)}
{ $fields.invoice_status.options}
{else if}
{ $fields.invoice_status.options[$fields.invoice_status.value]}
{/if}
</span>
</td>
</tr>
<tr>
<td width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_ASSIGNED_TO' module='AOS_Quotes'}
{/capture}
{$label|strip_semicolon}:
</td>
<td width='37.5%' >
{counter name="panelFieldCount"}

{$fields.assigned_user_name.value}
</td>
<td width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_TERM' module='AOS_Quotes'}
{/capture}
{$label|strip_semicolon}:
</td>
<td width='37.5%' >
{counter name="panelFieldCount"}
<span id='term'>

{if is_string($fields.term.options)}
{ $fields.term.options}
{else if}
{ $fields.term.options[$fields.term.value]}
{/if}
</span>
</td>
</tr>
<tr>
<td width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_APPROVAL_STATUS' module='AOS_Quotes'}
{/capture}
{$label|strip_semicolon}:
</td>
<td width='37.5%' >
{counter name="panelFieldCount"}
<span id='approval_status'>

{if is_string($fields.approval_status.options)}
{ $fields.approval_status.options}
{else if}
{ $fields.approval_status.options[$fields.approval_status.value]}
{/if}
</span>
</td>
<td width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_APPROVAL_ISSUE' module='AOS_Quotes'}
{/capture}
{$label|strip_semicolon}:
</td>
<td width='37.5%' >
{counter name="panelFieldCount"}
<span id='approval_issue'>
{$fields.approval_issue.value|escape:'htmlentitydecode'|escape:'html'|url2html|nl2br}
</span>
</td>
</tr>
<tr>
<td width='12.5%' scope="row">
&nbsp;
</td>
<td width='37.5%' >
</td>
<td width='12.5%' scope="row">
&nbsp;
</td>
<td width='37.5%' >
</td>
</tr>
<tr>
<td width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_BILLING_ACCOUNT' module='AOS_Quotes'}
{/capture}
{$label|strip_semicolon}:
</td>
<td width='37.5%' >
{counter name="panelFieldCount"}

{if !empty($fields.billing_account_id.value)}<a href="index.php?module=Accounts&action=DetailView&record={$fields.billing_account_id.value}">{/if}
{$fields.billing_account.value}
{if !empty($fields.billing_account_id.value)}</a>{/if}
</td>
<td width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_BILLING_CONTACT' module='AOS_Quotes'}
{/capture}
{$label|strip_semicolon}:
</td>
<td width='37.5%' >
{counter name="panelFieldCount"}

{if !empty($fields.billing_contact_id.value)}<a href="index.php?module=Contacts&action=DetailView&record={$fields.billing_contact_id.value}">{/if}
{$fields.billing_contact.value}
{if !empty($fields.billing_contact_id.value)}</a>{/if}
</td>
</tr>
<tr>
<td width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_BILLING_ADDRESS' module='AOS_Quotes'}
{/capture}
{$label|strip_semicolon}:
</td>
<td width='37.5%' >
{counter name="panelFieldCount"}

<table border='0' cellpadding='0' cellspacing='0' width='100%'>
<tr>
<td width='99%' >
{$fields.billing_address_street.value|escape:'htmlentitydecode'|strip_tags|url2html|nl2br}<br>
{$fields.billing_address_city.value|escape:'htmlentitydecode'|strip_tags|url2html|nl2br} {$fields.billing_address_state.value|escape:'htmlentitydecode'|strip_tags|url2html|nl2br}&nbsp;&nbsp;{$fields.billing_address_postalcode.value|escape:'htmlentitydecode'|strip_tags|url2html|nl2br}<br>
{$fields.billing_address_country.value|escape:'htmlentitydecode'|strip_tags|url2html|nl2br}
</td>
<td class='dataField' width='1%'>
{$custom_code_billing}
</td>
</tr>
</table>
</td>
<td width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_SHIPPING_ADDRESS' module='AOS_Quotes'}
{/capture}
{$label|strip_semicolon}:
</td>
<td width='37.5%' >
{counter name="panelFieldCount"}

<table border='0' cellpadding='0' cellspacing='0' width='100%'>
<tr>
<td width='99%' >
{$fields.shipping_address_street.value|escape:'htmlentitydecode'|strip_tags|url2html|nl2br}<br>
{$fields.shipping_address_city.value|escape:'htmlentitydecode'|strip_tags|url2html|nl2br} {$fields.shipping_address_state.value|escape:'htmlentitydecode'|strip_tags|url2html|nl2br}&nbsp;&nbsp;{$fields.shipping_address_postalcode.value|escape:'htmlentitydecode'|strip_tags|url2html|nl2br}<br>
{$fields.shipping_address_country.value|escape:'htmlentitydecode'|strip_tags|url2html|nl2br}
</td>
<td class='dataField' width='1%'>
{$custom_code_shipping}
</td>
</tr>
</table>
</td>
</tr>
<tr>
<td width='12.5%' scope="row">
&nbsp;
</td>
<td width='37.5%' >
</td>
<td width='12.5%' scope="row">
&nbsp;
</td>
<td width='37.5%' >
</td>
</tr>
<tr>
<td width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_DESCRIPTION' module='AOS_Quotes'}
{/capture}
{$label|strip_semicolon}:
</td>
<td width='37.5%' colspan='3'>
{counter name="panelFieldCount"}
<span id='description'>
{$fields.description.value|escape:'htmlentitydecode'|escape:'html'|url2html|nl2br}
</span>
</td>
</tr>
</table>
</div>
{if $panelFieldCount == 0}
<script>document.getElementById("DEFAULT").style.display='none';</script>
{/if}
<div id='LBL_LINE_ITEMS' class='detail view'>
{counter name="panelFieldCount" start=0 print=false assign="panelFieldCount"}
<h4>{sugar_translate label='LBL_LINE_ITEMS' module='AOS_Quotes'}</h4>
<table id='detailpanel_2' cellspacing='{$gridline}'>
<tr>
<td width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_LINE_ITEMS' module='AOS_Quotes'}
{/capture}
{$label|strip_semicolon}:
</td>
<td width='37.5%' colspan='3'>
{counter name="panelFieldCount"}
{$LINE_ITEMS}	
</td>
<td width='12.5%' scope="row">
&nbsp;
</td>
<td width='37.5%' >
</td>
</tr>
</table>
</div>
{if $panelFieldCount == 0}
<script>document.getElementById("LBL_LINE_ITEMS").style.display='none';</script>
{/if}
</div></div>

</form>