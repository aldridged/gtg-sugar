

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
{if !empty($smarty.request.return_action) && ($smarty.request.return_action == "DetailView" && !empty($smarty.request.return_id))}<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="window.location.href='index.php?action=DetailView&module={$smarty.request.return_module}&record={$smarty.request.return_id}'; return false;" name="button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}" type="button"> {elseif !empty($smarty.request.return_action) && ($smarty.request.return_action == "DetailView" && !empty($fields.id.value))}<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="window.location.href='index.php?action=DetailView&module={$smarty.request.return_module}&record={$fields.id.value}'; return false;" type="button" name="button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}"> {elseif empty($smarty.request.return_action) || empty($smarty.request.return_id) && !empty($fields.id.value)}<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="window.location.href='index.php?action=index&module=ProjectTask'; return false;" type="button" name="button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}"> {else}<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="window.location.href='index.php?action=index&module={$smarty.request.return_module}&record={$smarty.request.return_id}'; return false;" type="button" name="button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}"> {/if}
{if $bean->aclAccess("detail")}{if !empty($fields.id.value) && $isAuditEnabled}<input title="{$APP.LNK_VIEW_CHANGE_LOG}" class="button" onclick='open_popup("Audit", "600", "400", "&record={$fields.id.value}&module_name=ProjectTask", true, false,  {ldelim} "call_back_function":"set_return","form_name":"EditView","field_to_name_array":[] {rdelim} ); return false;' type="submit" value="{$APP.LNK_VIEW_CHANGE_LOG}">{/if}{/if}
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
<td valign="top" id='name_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_NAME' module='ProjectTask'}
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
<td valign="top" id='project_task_id_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_TASK_ID' module='ProjectTask'}
{/capture}
{$label|strip_semicolon}:
<span class="required">*</span>
</td>
<td valign="top" width='37.5%' >
{counter name="panelFieldCount"}

{if strlen($fields.project_task_id.value) <= 0}
{assign var="value" value=$fields.project_task_id.default_value }
{else}
{assign var="value" value=$fields.project_task_id.value }
{/if}  
<input type='text' name='{$fields.project_task_id.name}' 
id='{$fields.project_task_id.name}' size='30'  value='{sugar_number_format precision=0 var=$value}' title='' tabindex='101' > 
</tr>
<tr>
<td valign="top" id='date_start_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_DATE_START' module='ProjectTask'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' >
{counter name="panelFieldCount"}

{assign var=date_value value=$fields.date_start.value }
<input autocomplete="off" type="text" name="{$fields.date_start.name}" id="{$fields.date_start.name}" value="{$date_value}" title=''  tabindex='102' size="11" maxlength="10">
<img border="0" src="{sugar_getimagepath file='jscalendar.gif'}" alt="{$APP.LBL_ENTER_DATE}" id="{$fields.date_start.name}_trigger" align="absmiddle" />
<script type="text/javascript">
Calendar.setup ({ldelim}
inputField : "{$fields.date_start.name}",
daFormat : "{$CALENDAR_FORMAT}",
button : "{$fields.date_start.name}_trigger",
singleClick : true,
dateStr : "{$date_value}",
step : 1,
weekNumbers:false
{rdelim}
);
</script>
<td valign="top" id='date_finish_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_DATE_FINISH' module='ProjectTask'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' >
{counter name="panelFieldCount"}

