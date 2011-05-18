

{assign var=date_value value=$fields.resolveddate_c.value }
<input autocomplete="off" type="text" name="{$fields.resolveddate_c.name}" id="{$fields.resolveddate_c.name}" value="{$date_value}" title=''  tabindex='1' size="11" maxlength="10">
<img border="0" src="{sugar_getimagepath file='jscalendar.gif'}" alt="{$APP.LBL_ENTER_DATE}" id="{$fields.resolveddate_c.name}_trigger" align="absmiddle" />
<script type="text/javascript">
Calendar.setup ({ldelim}
inputField : "{$fields.resolveddate_c.name}",
daFormat : "{$CALENDAR_FORMAT}",
button : "{$fields.resolveddate_c.name}_trigger",
singleClick : true,
dateStr : "{$date_value}",
step : 1,
weekNumbers:false
{rdelim}
);
</script>
