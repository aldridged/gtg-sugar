

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
{if $bean->aclAccess("edit")}<input title="{$APP.LBL_EDIT_BUTTON_TITLE}" accessKey="{$APP.LBL_EDIT_BUTTON_KEY}" class="button primary" onclick="this.form.return_module.value='Contacts'; this.form.return_action.value='DetailView'; this.form.return_id.value='{$id}'; this.form.action.value='EditView';" type="submit" name="Edit" id="edit_button" value="{$APP.LBL_EDIT_BUTTON_LABEL}">{/if} 
{if $bean->aclAccess("edit")}<input title="{$APP.LBL_DUPLICATE_BUTTON_TITLE}" accessKey="{$APP.LBL_DUPLICATE_BUTTON_KEY}" class="button" onclick="this.form.return_module.value='Contacts'; this.form.return_action.value='DetailView'; this.form.isDuplicate.value=true; this.form.action.value='EditView'; this.form.return_id.value='{$id}';" type="submit" name="Duplicate" value="{$APP.LBL_DUPLICATE_BUTTON_LABEL}" id="duplicate_button">{/if} 
{if $bean->aclAccess("delete")}<input title="{$APP.LBL_DELETE_BUTTON_TITLE}" accessKey="{$APP.LBL_DELETE_BUTTON_KEY}" class="button" onclick="this.form.return_module.value='Contacts'; this.form.return_action.value='ListView'; this.form.action.value='Delete'; return confirm('{$APP.NTC_DELETE_CONFIRMATION}');" type="submit" name="Delete" value="{$APP.LBL_DELETE_BUTTON_LABEL}">{/if} 
{if $bean->aclAccess("edit")}<input title="{$APP.LBL_DUP_MERGE}" accessKey="M" class="button" onclick="this.form.return_module.value='Contacts'; this.form.return_action.value='DetailView'; this.form.return_id.value='{$id}'; this.form.action.value='Step1'; this.form.module.value='MergeRecords';" type="submit" name="Merge" value="{$APP.LBL_DUP_MERGE}">{/if} 
<td class="buttons" align="left" NOWRAP>
<input title="{$APP.LBL_MANAGE_SUBSCRIPTIONS}" class="button" onclick="this.form.return_module.value='Contacts'; this.form.return_action.value='DetailView'; this.form.return_id.value='{$fields.id.value}'; this.form.action.value='Subscriptions'; this.form.module.value='Campaigns'; this.form.module_tab.value='Contacts';" type="submit" name="Manage Subscriptions" value="{$APP.LBL_MANAGE_SUBSCRIPTIONS}">
</td>
</form>
</td>
<td class="buttons" align="left" NOWRAP>
{if $bean->aclAccess("detail")}{if !empty($fields.id.value) && $isAuditEnabled}<input title="{$APP.LNK_VIEW_CHANGE_LOG}" class="button" onclick='open_popup("Audit", "600", "400", "&record={$fields.id.value}&module_name=Contacts", true, false,  {ldelim} "call_back_function":"set_return","form_name":"EditView","field_to_name_array":[] {rdelim} ); return false;' type="submit" value="{$APP.LNK_VIEW_CHANGE_LOG}">{/if}{/if}
</td>
<td align="right" width="100%">{$ADMIN_EDIT}
{$PAGINATION}
</td>
</tr>
</table>{sugar_include include=$includes}
<div id="Contacts_detailview_tabs" 
>
<div >
<div id='LBL_CONTACT_INFORMATION' class='detail view'>
{counter name="panelFieldCount" start=0 print=false assign="panelFieldCount"}
<h4>{sugar_translate label='LBL_CONTACT_INFORMATION' module='Contacts'}</h4>
<table id='detailpanel_1' cellspacing='{$gridline}'>
<tr>
<td width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_NAME' module='Contacts'}
{/capture}
{$label|strip_semicolon}:
</td>
<td width='37.5%' colspan='3'>
{counter name="panelFieldCount"}

