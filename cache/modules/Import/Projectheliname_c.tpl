
{if strlen($fields.heliname_c.value) <= 0}
{assign var="value" value=$fields.heliname_c.default_value }
{else}
{assign var="value" value=$fields.heliname_c.value }
{/if}  
<input type='text' name='{$fields.heliname_c.name}' 
    id='{$fields.heliname_c.name}' size='30' 
    maxlength='255' 
    value='{$value}' title='' tabindex='1' > 