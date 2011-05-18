
{if strlen($fields.workgroup_c.value) <= 0}
{assign var="value" value=$fields.workgroup_c.default_value }
{else}
{assign var="value" value=$fields.workgroup_c.value }
{/if}  
<input type='text' name='{$fields.workgroup_c.name}' 
    id='{$fields.workgroup_c.name}' size='30' 
    maxlength='255' 
    value='{$value}' title='' tabindex='1' > 