{assign var=date_value value=$fields.date_finish.value }
<input autocomplete="off" type="text" name="{$fields.date_finish.name}" id="{$fields.date_finish.name}" value="{$date_value}" title=''  tabindex='103' size="11" maxlength="10">
<img border="0" src="{sugar_getimagepath file='jscalendar.gif'}" alt="{$APP.LBL_ENTER_DATE}" id="{$fields.date_finish.name}_trigger" align="absmiddle" />
<script type="text/javascript">
Calendar.setup ({ldelim}
inputField : "{$fields.date_finish.name}",
daFormat : "{$CALENDAR_FORMAT}",
button : "{$fields.date_finish.name}_trigger",
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
{sugar_translate label='LBL_ASSIGNED_USER_NAME' module='ProjectTask'}
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
{literal}{"call_back_function":"set_return","form_name":"EditView","field_to_name_array":{"id":"assigned_user_id","user_name":"assigned_user_name"}}{/literal}, 
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
<td valign="top" id='status_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_STATUS' module='ProjectTask'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' >
{counter name="panelFieldCount"}
<select tabindex="105"  name="{$fields.status.name}" id="{$fields.status.name}" title="" tabindex="s" onchange="update_percent_complete(this.value);">{if isset($fields.status.value) && $fields.status.value != ""}{html_options options=$fields.status.options selected=$fields.status.value}{else}{html_options options=$fields.status.options selected=$fields.status.default}{/if}</select>
<td valign="top" id='priority_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_PRIORITY' module='ProjectTask'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' >
{counter name="panelFieldCount"}

<select name="{$fields.priority.name}" 
id="{$fields.priority.name}" 
title='' tabindex="106"  
>
{if isset($fields.priority.value) && $fields.priority.value != ''}
{html_options options=$fields.priority.options selected=$fields.priority.value}
{else}
{html_options options=$fields.priority.options selected=$fields.priority.default}
{/if}
</select>
</tr>
<tr>
<td valign="top" id='percent_complete_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_PERCENT_COMPLETE' module='ProjectTask'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' colspan='3'>
{counter name="panelFieldCount"}
<input tabindex="107"  type="text" name="{$fields.percent_complete.name}" id="{$fields.percent_complete.name}" size="30" value="{$fields.percent_complete.value}" title="" tabindex="0" onChange="update_status(this.value);" /></tr>
</tr>
<tr>
<td valign="top" id='milestone_flag_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_MILESTONE_FLAG' module='ProjectTask'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' colspan='3'>
{counter name="panelFieldCount"}

{if strval($fields.milestone_flag.value) == "1" || strval($fields.milestone_flag.value) == "yes" || strval($fields.milestone_flag.value) == "on"} 
{assign var="checked" value="CHECKED"}
{else}
{assign var="checked" value=""}
{/if}
<input type="hidden" name="{$fields.milestone_flag.name}" value="0"> 
<input type="checkbox" id="{$fields.milestone_flag.name}" 
name="{$fields.milestone_flag.name}" 
value="1" title='' tabindex="108" {$checked} >
</tr>
<tr>
<td valign="top" id='project_name_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_PROJECT_NAME' module='ProjectTask'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' colspan='3'>
{counter name="panelFieldCount"}

<input type="text" name="{$fields.project_name.name}" class="sqsEnabled" tabindex="109" id="{$fields.project_name.name}" size="" value="{$fields.project_name.value}" title='' autocomplete="off"  >
<input type="hidden" name="{$fields.project_name.id_name}" 
id="{$fields.project_name.id_name}" 
value="{$fields.project_id.value}">
<span class="id-ff multiple">
<button type="button" name="btn_{$fields.project_name.name}" id="btn_{$fields.project_name.name}" tabindex="109" title="{$APP.LBL_SELECT_BUTTON_TITLE}" accessKey="{$APP.LBL_SELECT_BUTTON_KEY}" class="button firstChild" value="{$APP.LBL_SELECT_BUTTON_LABEL}" 
onclick='open_popup(
"{$fields.project_name.module}", 
600, 
400, 
"", 
true, 
false, 
{literal}{"call_back_function":"set_return","form_name":"EditView","field_to_name_array":{"id":"project_id","name":"project_name"}}{/literal}, 
"single", 
true
);' ><img src="{sugar_getimagepath file="id-ff-select.png"}"></button><button type="button" name="btn_clr_{$fields.project_name.name}" id="btn_clr_{$fields.project_name.name}" tabindex="109" title="{$APP.LBL_CLEAR_BUTTON_TITLE}" accessKey="{$APP.LBL_CLEAR_BUTTON_KEY}" class="button lastChild" 
onclick="this.form.{$fields.project_name.name}.value = ''; this.form.{$fields.project_name.id_name}.value = '';" 
value="{$APP.LBL_CLEAR_BUTTON_LABEL}" ><img src="{sugar_getimagepath file="id-ff-clear.png"}"></button>
</span>
<script type="text/javascript">
<!--
if(typeof QSProcessedFieldsArray != 'undefined') 
	QSProcessedFieldsArray["{$form_name}_{$fields.project_name.name}"] = false;
	

