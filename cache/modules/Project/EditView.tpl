

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
<input type="hidden" name="is_template" value="{$is_template}" />   
{if $bean->aclAccess("save")}<input title="{$APP.LBL_SAVE_BUTTON_TITLE}" accessKey="{$APP.LBL_SAVE_BUTTON_KEY}" class="button primary" onclick="{if $isDuplicate}this.form.return_id.value=''; {/if}this.form.action.value='Save'; return check_form('EditView');" type="submit" name="button" value="{$APP.LBL_SAVE_BUTTON_LABEL}">{/if} 
{if !empty($smarty.request.return_action) && $smarty.request.return_action == "ProjectTemplatesDetailView" && (!empty($fields.id.value) || !empty($smarty.request.return_id)) }<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="this.form.action.value='ProjectTemplatesDetailView'; this.form.module.value='{$smarty.request.return_module}'; this.form.record.value='{$smarty.request.return_id}';" type="submit" name="button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}"> {elseif !empty($smarty.request.return_action) && $smarty.request.return_action == "DetailView" && (!empty($fields.id.value) || !empty($smarty.request.return_id)) }<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="this.form.action.value='DetailView'; this.form.module.value='{$smarty.request.return_module}'; this.form.record.value='{$smarty.request.return_id}';" type="submit" name="button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}"> {elseif $is_template}<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="this.form.action.value='ProjectTemplatesListView'; this.form.module.value='{$smarty.request.return_module}'; this.form.record.value='{$smarty.request.return_id}';" type="submit" name="button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}"> {else}<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="this.form.action.value='index'; this.form.module.value='{$smarty.request.return_module}'; this.form.record.value='{$smarty.request.return_id}';" type="submit" name="button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}"> {/if}
{if $bean->aclAccess("detail")}{if !empty($fields.id.value) && $isAuditEnabled}<input title="{$APP.LNK_VIEW_CHANGE_LOG}" class="button" onclick='open_popup("Audit", "600", "400", "&record={$fields.id.value}&module_name=Project", true, false,  {ldelim} "call_back_function":"set_return","form_name":"EditView","field_to_name_array":[] {rdelim} ); return false;' type="submit" value="{$APP.LNK_VIEW_CHANGE_LOG}">{/if}{/if}
</td>
<td align='right'>
{$PAGINATION}
</td>
</tr>
</table>{sugar_include include=$includes}
<div id="EditView_tabs" 
>
<div >
<div id="LBL_PROJECT_INFORMATION">
{counter name="panelFieldCount" start=0 print=false assign="panelFieldCount"}
<table width="100%" border="0" cellspacing="1" cellpadding="0"  class="{$def.templateMeta.panelClass|default:'edit view'}">
<tr>
<th align="left" colspan="8">
<h4>{sugar_translate label='LBL_PROJECT_INFORMATION' module='Project'}</h4>
</th>
</tr>
<tr>
<td valign="top" id='name_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_NAME' module='Project'}
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
maxlength='50' 
value='{$value}' title='' tabindex='100' > 
<td valign="top" id='status_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_STATUS' module='Project'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' >
{counter name="panelFieldCount"}

<select name="{$fields.status.name}" 
id="{$fields.status.name}" 
title='' tabindex="101"  
>
{if isset($fields.status.value) && $fields.status.value != ''}
{html_options options=$fields.status.options selected=$fields.status.value}
{else}
{html_options options=$fields.status.options selected=$fields.status.default}
{/if}
</select>
</tr>
<tr>
<td valign="top" id='estimated_start_date_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_DATE_START' module='Project'}
{/capture}
{$label|strip_semicolon}:
<span class="required">*</span>
</td>
<td valign="top" width='37.5%' >
{counter name="panelFieldCount"}

