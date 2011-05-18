
{if strlen($fields.zip_c.value) <= 0}
{assign var="value" value=$fields.zip_c.default_value }
{else}
{assign var="value" value=$fields.zip_c.value }
{/if}  
<input type='text' name='{$fields.zip_c.name}' 
    id='{$fields.zip_c.name}' size='30' 
    maxlength='255' 
    value='{$value}' title='' tabindex='1' > 