enableQS(false);
-->	
</script>
</tr>
<tr>
<td valign="top" id='task_number_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_TASK_NUMBER' module='ProjectTask'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' >
{counter name="panelFieldCount"}

{if strlen($fields.task_number.value) <= 0}
{assign var="value" value=$fields.task_number.default_value }
{else}
{assign var="value" value=$fields.task_number.value }
{/if}  
<input type='text' name='{$fields.task_number.name}' 
id='{$fields.task_number.name}' size='30'  value='{sugar_number_format precision=0 var=$value}' title='' tabindex='110' > 
<td valign="top" id='order_number_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_ORDER_NUMBER' module='ProjectTask'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' >
{counter name="panelFieldCount"}

{if strlen($fields.order_number.value) <= 0}
{assign var="value" value=$fields.order_number.default_value }
{else}
{assign var="value" value=$fields.order_number.value }
{/if}  
<input type='text' name='{$fields.order_number.name}' 
id='{$fields.order_number.name}' size='30'  value='{sugar_number_format precision=0 var=$value}' title='' tabindex='111' > 
</tr>
<tr>
<td valign="top" id='estimated_effort_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_ESTIMATED_EFFORT' module='ProjectTask'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' >
{counter name="panelFieldCount"}

{if strlen($fields.estimated_effort.value) <= 0}
{assign var="value" value=$fields.estimated_effort.default_value }
{else}
{assign var="value" value=$fields.estimated_effort.value }
{/if}  
<input type='text' name='{$fields.estimated_effort.name}' 
id='{$fields.estimated_effort.name}' size='30'  value='{sugar_number_format precision=0 var=$value}' title='' tabindex='112' > 
<td valign="top" id='utilization_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_UTILIZATION' module='ProjectTask'}
{/capture}
{$label|strip_semicolon}:
</td>
<td valign="top" width='37.5%' >
{counter name="panelFieldCount"}
<span id='utilization'>
{$fields.utilization.value}</span>
</tr>
<tr>
<td valign="top" id='description_label' width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_DESCRIPTION' module='ProjectTask'}
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
title='' tabindex="114" >{$value}</textarea>
</tr>
<tr>
<td valign="top" width='37.5%' colspan='3'>
{counter name="panelFieldCount"}
<input tabindex="115"  type="hidden" name="duration" id="projectTask_duration" value="0" />
</tr>
<tr>
<td valign="top" width='37.5%' colspan='3'>
{counter name="panelFieldCount"}
<input tabindex="116"  type="hidden" name="duration_unit" id="projectTask_durationUnit" value="Days" />
</tr>
</table>
</div>
{if $panelFieldCount == 0}
<script>document.getElementById("DEFAULT").style.display='none';</script>
{/if}
</div></div>

