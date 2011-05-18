
{if strlen($fields.contactfax_c.value) <= 0}
{assign var="value" value=$fields.contactfax_c.default_value }
{else}
{assign var="value" value=$fields.contactfax_c.value }
{/if}  
<input type='text' name='{$fields.contactfax_c.name}' 
    id='{$fields.contactfax_c.name}' size='30' 
    maxlength='255' 
    value='{$value}' title='' tabindex='1' > 