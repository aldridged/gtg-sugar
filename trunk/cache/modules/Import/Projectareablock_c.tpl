
{if strlen($fields.areablock_c.value) <= 0}
{assign var="value" value=$fields.areablock_c.default_value }
{else}
{assign var="value" value=$fields.areablock_c.value }
{/if}  
<input type='text' name='{$fields.areablock_c.name}' 
    id='{$fields.areablock_c.name}' size='30' 
    maxlength='255' 
    value='{$value}' title='Area/Block' tabindex='1' > 