
{if strlen($fields.address1_c.value) <= 0}
{assign var="value" value=$fields.address1_c.default_value }
{else}
{assign var="value" value=$fields.address1_c.value }
{/if}  
<input type='text' name='{$fields.address1_c.name}' 
    id='{$fields.address1_c.name}' size='30' 
    maxlength='255' 
    value='{$value}' title='' tabindex='1' > 