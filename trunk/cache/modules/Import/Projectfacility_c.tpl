
{if strlen($fields.facility_c.value) <= 0}
{assign var="value" value=$fields.facility_c.default_value }
{else}
{assign var="value" value=$fields.facility_c.value }
{/if}  
<input type='text' name='{$fields.facility_c.name}' 
    id='{$fields.facility_c.name}' size='30' 
    maxlength='255' 
    value='{$value}' title='' tabindex='1' > 