{assign var=date_value value=$fields.estimated_start_date.value }
<input autocomplete="off" type="text" name="{$fields.estimated_start_date.name}" id="{$fields.estimated_start_date.name}" value="{$date_value}" title=''  tabindex='102' size="11" maxlength="10">
<img border="0" src="{sugar_getimagepath file='jscalendar.gif'}" alt="{$APP.LBL_ENTER_DATE}" id="{$fields.estimated_start_date.name}_trigger" align="absmiddle" />
<script type="text/javascript">
Calendar.setup ({ldelim}
inputField : "{$fields.estimated_start_date.name}",
daFormat : "{$CALENDAR_FORMAT}",
button : "{$fields.estimated_start_date.name}_trigger",
singleClick : true,
dateStr : "{$date_value}",
step : 1,
weekNumbers:false
{rdelim}
);
</script>
<td valign="top" id='priority_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_PRIORITY' module='Project'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' >
{counter name="panelFieldCount"}

<select name="{$fields.priority.name}" 
id="{$fields.priority.name}" 
title='' tabindex="103"  
>
{if isset($fields.priority.value) && $fields.priority.value != ''}
{html_options options=$fields.priority.options selected=$fields.priority.value}
{else}
{html_options options=$fields.priority.options selected=$fields.priority.default}
{/if}
</select>
</tr>
<tr>
<td valign="top" id='estimated_end_date_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_DATE_END' module='Project'}
{/capture}
{$label|strip_semicolon}:
<span class="required">*</span>
</td>
<td valign="top" width='37.5%' >
{counter name="panelFieldCount"}

{assign var=date_value value=$fields.estimated_end_date.value }
<input autocomplete="off" type="text" name="{$fields.estimated_end_date.name}" id="{$fields.estimated_end_date.name}" value="{$date_value}" title=''  tabindex='104' size="11" maxlength="10">
<img border="0" src="{sugar_getimagepath file='jscalendar.gif'}" alt="{$APP.LBL_ENTER_DATE}" id="{$fields.estimated_end_date.name}_trigger" align="absmiddle" />
<script type="text/javascript">
Calendar.setup ({ldelim}
inputField : "{$fields.estimated_end_date.name}",
daFormat : "{$CALENDAR_FORMAT}",
button : "{$fields.estimated_end_date.name}_trigger",
singleClick : true,
dateStr : "{$date_value}",
step : 1,
weekNumbers:false
{rdelim}
);
</script>
<td valign="top" id='po_c_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_PO' module='Project'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' >
{counter name="panelFieldCount"}

{if strlen($fields.po_c.value) <= 0}
{assign var="value" value=$fields.po_c.default_value }
{else}
{assign var="value" value=$fields.po_c.value }
{/if}  
<input type='text' name='{$fields.po_c.name}' 
id='{$fields.po_c.name}' size='30' 
maxlength='255' 
value='{$value}' title='' tabindex='105' > 
</tr>
<tr>
<td valign="top" id='facility_c_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_FACILITY' module='Project'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' colspan='3'>
{counter name="panelFieldCount"}

{if strlen($fields.facility_c.value) <= 0}
{assign var="value" value=$fields.facility_c.default_value }
{else}
{assign var="value" value=$fields.facility_c.value }
{/if}  
<input type='text' name='{$fields.facility_c.name}' 
id='{$fields.facility_c.name}' size='30' 
maxlength='255' 
value='{$value}' title='' tabindex='106' > 
</tr>
<tr>
<td valign="top" id='areablock_c_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_AREABLOCK' module='Project'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' >
{counter name="panelFieldCount"}

{if strlen($fields.areablock_c.value) <= 0}
{assign var="value" value=$fields.areablock_c.default_value }
{else}
{assign var="value" value=$fields.areablock_c.value }
{/if}  
<input type='text' name='{$fields.areablock_c.name}' 
id='{$fields.areablock_c.name}' size='30' 
maxlength='255' 
value='{$value}' title='Area/Block' tabindex='107' > 
<td valign="top" id='wellname_c_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_WELLNAME' module='Project'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' >
{counter name="panelFieldCount"}

{if strlen($fields.wellname_c.value) <= 0}
{assign var="value" value=$fields.wellname_c.default_value }
{else}
{assign var="value" value=$fields.wellname_c.value }
{/if}  
<input type='text' name='{$fields.wellname_c.name}' 
id='{$fields.wellname_c.name}' size='30' 
maxlength='255' 
value='{$value}' title='' tabindex='108' > 
</tr>
<tr>
<td valign="top" id='ocsg_c_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_OCSG' module='Project'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' >
{counter name="panelFieldCount"}

