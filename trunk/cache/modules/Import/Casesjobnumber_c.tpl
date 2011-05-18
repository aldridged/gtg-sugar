
{if strlen($fields.jobnumber_c.value) <= 0}
{assign var="value" value=$fields.jobnumber_c.default_value }
{else}
{assign var="value" value=$fields.jobnumber_c.value }
{/if}  
<input type='text' name='{$fields.jobnumber_c.name}' 
    id='{$fields.jobnumber_c.name}' size='30' 
    maxlength='255' 
    value='{$value}' title='' tabindex='1' > 