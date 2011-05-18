
{if strval($fields.prebill_c.value) == "1" || strval($fields.prebill_c.value) == "yes" || strval($fields.prebill_c.value) == "on"} 
{assign var="checked" value="CHECKED"}
{else}
{assign var="checked" value=""}
{/if}
<input type="hidden" name="{$fields.prebill_c.name}" value="0"> 
<input type="checkbox" id="{$fields.prebill_c.name}" 
name="{$fields.prebill_c.name}" 
value="1" title='' tabindex="1" {$checked} >