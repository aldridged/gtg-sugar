

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
{if $DISPLAY_EDIT}<input title="{$APP.LBL_EDIT_BUTTON_TITLE}" accessKey="{$APP.LBL_EDIT_BUTTON_KEY}" class="button" onclick="this.form.return_module.value='{$module}'; this.form.return_action.value='DetailView'; this.form.return_id.value='{$id}'; this.form.action.value='EditView'" type="submit" name="Edit" id="edit_button" value="{$APP.LBL_EDIT_BUTTON_LABEL}">{/if}
</td>
<td class="buttons" align="left" NOWRAP>
{if $DISPLAY_DUPLICATE}<input title="{$APP.LBL_DUPLICATE_BUTTON_TITLE}" accessKey="{$APP.LBL_DUPLICATE_BUTTON_KEY}" class="button" onclick="this.form.return_module.value='{$module}'     ; this.form.return_action.value='DetailView'; this.form.return_id.value='{$id}'; this.form.isDuplicate.value=true; this.form.action.value='EditView'" type="submit" name="Duplicate" value="{$APP.LBL_DUPLICATE_BUTTON_LABEL}" id="duplicate_button">{/if}
</td>
<td class="buttons" align="left" NOWRAP>
{if $DISPLAY_DELETE}<input title="{$APP.LBL_DELETE_BUTTON_LABEL}" accessKey="{$APP.LBL_DELETE_BUTTON_LABEL}" class="button" onclick="if( confirm('{$DELETE_WARNING}') ) {ldelim} this.form.return_module.value='{$module}'; this.form.return_action.value='index'; this.form.return_id.value='{$id}'; this.form.action.value='delete'; this.form.submit();{rdelim}" type="button" name="Delete" value="{$APP.LBL_DELETE_BUTTON_LABEL}" id="delete_button">{/if}
</td>
</form>
</td>
<td class="buttons" align="left" NOWRAP>
{if $bean->aclAccess("detail")}{if !empty($fields.id.value) && $isAuditEnabled}<input title="{$APP.LNK_VIEW_CHANGE_LOG}" class="button" onclick='open_popup("Audit", "600", "400", "&record={$fields.id.value}&module_name=Employees", true, false,  {ldelim} "call_back_function":"set_return","form_name":"EditView","field_to_name_array":[] {rdelim} ); return false;' type="submit" value="{$APP.LNK_VIEW_CHANGE_LOG}">{/if}{/if}
</td>
<td align="right" width="100%">{$ADMIN_EDIT}
{$PAGINATION}
</td>
</tr>
</table>{sugar_include include=$includes}
<div id="Employees_detailview_tabs" 
>
<div >
<div id='' class='detail view'>
{counter name="panelFieldCount" start=0 print=false assign="panelFieldCount"}
<table id='detailpanel_1' cellspacing='{$gridline}'>
<tr>
<td width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_EMPLOYEE_STATUS' module='Employees'}
{/capture}
{$label|strip_semicolon}:
</td>
<td width='37.5%' colspan='3'>
{counter name="panelFieldCount"}
<span id='employee_status'>
{$fields.employee_status.value}
</span>
</td>
</tr>
<tr>
<td width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_NAME' module='Employees'}
{/capture}
{$label|strip_semicolon}:
</td>
<td width='37.5%' colspan='3'>
{counter name="panelFieldCount"}
{$fields.full_name.value}	
</td>
</tr>
<tr>
<td width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_TITLE' module='Employees'}
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
{sugar_translate label='LBL_OFFICE_PHONE' module='Employees'}
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
{sugar_translate label='LBL_DEPARTMENT' module='Employees'}
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
{sugar_translate label='LBL_MOBILE_PHONE' module='Employees'}
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
{sugar_translate label='LBL_REPORTS_TO_NAME' module='Employees'}
{/capture}
{$label|strip_semicolon}:
</td>
<td width='37.5%' >
{counter name="panelFieldCount"}
<a href="index.php?module=Employees&action=DetailView&record={$fields.reports_to_id.value}">{$fields.reports_to_name.value}</a>	
</td>
<td width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_OTHER' module='Employees'}
{/capture}
{$label|strip_semicolon}:
</td>
<td width='37.5%' >
{counter name="panelFieldCount"}
<span id='phone_other'>
{if !empty($fields.phone_other.value)}
{assign var="phone_value" value=$fields.phone_other.value }
{sugar_phone value=$phone_value }
{/if}
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
{capture name="label" assign="label"}
{sugar_translate label='LBL_FAX' module='Employees'}
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
&nbsp;
</td>
<td width='37.5%' >
</td>
<td width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_HOME_PHONE' module='Employees'}
{/capture}
{$label|strip_semicolon}:
</td>
<td width='37.5%' >
{counter name="panelFieldCount"}
<span id='phone_home'>
{if !empty($fields.phone_home.value)}
{assign var="phone_value" value=$fields.phone_home.value }
{sugar_phone value=$phone_value }
{/if}
</span>
</td>
</tr>
<tr>
<td width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_MESSENGER_TYPE' module='Employees'}
{/capture}
{$label|strip_semicolon}:
</td>
<td width='37.5%' colspan='3'>
{counter name="panelFieldCount"}
<span id='messenger_type'>
{$fields.messenger_type.value}
</span>
</td>
</tr>
<tr>
<td width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_MESSENGER_ID' module='Employees'}
{/capture}
{$label|strip_semicolon}:
</td>
<td width='37.5%' colspan='3'>
{counter name="panelFieldCount"}
<span id='messenger_id'>
<span id='{$fields.messenger_id.name}'>{$fields.messenger_id.value}</span>
</span>
</td>
</tr>
<tr>
<td width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_ADDRESS' module='Employees'}
{/capture}
{$label|strip_semicolon}:
</td>
<td width='37.5%' colspan='3'>
{counter name="panelFieldCount"}
{$fields.address_street.value}<br>{$fields.address_city.value} {$fields.address_state.value}&nbsp;&nbsp;{$fields.address_postalcode.value}<br>{$fields.address_country.value}	
</td>
</tr>
<tr>
<td width='12.5%' scope="row">
{capture name="label" assign="label"}
{sugar_translate label='LBL_NOTES' module='Employees'}
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
{sugar_translate label='LBL_EMAIL' module='Employees'}
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
</table>
</div>
{if $panelFieldCount == 0}
<script>document.getElementById("").style.display='none';</script>
{/if}
</div></div>

</form>