<form name="vcard" action="index.php" style="display: inline;">
<span id='{$fields.full_name.name}'>{$fields.full_name.value}</span>
&nbsp;&nbsp;
<input type="hidden" name="action" value="vCard" />
<input type="hidden" name="record" value="{$fields.id.value}" />
<input type="hidden" name="module" value="{$module}" />
<input type="hidden" name="to_pdf" value="true" />
<span class="id-ff">
<button type="submit" name="vCardButton" id="btn_vCardButton" value="{$APP.LBL_VCARD}" title="{$APP.LBL_VCARD}" class="button"><img src="{sugar_getimagepath file="id-ff-vcard.png"}"></button>
</span>
</form>
</td>
</tr>
<tr>
<td width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_TITLE' module='Contacts'}
{/capture}
{$label|strip_semicolon}:
</td>
<td width='37.5%' >
{counter name="panelFieldCount"}
<span id='title'>
<span id='{$fields.title.name}'>{$fields.title.value}</span>
</span>
</td>
<td width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_OFFICE_PHONE' module='Contacts'}
{/capture}
{$label|strip_semicolon}:
</td>
<td width='37.5%' >
{counter name="panelFieldCount"}
<span id='phone_work'>
{if !empty($fields.phone_work.value)}
{assign var="phone_value" value=$fields.phone_work.value }
{sugar_phone value=$phone_value }
{/if}
</span>
</td>
</tr>
<tr>
<td width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_DEPARTMENT' module='Contacts'}
{/capture}
{$label|strip_semicolon}:
</td>
<td width='37.5%' >
{counter name="panelFieldCount"}
<span id='department'>
<span id='{$fields.department.name}'>{$fields.department.value}</span>
</span>
</td>
<td width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_MOBILE_PHONE' module='Contacts'}
{/capture}
{$label|strip_semicolon}:
</td>
<td width='37.5%' >
{counter name="panelFieldCount"}
<span id='phone_mobile'>
{if !empty($fields.phone_mobile.value)}
{assign var="phone_value" value=$fields.phone_mobile.value }
{sugar_phone value=$phone_value }
{/if}
</span>
</td>
</tr>
<tr>
<td width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_ACCOUNT_NAME' module='Contacts'}
{/capture}
{$label|strip_semicolon}:
</td>
<td width='37.5%' >
{counter name="panelFieldCount"}

{if !empty($fields.account_id.value)}<a href="index.php?module=Accounts&action=DetailView&record={$fields.account_id.value}">{/if}
{$fields.account_name.value}
{if !empty($fields.account_id.value)}</a>{/if}
{if !empty($fields.account_id.value)}
<img id="dswidget_img" border="0" src="modules/Connectors/connectors/formatters/ext/rest/linkedin/tpls/linkedin.gif" alt="ext_rest_linkedin" onmouseover="show_ext_rest_linkedin(event);"><script type='text/javascript' src='{sugar_getjspath file='include/connectors/formatters/default/company_detail.js'}'></script>
<div style="visibility:hidden;" id="linkedin_popup_div"></div>
<script src="http://www.linkedin.com/companyInsider?script&useBorder=no" type="text/javascript"></script>
<script type="text/javascript" src="{sugar_getjspath file='include/connectors/formatters/default/company_detail.js'}"></script>
{literal}
<style type="text/css">
.yui-panel .hd {
background-color:#3D77CB;
border-color:#FFFFFF #FFFFFF #000000;
border-style:solid;
border-width:1px;
color:#000000;
font-size:100%;
font-weight:bold;
line-height:100%;
padding:4px;
white-space:nowrap;
}
</style>
{/literal}
<script type="text/javascript">
function show_ext_rest_linkedin(event)
{literal} 
{

var xCoordinate = event.clientX;
var yCoordinate = event.clientY;
var isIE = document.all?true:false;
      
if(isIE) {
    xCoordinate = xCoordinate + document.body.scrollLeft;
    yCoordinate = yCoordinate + document.body.scrollTop;
}

{/literal}

cd = new CompanyDetailsDialog("linkedin_popup_div", '<div id="linkedin_div"></div>', xCoordinate, yCoordinate);
cd.setHeader("{$fields.account_name.value}");
cd.display();
linked_in_popup = new LinkedIn.CompanyInsiderBox("linkedin_div", "{$fields.account_name.value}");
{literal}
} 
{/literal}
</script>
<div style="visibility:hidden;" id="linkedin_popup_div"></div>
<script src="http://www.linkedin.com/companyInsider?script&useBorder=no" type="text/javascript"></script>
<script type="text/javascript" src="{sugar_getjspath file='include/connectors/formatters/default/company_detail.js'}"></script>
{literal}
<style type="text/css">
.yui-panel .hd {
background-color:#3D77CB;
border-color:#FFFFFF #FFFFFF #000000;
border-style:solid;
border-width:1px;
color:#000000;
font-size:100%;
font-weight:bold;
line-height:100%;
padding:4px;
white-space:nowrap;
}
</style>
{/literal}
<script type="text/javascript">
function show_ext_rest_linkedin(event)
{literal} 
{

var xCoordinate = event.clientX;
var yCoordinate = event.clientY;
var isIE = document.all?true:false;
      
if(isIE) {
    xCoordinate = xCoordinate + document.body.scrollLeft;
    yCoordinate = yCoordinate + document.body.scrollTop;
}

{/literal}

cd = new CompanyDetailsDialog("linkedin_popup_div", '<div id="linkedin_div"></div>', xCoordinate, yCoordinate);
cd.setHeader("{$fields.account_name.value}");
cd.display();
linked_in_popup = new LinkedIn.CompanyInsiderBox("linkedin_div", "{$fields.account_name.value}");
{literal}
} 
{/literal}
</script> 
{/if}
</td>
<td width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_FAX_PHONE' module='Contacts'}
{/capture}
{$label|strip_semicolon}:
</td>
<td width='37.5%' >
{counter name="panelFieldCount"}
<span id='phone_fax'>
{if !empty($fields.phone_fax.value)}
{assign var="phone_value" value=$fields.phone_fax.value }
{sugar_phone value=$phone_value }
{/if}
</span>
</td>
</tr>
<tr>
<td width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_PRIMARY_ADDRESS' module='Contacts'}
{/capture}
{$label|strip_semicolon}:
</td>
<td width='37.5%' >
{counter name="panelFieldCount"}

