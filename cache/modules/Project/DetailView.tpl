

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
<td class="buttons" align="left" NOWRAP>
<input title="{$APP.LBL_EDIT_BUTTON_TITLE}" accessKey="{$APP.LBL_EDIT_BUTTON_KEY}" class="button" type="submit" name="Edit" id="edit_button" value="{$APP.LBL_EDIT_BUTTON_LABEL}"{if $IS_TEMPLATE}onclick="this.form.return_module.value='Project'; this.form.return_action.value='ProjectTemplatesDetailView'; this.form.return_id.value='{$id}'; this.form.action.value='ProjectTemplatesEditView';"{else}onclick="this.form.return_module.value='Project'; this.form.return_action.value='DetailView'; this.form.return_id.value='{$id}'; this.form.action.value='EditView';" {/if}"/>
</td>
<td class="buttons" align="left" NOWRAP>
<input title="{$APP.LBL_DELETE_BUTTON_TITLE}" accessKey="{$APP.LBL_DELETE_BUTTON_KEY}" class="button" type="submit" name="Delete" id="delete_button" value="{$APP.LBL_DELETE_BUTTON_LABEL}"{if $IS_TEMPLATE}onclick="this.form.return_module.value='Project'; this.form.return_action.value='ProjectTemplatesListView'; this.form.action.value='Delete'; return confirm('{$APP.NTC_DELETE_CONFIRMATION}');"{else}onclick="this.form.return_module.value='Project'; this.form.return_action.value='ListView'; this.form.action.value='Delete'; return confirm('{$APP.NTC_DELETE_CONFIRMATION}');" {/if}"/>
</td>
<td class="buttons" align="left" NOWRAP>
<input title="{$APP.LBL_DUPLICATE_BUTTON_TITLE}" accessKey="{$APP.LBL_DUPLICATE_BUTTON_KEY}" class="button" type="submit" name="Duplicate" id="duplicate_button" value="{$APP.LBL_DUPLICATE_BUTTON_LABEL}"{if $IS_TEMPLATE}onclick="this.form.return_module.value='Project'; this.form.return_action.value='ProjectTemplatesDetailView'; this.form.isDuplicate.value=true; this.form.action.value='projecttemplateseditview'; this.form.return_id.value='{$id}';"{else}onclick="this.form.return_module.value='Project'; this.form.return_action.value='DetailView'; this.form.isDuplicate.value=true; this.form.action.value='EditView'; this.form.return_id.value='{$id}';" {/if}"/>
</td>
</form>
</td>
<td class="buttons" align="left" NOWRAP>
{if $bean->aclAccess("detail")}{if !empty($fields.id.value) && $isAuditEnabled}<input title="{$APP.LNK_VIEW_CHANGE_LOG}" class="button" onclick='open_popup("Audit", "600", "400", "&record={$fields.id.value}&module_name=Project", true, false,  {ldelim} "call_back_function":"set_return","form_name":"EditView","field_to_name_array":[] {rdelim} ); return false;' type="submit" value="{$APP.LNK_VIEW_CHANGE_LOG}">{/if}{/if}
</td>
<td align="right" width="100%">{$ADMIN_EDIT}
{$PAGINATION}
</td>
</tr>
</table>{sugar_include include=$includes}
<div id="Project_detailview_tabs" 
>
<div >
<div id='LBL_PROJECT_INFORMATION' class='detail view'>
{counter name="panelFieldCount" start=0 print=false assign="panelFieldCount"}
<h4>{sugar_translate label='LBL_PROJECT_INFORMATION' module='Project'}</h4>
<table id='detailpanel_1' cellspacing='{$gridline}'>
<tr>
<td width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_NAME' module='Project'}
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
{sugar_translate label='LBL_STATUS' module='Project'}
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
</tr>
<tr>
<td width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_DATE_START' module='Project'}
{/capture}
{$label|strip_semicolon}:
</td>
<td width='37.5%' >
{counter name="panelFieldCount"}
<span id='estimated_start_date'>
<span id='{$fields.estimated_start_date.name}'>{$fields.estimated_start_date.value}</span>
</span>
</td>
<td width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_PRIORITY' module='Project'}
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
{sugar_translate label='LBL_DATE_END' module='Project'}
{/capture}
{$label|strip_semicolon}:
</td>
<td width='37.5%' >
{counter name="panelFieldCount"}
<span id='estimated_end_date'>
<span id='{$fields.estimated_end_date.name}'>{$fields.estimated_end_date.value}</span>
</span>
</td>
<td width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_PO' module='Project'}
{/capture}
{$label|strip_semicolon}:
</td>
<td width='37.5%' >
{counter name="panelFieldCount"}
<span id='po_c'>
<span id='{$fields.po_c.name}'>{$fields.po_c.value}</span>
</span>
</td>
</tr>
<tr>
<td width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_FACILITY' module='Project'}
{/capture}
{$label|strip_semicolon}:
</td>
<td width='37.5%' colspan='3'>
{counter name="panelFieldCount"}
<span id='facility_c'>
<span id='{$fields.facility_c.name}'>{$fields.facility_c.value}</span>
</span>
</td>
</tr>
<tr>
<td width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_AREABLOCK' module='Project'}
{/capture}
{$label|strip_semicolon}:
</td>
<td width='37.5%' >
{counter name="panelFieldCount"}
<span id='areablock_c'>
<span id='{$fields.areablock_c.name}'>{$fields.areablock_c.value}</span>
</span>
</td>
<td width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_WELLNAME' module='Project'}
{/capture}
{$label|strip_semicolon}:
</td>
<td width='37.5%' >
{counter name="panelFieldCount"}
<span id='wellname_c'>
<span id='{$fields.wellname_c.name}'>{$fields.wellname_c.value}</span>
</span>
</td>
</tr>
<tr>
<td width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_OCSG' module='Project'}
{/capture}
{$label|strip_semicolon}:
</td>
<td width='37.5%' >
{counter name="panelFieldCount"}
<span id='ocsg_c'>
<span id='{$fields.ocsg_c.name}'>{$fields.ocsg_c.value}</span>
</span>
</td>
<td width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_AFE' module='Project'}
{/capture}
{$label|strip_semicolon}:
</td>
<td width='37.5%' >
{counter name="panelFieldCount"}
<span id='afe_c'>
<span id='{$fields.afe_c.name}'>{$fields.afe_c.value}</span>
</span>
</td>
</tr>
<tr>
<td width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_DOCKNAME' module='Project'}
{/capture}
{$label|strip_semicolon}:
</td>
<td width='37.5%' >
{counter name="panelFieldCount"}
<span id='dockname_c'>
<span id='{$fields.dockname_c.name}'>{$fields.dockname_c.value}</span>
</span>
</td>
<td width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_HELINAME' module='Project'}
{/capture}
{$label|strip_semicolon}:
</td>
<td width='37.5%' >
{counter name="panelFieldCount"}
<span id='heliname_c'>
<span id='{$fields.heliname_c.name}'>{$fields.heliname_c.value}</span>
</span>
</td>
</tr>
<tr>
<td width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_DESCRIPTION' module='Project'}
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
<script>document.getElementById("LBL_PROJECT_INFORMATION").style.display='none';</script>
{/if}
<div id='LBL_PANEL_ASSIGNMENT' class='detail view'>
{counter name="panelFieldCount" start=0 print=false assign="panelFieldCount"}
<h4>{sugar_translate label='LBL_PANEL_ASSIGNMENT' module='Project'}</h4>
<table id='detailpanel_2' cellspacing='{$gridline}'>
<tr>
<td width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_ASSIGNED_TO' module='Project'}
{/capture}
{$label|strip_semicolon}:
</td>
<td width='37.5%' >
{counter name="panelFieldCount"}

{$fields.assigned_user_name.value}
</td>
<td width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_DATE_MODIFIED' module='Project'}
{/capture}
{$label|strip_semicolon}:
</td>
<td width='37.5%' >
{counter name="panelFieldCount"}
{$fields.date_modified.value} {$APP.LBL_BY} {$fields.modified_by_name.value}&nbsp;	
</td>
</tr>
<tr>
<td width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_DATE_ENTERED' module='Project'}
{/capture}
{$label|strip_semicolon}:
</td>
<td width='37.5%' colspan='3'>
{counter name="panelFieldCount"}
{$fields.date_entered.value} {$APP.LBL_BY} {$fields.created_by_name.value}&nbsp;	
</td>
</tr>
</table>
</div>
{if $panelFieldCount == 0}
<script>document.getElementById("LBL_PANEL_ASSIGNMENT").style.display='none';</script>
{/if}
</div></div>

</form>