

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
{if $bean->aclAccess("edit")}<input title="{$APP.LBL_EDIT_BUTTON_TITLE}" accessKey="{$APP.LBL_EDIT_BUTTON_KEY}" class="button primary" onclick="this.form.return_module.value='Cases'; this.form.return_action.value='DetailView'; this.form.return_id.value='{$id}'; this.form.action.value='EditView';" type="submit" name="Edit" id="edit_button" value="{$APP.LBL_EDIT_BUTTON_LABEL}">{/if} 
{if $bean->aclAccess("edit")}<input title="{$APP.LBL_DUPLICATE_BUTTON_TITLE}" accessKey="{$APP.LBL_DUPLICATE_BUTTON_KEY}" class="button" onclick="this.form.return_module.value='Cases'; this.form.return_action.value='DetailView'; this.form.isDuplicate.value=true; this.form.action.value='EditView'; this.form.return_id.value='{$id}';" type="submit" name="Duplicate" value="{$APP.LBL_DUPLICATE_BUTTON_LABEL}" id="duplicate_button">{/if} 
{if $bean->aclAccess("delete")}<input title="{$APP.LBL_DELETE_BUTTON_TITLE}" accessKey="{$APP.LBL_DELETE_BUTTON_KEY}" class="button" onclick="this.form.return_module.value='Cases'; this.form.return_action.value='ListView'; this.form.action.value='Delete'; return confirm('{$APP.NTC_DELETE_CONFIRMATION}');" type="submit" name="Delete" value="{$APP.LBL_DELETE_BUTTON_LABEL}">{/if} 
{if $bean->aclAccess("edit")}<input title="{$APP.LBL_DUP_MERGE}" accessKey="M" class="button" onclick="this.form.return_module.value='Cases'; this.form.return_action.value='DetailView'; this.form.return_id.value='{$id}'; this.form.action.value='Step1'; this.form.module.value='MergeRecords';" type="submit" name="Merge" value="{$APP.LBL_DUP_MERGE}">{/if} 
</form>
</td>
<td class="buttons" align="left" NOWRAP>
{if $bean->aclAccess("detail")}{if !empty($fields.id.value) && $isAuditEnabled}<input title="{$APP.LNK_VIEW_CHANGE_LOG}" class="button" onclick='open_popup("Audit", "600", "400", "&record={$fields.id.value}&module_name=Cases", true, false,  {ldelim} "call_back_function":"set_return","form_name":"EditView","field_to_name_array":[] {rdelim} ); return false;' type="submit" value="{$APP.LNK_VIEW_CHANGE_LOG}">{/if}{/if}
</td>
<td align="right" width="100%">{$ADMIN_EDIT}
{$PAGINATION}
</td>
</tr>
</table>{sugar_include include=$includes}
<div id="Cases_detailview_tabs" 
>
<div >
<div id='LBL_CASE_INFORMATION' class='detail view'>
{counter name="panelFieldCount" start=0 print=false assign="panelFieldCount"}
<h4>{sugar_translate label='LBL_CASE_INFORMATION' module='Cases'}</h4>
<table id='detailpanel_1' cellspacing='{$gridline}'>
<tr>
<td width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_CASE_NUMBER' module='Cases'}
{/capture}
{$label|strip_semicolon}:
</td>
<td width='37.5%' >
{counter name="panelFieldCount"}
<span id='case_number'>
<span id="{$fields.case_number.name}">
{assign var="value" value=$fields.case_number.value }
{$value}
</span>
</span>
</td>
<td width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_PRIORITY' module='Cases'}
{/capture}
{$label|strip_semicolon}:
</td>
<td width='37.5%' >
{counter name="panelFieldCount"}
<span id='priority'>

{if is_string($fields.priority.options)}
{ $fields.priority.options}
{else if}
{ $fields.priority.options[$fields.priority.value]}
{/if}
</span>
</td>
</tr>
<tr>
<td width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_STATUS' module='Cases'}
{/capture}
{$label|strip_semicolon}:
</td>
<td width='37.5%' >
{counter name="panelFieldCount"}
<span id='status'>

{if is_string($fields.status.options)}
{ $fields.status.options}
{else if}
{ $fields.status.options[$fields.status.value]}
{/if}
</span>
</td>
<td width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_ACCOUNT_NAME' module='Cases'}
{/capture}
{$label|strip_semicolon}:
</td>
<td width='37.5%' >
{counter name="panelFieldCount"}

{if !empty($fields.account_id.value)}<a href="index.php?module=Accounts&action=DetailView&record={$fields.account_id.value}">{/if}
{$fields.account_name.value}
{if !empty($fields.account_id.value)}</a>{/if}
</td>
</tr>
<tr>
<td width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_TYPE' module='Cases'}
{/capture}
{$label|strip_semicolon}:
</td>
<td width='37.5%' colspan='3'>
{counter name="panelFieldCount"}
<span id='type'>

{if is_string($fields.type.options)}
{ $fields.type.options}
{else if}
{ $fields.type.options[$fields.type.value]}
{/if}
</span>
</td>
</tr>
<tr>
<td width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_SUBJECT' module='Cases'}
{/capture}
{$label|strip_semicolon}:
</td>
<td width='37.5%' colspan='3'>
{counter name="panelFieldCount"}
<span id='name'>
<span id='{$fields.name.name}'>{$fields.name.value}</span>
</span>
</td>
</tr>
<tr>
<td width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_DESCRIPTION' module='Cases'}
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
<tr>
<td width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_RESOLUTION' module='Cases'}
{/capture}
{$label|strip_semicolon}:
</td>
<td width='37.5%' colspan='3'>
{counter name="panelFieldCount"}
<span id='resolution'>
{$fields.resolution.value|escape:'htmlentitydecode'|escape:'html'|url2html|nl2br}
</span>
</td>
</tr>
</table>
</div>
{if $panelFieldCount == 0}
<script>document.getElementById("LBL_CASE_INFORMATION").style.display='none';</script>
{/if}
<div id='LBL_PANEL_ASSIGNMENT' class='detail view'>
{counter name="panelFieldCount" start=0 print=false assign="panelFieldCount"}
<h4>{sugar_translate label='LBL_PANEL_ASSIGNMENT' module='Cases'}</h4>
<table id='detailpanel_2' cellspacing='{$gridline}'>
<tr>
<td width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_ASSIGNED_TO' module='Cases'}
{/capture}
{$label|strip_semicolon}:
</td>
<td width='37.5%' >
{counter name="panelFieldCount"}

{$fields.assigned_user_name.value}
</td>
<td width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_DATE_MODIFIED' module='Cases'}
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
{sugar_translate label='LBL_DATE_ENTERED' module='Cases'}
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