<table border='0' cellpadding='0' cellspacing='0' width='100%'>
<tr>
<td width='99%' >
{$fields.primary_address_street.value|escape:'htmlentitydecode'|strip_tags|url2html|nl2br}<br>
{$fields.primary_address_city.value|escape:'htmlentitydecode'|strip_tags|url2html|nl2br} {$fields.primary_address_state.value|escape:'htmlentitydecode'|strip_tags|url2html|nl2br}&nbsp;&nbsp;{$fields.primary_address_postalcode.value|escape:'htmlentitydecode'|strip_tags|url2html|nl2br}<br>
{$fields.primary_address_country.value|escape:'htmlentitydecode'|strip_tags|url2html|nl2br}
</td>
<td class='dataField' width='1%'>
{$custom_code_primary}
</td>
</tr>
</table>
</td>
<td width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_ALTERNATE_ADDRESS' module='Contacts'}
{/capture}
{$label|strip_semicolon}:
</td>
<td width='37.5%' >
{counter name="panelFieldCount"}

<table border='0' cellpadding='0' cellspacing='0' width='100%'>
<tr>
<td width='99%' >
{$fields.alt_address_street.value|escape:'htmlentitydecode'|strip_tags|url2html|nl2br}<br>
{$fields.alt_address_city.value|escape:'htmlentitydecode'|strip_tags|url2html|nl2br} {$fields.alt_address_state.value|escape:'htmlentitydecode'|strip_tags|url2html|nl2br}&nbsp;&nbsp;{$fields.alt_address_postalcode.value|escape:'htmlentitydecode'|strip_tags|url2html|nl2br}<br>
{$fields.alt_address_country.value|escape:'htmlentitydecode'|strip_tags|url2html|nl2br}
</td>
<td class='dataField' width='1%'>
{$custom_code_alt}
</td>
</tr>
</table>
</td>
</tr>
<tr>
<td width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_EMAIL_ADDRESS' module='Contacts'}
{/capture}
{$label|strip_semicolon}:
</td>
<td width='37.5%' colspan='3'>
{counter name="panelFieldCount"}
<span id='email1'>
{$fields.email1.value}
</span>
</td>
</tr>
<tr>
<td width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_DESCRIPTION' module='Contacts'}
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
<script>document.getElementById("LBL_CONTACT_INFORMATION").style.display='none';</script>
{/if}
<div id='LBL_PANEL_ADVANCED' class='detail view'>
{counter name="panelFieldCount" start=0 print=false assign="panelFieldCount"}
<h4>{sugar_translate label='LBL_PANEL_ADVANCED' module='Contacts'}</h4>
<table id='detailpanel_2' cellspacing='{$gridline}'>
<tr>
<td width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_REPORTS_TO' module='Contacts'}
{/capture}
{$label|strip_semicolon}:
</td>
<td width='37.5%' >
{counter name="panelFieldCount"}