{if strlen($fields.ocsg_c.value) <= 0}
{assign var="value" value=$fields.ocsg_c.default_value }
{else}
{assign var="value" value=$fields.ocsg_c.value }
{/if}  
<input type='text' name='{$fields.ocsg_c.name}' 
id='{$fields.ocsg_c.name}' size='30' 
maxlength='255' 
value='{$value}' title='' tabindex='109' > 
<td valign="top" id='afe_c_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_AFE' module='Project'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' >
{counter name="panelFieldCount"}

{if strlen($fields.afe_c.value) <= 0}
{assign var="value" value=$fields.afe_c.default_value }
{else}
{assign var="value" value=$fields.afe_c.value }
{/if}  
<input type='text' name='{$fields.afe_c.name}' 
id='{$fields.afe_c.name}' size='30' 
maxlength='255' 
value='{$value}' title='' tabindex='110' > 
</tr>
<tr>
<td valign="top" id='prebill_c_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_PREBILL' module='Project'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' >
{counter name="panelFieldCount"}

{if strval($fields.prebill_c.value) == "1" || strval($fields.prebill_c.value) == "yes" || strval($fields.prebill_c.value) == "on"} 
{assign var="checked" value="CHECKED"}
{else}
{assign var="checked" value=""}
{/if}
<input type="hidden" name="{$fields.prebill_c.name}" value="0"> 
<input type="checkbox" id="{$fields.prebill_c.name}" 
name="{$fields.prebill_c.name}" 
value="1" title='' tabindex="111" {$checked} >
<td valign="top" id='dockname_c_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_DOCKNAME' module='Project'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' >
{counter name="panelFieldCount"}

{if strlen($fields.dockname_c.value) <= 0}
{assign var="value" value=$fields.dockname_c.default_value }
{else}
{assign var="value" value=$fields.dockname_c.value }
{/if}  
<input type='text' name='{$fields.dockname_c.name}' 
id='{$fields.dockname_c.name}' size='30' 
maxlength='255' 
value='{$value}' title='' tabindex='112' > 
</tr>
<tr>
<td valign="top" id='description_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_DESCRIPTION' module='Project'}
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
title='' tabindex="113" >{$value}</textarea>
</tr>
</table>
</div>
{if $panelFieldCount == 0}
<script>document.getElementById("LBL_PROJECT_INFORMATION").style.display='none';</script>
{/if}
<div id="LBL_PANEL_ASSIGNMENT">
{counter name="panelFieldCount" start=0 print=false assign="panelFieldCount"}
<table width="100%" border="0" cellspacing="1" cellpadding="0"  class="{$def.templateMeta.panelClass|default:'edit view'}">
<tr>
<th align="left" colspan="8">
<h4>{sugar_translate label='LBL_PANEL_ASSIGNMENT' module='Project'}</h4>
</th>
</tr>
<tr>
<td valign="top" id='assigned_user_name_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_ASSIGNED_USER_NAME' module='Project'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' colspan='3'>
{counter name="panelFieldCount"}

<input type="text" name="{$fields.assigned_user_name.name}" class="sqsEnabled" tabindex="114" id="{$fields.assigned_user_name.name}" size="" value="{$fields.assigned_user_name.value}" title='' autocomplete="off"  >
<input type="hidden" name="{$fields.assigned_user_name.id_name}" 
id="{$fields.assigned_user_name.id_name}" 
value="{$fields.assigned_user_id.value}">
<span class="id-ff multiple">
<button type="button" name="btn_{$fields.assigned_user_name.name}" id="btn_{$fields.assigned_user_name.name}" tabindex="114" title="{$APP.LBL_SELECT_BUTTON_TITLE}" accessKey="{$APP.LBL_SELECT_BUTTON_KEY}" class="button firstChild" value="{$APP.LBL_SELECT_BUTTON_LABEL}" 
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
);' ><img src="{sugar_getimagepath file="id-ff-select.png"}"></button><button type="button" name="btn_clr_{$fields.assigned_user_name.name}" id="btn_clr_{$fields.assigned_user_name.name}" tabindex="114" title="{$APP.LBL_CLEAR_BUTTON_TITLE}" accessKey="{$APP.LBL_CLEAR_BUTTON_KEY}" class="button lastChild" 
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
<td valign="top" id='_label' width='12.5%' scope="row">
</td>
<td valign="top" width='37.5%' >
</tr>
</table>
</div>
{if $panelFieldCount == 0}
<script>document.getElementById("LBL_PANEL_ASSIGNMENT").style.display='none';</script>
{/if}
</div></div>

