
{if strlen($fields.dockname_c.value) <= 0}
{assign var="value" value=$fields.dockname_c.default_value }
{else}
{assign var="value" value=$fields.dockname_c.value }
{/if}  
<input type='text' name='{$fields.dockname_c.name}' 
    id='{$fields.dockname_c.name}' size='30' 
    maxlength='255' 
    value='{$value}' title='' tabindex='1' > 