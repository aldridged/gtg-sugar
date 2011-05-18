
{if strlen($fields.contactemail_c.value) <= 0}
{assign var="value" value=$fields.contactemail_c.default_value }
{else}
{assign var="value" value=$fields.contactemail_c.value }
{/if}  
<input type='text' name='{$fields.contactemail_c.name}' 
    id='{$fields.contactemail_c.name}' size='30' 
    maxlength='255' 
    value='{$value}' title='' tabindex='1' > 