<div class="buttons">
{if $bean->aclAccess("save")}<input title="{$APP.LBL_SAVE_BUTTON_TITLE}" accessKey="{$APP.LBL_SAVE_BUTTON_KEY}" class="button primary" onclick="{if $isDuplicate}this.form.return_id.value=''; {/if}this.form.action.value='Save'; return check_form('EditView');" type="submit" name="button" value="{$APP.LBL_SAVE_BUTTON_LABEL}">{/if} 
{if !empty($smarty.request.return_action) && ($smarty.request.return_action == "DetailView" && !empty($smarty.request.return_id))}<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="window.location.href='index.php?action=DetailView&module={$smarty.request.return_module}&record={$smarty.request.return_id}'; return false;" name="button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}" type="button"> {elseif !empty($smarty.request.return_action) && ($smarty.request.return_action == "DetailView" && !empty($fields.id.value))}<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="window.location.href='index.php?action=DetailView&module={$smarty.request.return_module}&record={$fields.id.value}'; return false;" type="button" name="button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}"> {elseif empty($smarty.request.return_action) || empty($smarty.request.return_id) && !empty($fields.id.value)}<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="window.location.href='index.php?action=index&module=ProjectTask'; return false;" type="button" name="button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}"> {else}<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="window.location.href='index.php?action=index&module={$smarty.request.return_module}&record={$smarty.request.return_id}'; return false;" type="button" name="button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}"> {/if}
{if $bean->aclAccess("detail")}{if !empty($fields.id.value) && $isAuditEnabled}<input title="{$APP.LNK_VIEW_CHANGE_LOG}" class="button" onclick='open_popup("Audit", "600", "400", "&record={$fields.id.value}&module_name=ProjectTask", true, false,  {ldelim} "call_back_function":"set_return","form_name":"EditView","field_to_name_array":[] {rdelim} ); return false;' type="submit" value="{$APP.LNK_VIEW_CHANGE_LOG}">{/if}{/if}
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
addToValidate('EditView', 'id', 'id', false,'{/literal}{sugar_translate label='LBL_ID' module='ProjectTask'}{literal}' );
addToValidate('EditView', 'date_entered_date', 'date', false,'Date Created' );
addToValidate('EditView', 'date_modified_date', 'date', false,'Date Modified' );
addToValidate('EditView', 'project_id', 'id', true,'{/literal}{sugar_translate label='LBL_PROJECT_ID' module='ProjectTask'}{literal}' );
addToValidate('EditView', 'project_task_id', 'int', true,'{/literal}{sugar_translate label='LBL_PROJECT_TASK_ID' module='ProjectTask'}{literal}' );
addToValidate('EditView', 'name', 'name', true,'{/literal}{sugar_translate label='LBL_NAME' module='ProjectTask'}{literal}' );
addToValidate('EditView', 'status', 'enum', false,'{/literal}{sugar_translate label='LBL_STATUS' module='ProjectTask'}{literal}' );
addToValidate('EditView', 'description', 'text', false,'{/literal}{sugar_translate label='LBL_DESCRIPTION' module='ProjectTask'}{literal}' );
addToValidate('EditView', 'predecessors', 'text', false,'{/literal}{sugar_translate label='LBL_PREDECESSORS' module='ProjectTask'}{literal}' );
addToValidateDateBeforeAllowBlank('EditView', 'date_start', 'date', false,'{/literal}{sugar_translate label='LBL_DATE_START' module='ProjectTask'}{literal}', 'date_finish', 'true' );
addToValidate('EditView', 'time_start', 'int', false,'{/literal}{sugar_translate label='LBL_TIME_START' module='ProjectTask'}{literal}' );
addToValidate('EditView', 'time_finish', 'int', false,'{/literal}{sugar_translate label='LBL_TIME_FINISH' module='ProjectTask'}{literal}' );
addToValidate('EditView', 'date_finish', 'date', false,'{/literal}{sugar_translate label='LBL_DATE_FINISH' module='ProjectTask'}{literal}' );
addToValidate('EditView', 'duration', 'int', true,'{/literal}{sugar_translate label='LBL_DURATION' module='ProjectTask'}{literal}' );
addToValidate('EditView', 'duration_unit', 'text', false,'{/literal}{sugar_translate label='LBL_DURATION_UNIT' module='ProjectTask'}{literal}' );
addToValidate('EditView', 'actual_duration', 'int', false,'{/literal}{sugar_translate label='LBL_ACTUAL_DURATION' module='ProjectTask'}{literal}' );
addToValidate('EditView', 'percent_complete', 'int', false,'{/literal}{sugar_translate label='LBL_PERCENT_COMPLETE' module='ProjectTask'}{literal}' );
addToValidate('EditView', 'parent_task_id', 'int', false,'{/literal}{sugar_translate label='LBL_PARENT_TASK_ID' module='ProjectTask'}{literal}' );
addToValidate('EditView', 'assigned_user_id', 'assigned_user_name', false,'{/literal}{sugar_translate label='LBL_ASSIGNED_USER_ID' module='ProjectTask'}{literal}' );
addToValidate('EditView', 'modified_user_id', 'assigned_user_name', false,'{/literal}{sugar_translate label='LBL_MODIFIED_USER_ID' module='ProjectTask'}{literal}' );
addToValidate('EditView', 'modified_by_name', 'relate', false,'{/literal}{sugar_translate label='LBL_MODIFIED_NAME' module='ProjectTask'}{literal}' );
addToValidate('EditView', 'priority', 'enum', false,'{/literal}{sugar_translate label='LBL_PRIORITY' module='ProjectTask'}{literal}' );
addToValidate('EditView', 'created_by', 'assigned_user_name', false,'{/literal}{sugar_translate label='LBL_CREATED_BY' module='ProjectTask'}{literal}' );
addToValidate('EditView', 'created_by_name', 'relate', false,'{/literal}{sugar_translate label='LBL_CREATED' module='ProjectTask'}{literal}' );
addToValidate('EditView', 'milestone_flag', 'bool', false,'{/literal}{sugar_translate label='LBL_MILESTONE_FLAG' module='ProjectTask'}{literal}' );
addToValidate('EditView', 'order_number', 'int', false,'{/literal}{sugar_translate label='LBL_ORDER_NUMBER' module='ProjectTask'}{literal}' );
addToValidate('EditView', 'task_number', 'int', false,'{/literal}{sugar_translate label='LBL_TASK_NUMBER' module='ProjectTask'}{literal}' );
addToValidate('EditView', 'estimated_effort', 'int', false,'{/literal}{sugar_translate label='LBL_ESTIMATED_EFFORT' module='ProjectTask'}{literal}' );
addToValidate('EditView', 'actual_effort', 'int', false,'{/literal}{sugar_translate label='LBL_ACTUAL_EFFORT' module='ProjectTask'}{literal}' );
addToValidate('EditView', 'deleted', 'bool', false,'{/literal}{sugar_translate label='LBL_DELETED' module='ProjectTask'}{literal}' );
addToValidateRange('EditView', 'utilization', 'int', false,'{/literal}{sugar_translate label='LBL_UTILIZATION' module='ProjectTask'}{literal}', 0, 100 );
addToValidate('EditView', 'project_name', 'relate', false,'{/literal}{sugar_translate label='LBL_PARENT_NAME' module='ProjectTask'}{literal}' );
addToValidate('EditView', 'assigned_user_name', 'relate', false,'{/literal}{sugar_translate label='LBL_ASSIGNED_USER_NAME' module='ProjectTask'}{literal}' );
addToValidateBinaryDependency('EditView', 'assigned_user_name', 'alpha', false,'{/literal}{sugar_translate label='ERR_SQS_NO_MATCH_FIELD' module='ProjectTask'}{literal}: {/literal}{sugar_translate label='LBL_ASSIGNED_TO' module='ProjectTask'}{literal}', 'assigned_user_id' );
addToValidateBinaryDependency('EditView', 'project_name', 'alpha', false,'{/literal}{sugar_translate label='ERR_SQS_NO_MATCH_FIELD' module='ProjectTask'}{literal}: {/literal}{sugar_translate label='LBL_PARENT_NAME' module='ProjectTask'}{literal}', 'project_id' );
</script><script language="javascript">if(typeof sqs_objects == 'undefined'){var sqs_objects = new Array;}sqs_objects['EditView_assigned_user_name']={"form":"EditView","method":"get_user_array","field_list":["user_name","id"],"populate_list":["assigned_user_name","assigned_user_id"],"required_list":["assigned_user_id"],"conditions":[{"name":"user_name","op":"like_custom","end":"%","value":""}],"limit":"30","no_match_text":"No Match"};sqs_objects['EditView_project_name']={"form":"EditView","method":"query","modules":["Project"],"group":"or","field_list":["name","id"],"populate_list":["project_name","project_id"],"required_list":["parent_id"],"conditions":[{"name":"name","op":"like_custom","end":"%","value":""}],"order":"name","limit":"30","no_match_text":"No Match"};</script>{/literal}
