
{if strlen($fields.afe_c.value) <= 0}
{assign var="value" value=$fields.afe_c.default_value }
{else}
{assign var="value" value=$fields.afe_c.value }
{/if}  
<input type='text' name='{$fields.afe_c.name}' 
    id='{$fields.afe_c.name}' size='30' 
    maxlength='255' 
    value='{$value}' title='' tabindex='1' > 