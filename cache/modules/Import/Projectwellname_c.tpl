
{if strlen($fields.wellname_c.value) <= 0}
{assign var="value" value=$fields.wellname_c.default_value }
{else}
{assign var="value" value=$fields.wellname_c.value }
{/if}  
<input type='text' name='{$fields.wellname_c.name}' 
    id='{$fields.wellname_c.name}' size='30' 
    maxlength='255' 
    value='{$value}' title='' tabindex='1' > 