<div class="buttons">
{if $bean->aclAccess("save")}<input title="{$APP.LBL_SAVE_BUTTON_TITLE}" accessKey="{$APP.LBL_SAVE_BUTTON_KEY}" class="button primary" onclick="{if $isDuplicate}this.form.return_id.value=''; {/if}this.form.action.value='Save'; return check_form('EditView');" type="submit" name="button" value="{$APP.LBL_SAVE_BUTTON_LABEL}">{/if} 
{if !empty($smarty.request.return_action) && $smarty.request.return_action == "ProjectTemplatesDetailView" && (!empty($fields.id.value) || !empty($smarty.request.return_id)) }<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="this.form.action.value='ProjectTemplatesDetailView'; this.form.module.value='{$smarty.request.return_module}'; this.form.record.value='{$smarty.request.return_id}';" type="submit" name="button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}"> {elseif !empty($smarty.request.return_action) && $smarty.request.return_action == "DetailView" && (!empty($fields.id.value) || !empty($smarty.request.return_id)) }<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="this.form.action.value='DetailView'; this.form.module.value='{$smarty.request.return_module}'; this.form.record.value='{$smarty.request.return_id}';" type="submit" name="button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}"> {elseif $is_template}<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="this.form.action.value='ProjectTemplatesListView'; this.form.module.value='{$smarty.request.return_module}'; this.form.record.value='{$smarty.request.return_id}';" type="submit" name="button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}"> {else}<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="this.form.action.value='index'; this.form.module.value='{$smarty.request.return_module}'; this.form.record.value='{$smarty.request.return_id}';" type="submit" name="button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}"> {/if}
{if $bean->aclAccess("detail")}{if !empty($fields.id.value) && $isAuditEnabled}<input title="{$APP.LNK_VIEW_CHANGE_LOG}" class="button" onclick='open_popup("Audit", "600", "400", "&record={$fields.id.value}&module_name=Project", true, false,  {ldelim} "call_back_function":"set_return","form_name":"EditView","field_to_name_array":[] {rdelim} ); return false;' type="submit" value="{$APP.LNK_VIEW_CHANGE_LOG}">{/if}{/if}
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
addToValidate('EditView', 'id', 'id', false,'{/literal}{sugar_translate label='LBL_ID' module='Project'}{literal}' );
addToValidate('EditView', 'date_entered_date', 'date', false,'Date Created' );
addToValidate('EditView', 'date_modified_date', 'date', false,'Date Modified' );
addToValidate('EditView', 'assigned_user_id', 'assigned_user_name', false,'{/literal}{sugar_translate label='LBL_ASSIGNED_USER_ID' module='Project'}{literal}' );
addToValidate('EditView', 'modified_user_id', 'assigned_user_name', false,'{/literal}{sugar_translate label='LBL_MODIFIED_USER_ID' module='Project'}{literal}' );
addToValidate('EditView', 'modified_by_name', 'relate', false,'{/literal}{sugar_translate label='LBL_MODIFIED_NAME' module='Project'}{literal}' );
addToValidate('EditView', 'created_by', 'assigned_user_name', false,'{/literal}{sugar_translate label='LBL_CREATED_BY' module='Project'}{literal}' );
addToValidate('EditView', 'created_by_name', 'relate', false,'{/literal}{sugar_translate label='LBL_CREATED' module='Project'}{literal}' );
addToValidate('EditView', 'name', 'name', true,'{/literal}{sugar_translate label='LBL_NAME' module='Project'}{literal}' );
addToValidate('EditView', 'description', 'text', false,'{/literal}{sugar_translate label='LBL_DESCRIPTION' module='Project'}{literal}' );
addToValidate('EditView', 'deleted', 'bool', false,'{/literal}{sugar_translate label='LBL_DELETED' module='Project'}{literal}' );
addToValidateDateBeforeAllowBlank('EditView', 'estimated_start_date', 'date', true,'{/literal}{sugar_translate label='LBL_DATE_START' module='Project'}{literal}', 'estimated_end_date', 'true' );
addToValidate('EditView', 'estimated_end_date', 'date', true,'{/literal}{sugar_translate label='LBL_DATE_END' module='Project'}{literal}' );
addToValidate('EditView', 'status', 'enum', false,'{/literal}{sugar_translate label='LBL_STATUS' module='Project'}{literal}' );
addToValidate('EditView', 'priority', 'enum', false,'{/literal}{sugar_translate label='LBL_PRIORITY' module='Project'}{literal}' );
addToValidate('EditView', 'total_estimated_effort', 'int', false,'{/literal}{sugar_translate label='LBL_LIST_TOTAL_ESTIMATED_EFFORT' module='Project'}{literal}' );
addToValidate('EditView', 'total_actual_effort', 'int', false,'{/literal}{sugar_translate label='LBL_LIST_TOTAL_ACTUAL_EFFORT' module='Project'}{literal}' );
addToValidate('EditView', 'assigned_user_name', 'relate', false,'{/literal}{sugar_translate label='LBL_ASSIGNED_USER_NAME' module='Project'}{literal}' );
addToValidate('EditView', 'areablock_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_AREABLOCK' module='Project'}{literal}' );
addToValidate('EditView', 'wellname_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_WELLNAME' module='Project'}{literal}' );
addToValidate('EditView', 'ocsg_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_OCSG' module='Project'}{literal}' );
addToValidate('EditView', 'afe_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_AFE' module='Project'}{literal}' );
addToValidate('EditView', 'po_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_PO' module='Project'}{literal}' );
addToValidate('EditView', 'facility_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_FACILITY' module='Project'}{literal}' );
addToValidate('EditView', 'customer_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_CUSTOMER' module='Project'}{literal}' );
addToValidate('EditView', 'dockname_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_DOCKNAME' module='Project'}{literal}' );
addToValidate('EditView', 'heliname_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_HELINAME' module='Project'}{literal}' );
addToValidate('EditView', 'prebill_c', 'bool', false,'{/literal}{sugar_translate label='LBL_PREBILL' module='Project'}{literal}' );
addToValidate('EditView', 'address1_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_ADDRESS1' module='Project'}{literal}' );
addToValidate('EditView', 'address2_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_ADDRESS2' module='Project'}{literal}' );
addToValidate('EditView', 'city_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_CITY' module='Project'}{literal}' );
addToValidate('EditView', 'state_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_STATE' module='Project'}{literal}' );
addToValidate('EditView', 'zip_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_ZIP' module='Project'}{literal}' );
addToValidate('EditView', 'contactname_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_CONTACTNAME' module='Project'}{literal}' );
addToValidate('EditView', 'contactphone_c', 'phone', false,'{/literal}{sugar_translate label='LBL_CONTACTPHONE' module='Project'}{literal}' );
addToValidate('EditView', 'contactemail_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_CONTACTEMAIL' module='Project'}{literal}' );
addToValidate('EditView', 'contactfax_c', 'phone', false,'{/literal}{sugar_translate label='LBL_CONTACTFAX' module='Project'}{literal}' );
addToValidateBinaryDependency('EditView', 'assigned_user_name', 'alpha', false,'{/literal}{sugar_translate label='ERR_SQS_NO_MATCH_FIELD' module='Project'}{literal}: {/literal}{sugar_translate label='LBL_ASSIGNED_TO' module='Project'}{literal}', 'assigned_user_id' );
</script><script language="javascript">if(typeof sqs_objects == 'undefined'){var sqs_objects = new Array;}sqs_objects['EditView_assigned_user_name']={"form":"EditView","method":"get_user_array","field_list":["user_name","id"],"populate_list":["assigned_user_name","assigned_user_id"],"required_list":["assigned_user_id"],"conditions":[{"name":"user_name","op":"like_custom","end":"%","value":""}],"limit":"30","no_match_text":"No Match"};</script>{/literal}
