
{if empty($fields.work_log.value)}
{assign var="value" value=$fields.work_log.default_value }
{else}
{assign var="value" value=$fields.work_log.value }
{/if}  




<textarea  id='{$fields.work_log.name}' name='{$fields.work_log.name}'
rows="4" 
cols="60" 
title='' tabindex="1" >{$value}</textarea>


