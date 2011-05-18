
{if strlen($fields.ticketnumber_c.value) <= 0}
{assign var="value" value=$fields.ticketnumber_c.default_value }
{else}
{assign var="value" value=$fields.ticketnumber_c.value }
{/if}  
<input type='text' name='{$fields.ticketnumber_c.name}' 
    id='{$fields.ticketnumber_c.name}' size='30' 
    maxlength='255' 
    value='{$value}' title='' tabindex='1' > 