{if !empty($fields.reports_to_id.value)}<a href="index.php?module=Contacts&action=DetailView&record={$fields.reports_to_id.value}">{/if}
{$fields.report_to_name.value}
{if !empty($fields.reports_to_id.value)}</a>{/if}
</td>
<td width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_SYNC_CONTACT' module='Contacts'}
{/capture}
{$label|strip_semicolon}:
</td>
<td width='37.5%' >
{counter name="panelFieldCount"}
<span id='sync_contact'>
{if strval($fields.sync_contact.value) == "1" || strval($fields.sync_contact.value) == "yes" || strval($fields.sync_contact.value) == "on"} 
{assign var="checked" value="CHECKED"}
{else}
{assign var="checked" value=""}
{/if}
<input type="checkbox" class="checkbox" name="{$fields.sync_contact.name}" disabled="true" {$checked}>
</span>
</td>
</tr>
<tr>
<td width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_LEAD_SOURCE' module='Contacts'}
{/capture}
{$label|strip_semicolon}:
</td>
<td width='37.5%' >
{counter name="panelFieldCount"}
<span id='lead_source'>

{if is_string($fields.lead_source.options)}
{ $fields.lead_source.options}
{else if}
{ $fields.lead_source.options[$fields.lead_source.value]}
{/if}
</span>
</td>
<td width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_DO_NOT_CALL' module='Contacts'}
{/capture}
{$label|strip_semicolon}:
</td>
<td width='37.5%' >
{counter name="panelFieldCount"}
<span id='do_not_call'>
{if strval($fields.do_not_call.value) == "1" || strval($fields.do_not_call.value) == "yes" || strval($fields.do_not_call.value) == "on"} 
{assign var="checked" value="CHECKED"}
{else}
{assign var="checked" value=""}
{/if}
<input type="checkbox" class="checkbox" name="{$fields.do_not_call.name}" disabled="true" {$checked}>
</span>
</td>
</tr>
<tr>
<td width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_CAMPAIGN' module='Contacts'}
{/capture}
{$label|strip_semicolon}:
</td>
<td width='37.5%' colspan='3'>
{counter name="panelFieldCount"}

{if !empty($fields.campaign_id.value)}<a href="index.php?module=Campaigns&action=DetailView&record={$fields.campaign_id.value}">{/if}
{$fields.campaign_name.value}
{if !empty($fields.campaign_id.value)}</a>{/if}
</td>
</tr>
</table>
</div>
{if $panelFieldCount == 0}
<script>document.getElementById("LBL_PANEL_ADVANCED").style.display='none';</script>
{/if}
<div id='LBL_PANEL_ASSIGNMENT' class='detail view'>
{counter name="panelFieldCount" start=0 print=false assign="panelFieldCount"}
<h4>{sugar_translate label='LBL_PANEL_ASSIGNMENT' module='Contacts'}</h4>
<table id='detailpanel_3' cellspacing='{$gridline}'>
<tr>
<td width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_ASSIGNED_TO_NAME' module='Contacts'}
{/capture}
{$label|strip_semicolon}:
</td>
<td width='37.5%' >
{counter name="panelFieldCount"}

{$fields.assigned_user_name.value}
</td>
<td width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_DATE_MODIFIED' module='Contacts'}
{/capture}
{$label|strip_semicolon}:
</td>
<td width='37.5%' >
{counter name="panelFieldCount"}
{$fields.date_modified.value} {$APP.LBL_BY} {$fields.modified_by_name.value}	
</td>
</tr>
<tr>
<td width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_DATE_ENTERED' module='Contacts'}
{/capture}
{$label|strip_semicolon}:
</td>
<td width='37.5%' colspan='3'>
{counter name="panelFieldCount"}
{$fields.date_entered.value} {$APP.LBL_BY} {$fields.created_by_name.value}	
</td>
</tr>
</table>
</div>
{if $panelFieldCount == 0}
<script>document.getElementById("LBL_PANEL_ASSIGNMENT").style.display='none';</script>
{/if}
</div></div>

</form>