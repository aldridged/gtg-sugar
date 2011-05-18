
{if empty($fields.resolution.value)}
{assign var="value" value=$fields.resolution.default_value }
{else}
{assign var="value" value=$fields.resolution.value }
{/if}  




<textarea  id='{$fields.resolution.name}' name='{$fields.resolution.name}'
rows="4" 
cols="60" 
title='' tabindex="1" >{$value}</textarea>


