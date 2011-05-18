
{if strlen($fields.glcode_c.value) <= 0}
{assign var="value" value=$fields.glcode_c.default_value }
{else}
{assign var="value" value=$fields.glcode_c.value }
{/if}  
<input type='text' name='{$fields.glcode_c.name}' 
    id='{$fields.glcode_c.name}' size='30' 
    maxlength='25' 
    value='{$value}' title='GL Code' tabindex='1' > 