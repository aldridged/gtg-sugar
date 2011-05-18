
{if strlen($fields.state_c.value) <= 0}
{assign var="value" value=$fields.state_c.default_value }
{else}
{assign var="value" value=$fields.state_c.value }
{/if}  
<input type='text' name='{$fields.state_c.name}' 
    id='{$fields.state_c.name}' size='30' 
    maxlength='255' 
    value='{$value}' title='' tabindex='1' > 