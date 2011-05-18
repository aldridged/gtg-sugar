
{if strlen($fields.contactname_c.value) <= 0}
{assign var="value" value=$fields.contactname_c.default_value }
{else}
{assign var="value" value=$fields.contactname_c.value }
{/if}  
<input type='text' name='{$fields.contactname_c.name}' 
    id='{$fields.contactname_c.name}' size='30' 
    maxlength='255' 
    value='{$value}' title='' tabindex='1' > 