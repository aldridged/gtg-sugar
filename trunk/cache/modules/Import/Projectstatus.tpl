

<select name="{$fields.status.name}" 
id="{$fields.status.name}" 
title='' tabindex="1"  
>

{if isset($fields.status.value) && $fields.status.value != ''}
{html_options options=$fields.status.options selected=$fields.status.value}
{else}
{html_options options=$fields.status.options selected=$fields.status.default}
{/if}
</select>