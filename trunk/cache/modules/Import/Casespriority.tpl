

<select name="{$fields.priority.name}" 
id="{$fields.priority.name}" 
title='' tabindex="1"  
>

{if isset($fields.priority.value) && $fields.priority.value != ''}
{html_options options=$fields.priority.options selected=$fields.priority.value}
{else}
{html_options options=$fields.priority.options selected=$fields.priority.default}
{/if}
</select>