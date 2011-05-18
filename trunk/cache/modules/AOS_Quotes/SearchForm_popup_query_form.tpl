<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	
	{counter assign=index}
	{math equation="left % right"
   		  left=$index
          right=$templateMeta.maxColumns
          assign=modVal
    }
	{if ($index % $templateMeta.maxColumns == 1 && $index != 1)}
		</tr><tr>
	{/if}
	
	<td scope="row" nowrap="nowrap" width='10%' >
			{sugar_translate label='LBL_NAME' module='AOS_Quotes'}
		</td>
	<td  nowrap="nowrap" width='30%'>
			
{if strlen($fields.name_advanced.value) <= 0}
{assign var="value" value=$fields.name_advanced.default_value }
{else}
{assign var="value" value=$fields.name_advanced.value }
{/if}  
<input type='text' name='{$fields.name_advanced.name}' 
    id='{$fields.name_advanced.name}' size='30' 
    maxlength='150' 
    value='{$value}' title='' tabindex='' > 
   	   	</td>
	
	{counter assign=index}
	{math equation="left % right"
   		  left=$index
          right=$templateMeta.maxColumns
          assign=modVal
    }
	{if ($index % $templateMeta.maxColumns == 1 && $index != 1)}
		</tr><tr>
	{/if}
	
	<td scope="row" nowrap="nowrap" width='10%' >
		
		{sugar_translate label='LBL_ANY_ADDRESS' module='AOS_Quotes'}
    	</td>
	<td  nowrap="nowrap" width='30%'>
			
{if strlen($fields.address_street_advanced.value) <= 0}
{assign var="value" value=$fields.address_street_advanced.default_value }
{else}
{assign var="value" value=$fields.address_street_advanced.value }
{/if}  
<input type='text' name='{$fields.address_street_advanced.name}' 
    id='{$fields.address_street_advanced.name}' size='30' 
     
    value='{$value}' title='' tabindex='' > 
   	   	</td>
	
	{counter assign=index}
	{math equation="left % right"
   		  left=$index
          right=$templateMeta.maxColumns
          assign=modVal
    }
	{if ($index % $templateMeta.maxColumns == 1 && $index != 1)}
		</tr><tr>
	{/if}
	
	<td scope="row" nowrap="nowrap" width='10%' >
		
		{sugar_translate label='LBL_ANY_PHONE' module='AOS_Quotes'}
    	</td>
	<td  nowrap="nowrap" width='30%'>
			
{if strlen($fields.phone_advanced.value) <= 0}
{assign var="value" value=$fields.phone_advanced.default_value }
{else}
{assign var="value" value=$fields.phone_advanced.value }
{/if}  
<input type='text' name='{$fields.phone_advanced.name}' 
    id='{$fields.phone_advanced.name}' size='30' 
     
    value='{$value}' title='' tabindex='' > 
   	   	</td>
	
	{counter assign=index}
	{math equation="left % right"
   		  left=$index
          right=$templateMeta.maxColumns
          assign=modVal
    }
	{if ($index % $templateMeta.maxColumns == 1 && $index != 1)}
		</tr><tr>
	{/if}
	
	<td scope="row" nowrap="nowrap" width='10%' >
			{sugar_translate label='LBL_WEBSITE' module='AOS_Quotes'}
		</td>
	<td  nowrap="nowrap" width='30%'>
			
	{if !empty($fields.website_advanced.value)}
	<input type='text' name='{$fields.website_advanced.name}' id='{$fields.website_advanced.name}' size='30' 
	   maxlength='255' value='{$fields.website_advanced.value}' title='' tabindex=''>
	{else}
	<input type='text' name='{$fields.website_advanced.name}' id='{$fields.website_advanced.name}' size='30' 
	   maxlength='255' 
	   {if $displayView=='advanced_search'||$displayView=='basic_search'}value=''{else}value='http://'{/if} title='' tabindex=''>
	{/if}

   	   	</td>
	
	{counter assign=index}
	{math equation="left % right"
   		  left=$index
          right=$templateMeta.maxColumns
          assign=modVal
    }
	{if ($index % $templateMeta.maxColumns == 1 && $index != 1)}
		</tr><tr>
	{/if}
	
	<td scope="row" nowrap="nowrap" width='10%' >
		
		{sugar_translate label='LBL_CITY' module='AOS_Quotes'}
    	</td>
	<td  nowrap="nowrap" width='30%'>
			
{if strlen($fields.address_city_advanced.value) <= 0}
{assign var="value" value=$fields.address_city_advanced.default_value }
{else}
{assign var="value" value=$fields.address_city_advanced.value }
{/if}  
<input type='text' name='{$fields.address_city_advanced.name}' 
    id='{$fields.address_city_advanced.name}' size='30' 
     
    value='{$value}' title='' tabindex='' > 
   	   	</td>
	
	{counter assign=index}
	{math equation="left % right"
   		  left=$index
          right=$templateMeta.maxColumns
          assign=modVal
    }
	{if ($index % $templateMeta.maxColumns == 1 && $index != 1)}
		</tr><tr>
	{/if}
	
	<td scope="row" nowrap="nowrap" width='10%' >
		
		{sugar_translate label='LBL_ANY_EMAIL' module='AOS_Quotes'}
    	</td>
	<td  nowrap="nowrap" width='30%'>
			
{if strlen($fields.email_advanced.value) <= 0}
{assign var="value" value=$fields.email_advanced.default_value }
{else}
{assign var="value" value=$fields.email_advanced.value }
{/if}  
<input type='text' name='{$fields.email_advanced.name}' 
    id='{$fields.email_advanced.name}' size='30' 
     
    value='{$value}' title='' tabindex='' > 
   	   	</td>
	
	{counter assign=index}
	{math equation="left % right"
   		  left=$index
          right=$templateMeta.maxColumns
          assign=modVal
    }
	{if ($index % $templateMeta.maxColumns == 1 && $index != 1)}
		</tr><tr>
	{/if}
	
	<td scope="row" nowrap="nowrap" width='10%' >
			{sugar_translate label='LBL_ANNUAL_REVENUE' module='AOS_Quotes'}
		</td>
	<td  nowrap="nowrap" width='30%'>
			
{if strlen($fields.annual_revenue_advanced.value) <= 0}
{assign var="value" value=$fields.annual_revenue_advanced.default_value }
{else}
{assign var="value" value=$fields.annual_revenue_advanced.value }
{/if}  
<input type='text' name='{$fields.annual_revenue_advanced.name}' 
    id='{$fields.annual_revenue_advanced.name}' size='30' 
    maxlength='100' 
    value='{$value}' title='' tabindex='' > 
   	   	</td>
	
	{counter assign=index}
	{math equation="left % right"
   		  left=$index
          right=$templateMeta.maxColumns
          assign=modVal
    }
	{if ($index % $templateMeta.maxColumns == 1 && $index != 1)}
		</tr><tr>
	{/if}
	
	<td scope="row" nowrap="nowrap" width='10%' >
		
		{sugar_translate label='LBL_STATE' module='AOS_Quotes'}
    	</td>
	<td  nowrap="nowrap" width='30%'>
			
{if strlen($fields.address_state_advanced.value) <= 0}
{assign var="value" value=$fields.address_state_advanced.default_value }
{else}
{assign var="value" value=$fields.address_state_advanced.value }
{/if}  
<input type='text' name='{$fields.address_state_advanced.name}' 
    id='{$fields.address_state_advanced.name}' size='30' 
     
    value='{$value}' title='' tabindex='' > 
   	   	</td>
	
	{counter assign=index}
	{math equation="left % right"
   		  left=$index
          right=$templateMeta.maxColumns
          assign=modVal
    }
	{if ($index % $templateMeta.maxColumns == 1 && $index != 1)}
		</tr><tr>
	{/if}
	
	<td scope="row" nowrap="nowrap" width='10%' >
			{sugar_translate label='LBL_EMPLOYEES' module='AOS_Quotes'}
		</td>
	<td  nowrap="nowrap" width='30%'>
			
{if strlen($fields.employees_advanced.value) <= 0}
{assign var="value" value=$fields.employees_advanced.default_value }
{else}
{assign var="value" value=$fields.employees_advanced.value }
{/if}  
<input type='text' name='{$fields.employees_advanced.name}' 
    id='{$fields.employees_advanced.name}' size='30' 
    maxlength='10' 
    value='{$value}' title='' tabindex='' > 
   	   	</td>
	
	{counter assign=index}
	{math equation="left % right"
   		  left=$index
          right=$templateMeta.maxColumns
          assign=modVal
    }
	{if ($index % $templateMeta.maxColumns == 1 && $index != 1)}
		</tr><tr>
	{/if}
	
	<td scope="row" nowrap="nowrap" width='10%' >
			{sugar_translate label='LBL_INDUSTRY' module='AOS_Quotes'}
		</td>
	<td  nowrap="nowrap" width='30%'>
			
{html_options name='industry_advanced[]' options=$fields.industry_advanced.options size="6" style="width: 150px" multiple="1" selected=$fields.industry_advanced.value}
   	   	</td>
	
	{counter assign=index}
	{math equation="left % right"
   		  left=$index
          right=$templateMeta.maxColumns
          assign=modVal
    }
	{if ($index % $templateMeta.maxColumns == 1 && $index != 1)}
		</tr><tr>
	{/if}
	
	<td scope="row" nowrap="nowrap" width='10%' >
		
		{sugar_translate label='LBL_POSTAL_CODE' module='AOS_Quotes'}
    	</td>
	<td  nowrap="nowrap" width='30%'>
			
{if strlen($fields.address_postalcode_advanced.value) <= 0}
{assign var="value" value=$fields.address_postalcode_advanced.default_value }
{else}
{assign var="value" value=$fields.address_postalcode_advanced.value }
{/if}  
<input type='text' name='{$fields.address_postalcode_advanced.name}' 
    id='{$fields.address_postalcode_advanced.name}' size='30' 
     
    value='{$value}' title='' tabindex='' > 
   	   	</td>
	
	{counter assign=index}
	{math equation="left % right"
   		  left=$index
          right=$templateMeta.maxColumns
          assign=modVal
    }
	{if ($index % $templateMeta.maxColumns == 1 && $index != 1)}
		</tr><tr>
	{/if}
	
	<td scope="row" nowrap="nowrap" width='10%' >
			{sugar_translate label='LBL_TICKER_SYMBOL' module='AOS_Quotes'}
		</td>
	<td  nowrap="nowrap" width='30%'>
			
{if strlen($fields.ticker_symbol_advanced.value) <= 0}
{assign var="value" value=$fields.ticker_symbol_advanced.default_value }
{else}
{assign var="value" value=$fields.ticker_symbol_advanced.value }
{/if}  
<input type='text' name='{$fields.ticker_symbol_advanced.name}' 
    id='{$fields.ticker_symbol_advanced.name}' size='30' 
    maxlength='10' 
    value='{$value}' title='' tabindex='' > 
   	   	</td>
	
	{counter assign=index}
	{math equation="left % right"
   		  left=$index
          right=$templateMeta.maxColumns
          assign=modVal
    }
	{if ($index % $templateMeta.maxColumns == 1 && $index != 1)}
		</tr><tr>
	{/if}
	
	<td scope="row" nowrap="nowrap" width='10%' >
			{sugar_translate label='LBL_TYPE' module='AOS_Quotes'}
		</td>
	<td  nowrap="nowrap" width='30%'>
			
{html_options name='aos_quotes_type_advanced[]' options=$fields.aos_quotes_type_advanced.options size="6" style="width: 150px" multiple="1" selected=$fields.aos_quotes_type_advanced.value}
   	   	</td>
	
	{counter assign=index}
	{math equation="left % right"
   		  left=$index
          right=$templateMeta.maxColumns
          assign=modVal
    }
	{if ($index % $templateMeta.maxColumns == 1 && $index != 1)}
		</tr><tr>
	{/if}
	
	<td scope="row" nowrap="nowrap" width='10%' >
		
		{sugar_translate label='LBL_COUNTRY' module='AOS_Quotes'}
    	</td>
	<td  nowrap="nowrap" width='30%'>
			
{if strlen($fields.address_country_advanced.value) <= 0}
{assign var="value" value=$fields.address_country_advanced.default_value }
{else}
{assign var="value" value=$fields.address_country_advanced.value }
{/if}  
<input type='text' name='{$fields.address_country_advanced.name}' 
    id='{$fields.address_country_advanced.name}' size='30' 
     
    value='{$value}' title='' tabindex='' > 
   	   	</td>
	
	{counter assign=index}
	{math equation="left % right"
   		  left=$index
          right=$templateMeta.maxColumns
          assign=modVal
    }
	{if ($index % $templateMeta.maxColumns == 1 && $index != 1)}
		</tr><tr>
	{/if}
	
	<td scope="row" nowrap="nowrap" width='10%' >
			{sugar_translate label='LBL_RATING' module='AOS_Quotes'}
		</td>
	<td  nowrap="nowrap" width='30%'>
			
{if strlen($fields.rating_advanced.value) <= 0}
{assign var="value" value=$fields.rating_advanced.default_value }
{else}
{assign var="value" value=$fields.rating_advanced.value }
{/if}  
<input type='text' name='{$fields.rating_advanced.name}' 
    id='{$fields.rating_advanced.name}' size='30' 
    maxlength='100' 
    value='{$value}' title='' tabindex='' > 
   	   	</td>
	
	{counter assign=index}
	{math equation="left % right"
   		  left=$index
          right=$templateMeta.maxColumns
          assign=modVal
    }
	{if ($index % $templateMeta.maxColumns == 1 && $index != 1)}
		</tr><tr>
	{/if}
	
	<td scope="row" nowrap="nowrap" width='10%' >
		
		{sugar_translate label='LBL_ASSIGNED_TO' module='AOS_Quotes'}
    	</td>
	<td  nowrap="nowrap" width='30%'>
			
{html_options name='assigned_user_id_advanced[]' options=$fields.assigned_user_id_advanced.options size="6" style="width: 150px" multiple="1" selected=$fields.assigned_user_id_advanced.value}
   	   	</td>
	
	{counter assign=index}
	{math equation="left % right"
   		  left=$index
          right=$templateMeta.maxColumns
          assign=modVal
    }
	{if ($index % $templateMeta.maxColumns == 1 && $index != 1)}
		</tr><tr>
	{/if}
	
	<td scope="row" nowrap="nowrap" width='10%' >
			{sugar_translate label='LBL_OWNERSHIP' module='AOS_Quotes'}
		</td>
	<td  nowrap="nowrap" width='30%'>
			
{if strlen($fields.ownership_advanced.value) <= 0}
{assign var="value" value=$fields.ownership_advanced.default_value }
{else}
{assign var="value" value=$fields.ownership_advanced.value }
{/if}  
<input type='text' name='{$fields.ownership_advanced.name}' 
    id='{$fields.ownership_advanced.name}' size='30' 
    maxlength='100' 
    value='{$value}' title='' tabindex='' > 
   	   	</td>
	</tr>
<tr>
	<td colspan='20'>
		&nbsp;
	</td>
</tr>	
{if $DISPLAY_SAVED_SEARCH}
<tr>
	<td colspan='2'>
		<a class='tabFormAdvLink' onhover href='javascript:toggleInlineSearch()'>
		<img src='{sugar_getimagepath file="advanced_search.gif"}' id='up_down_img' border=0>&nbsp;{$APP.LNK_SAVED_VIEWS}
		</a><br>
		<input type='hidden' id='showSSDIV' name='showSSDIV' value='{$SHOWSSDIV}'><p>
	</td>
	<td scope='row' width='10%' nowrap="nowrap">
		{sugar_translate label='LBL_SAVE_SEARCH_AS' module='SavedSearch'}:
	</td>
	<td width='30%' nowrap>
		<input type='text' name='saved_search_name'>
		<input type='hidden' name='search_module' value=''>
		<input type='hidden' name='saved_search_action' value=''>
		<input title='{$APP.LBL_SAVE_BUTTON_LABEL}' value='{$APP.LBL_SAVE_BUTTON_LABEL}' class='button' type='button' name='saved_search_submit' onclick='SUGAR.savedViews.setChooser(); return SUGAR.savedViews.saved_search_action("save");'>
	</td>
	<td scope='row' width='10%' nowrap="nowrap">
	    {sugar_translate label='LBL_MODIFY_CURRENT_SEARCH' module='SavedSearch'}:
	</td>
	<td width='30%' nowrap>
		<input class='button' onclick='SUGAR.savedViews.setChooser(); return SUGAR.savedViews.saved_search_action("update")' value='{$APP.LBL_UPDATE}' title='{$APP.LBL_UPDATE}' name='ss_update' id='ss_update' type='button' >
		<input class='button' onclick='return SUGAR.savedViews.saved_search_action("delete", "{sugar_translate label='LBL_DELETE_CONFIRM' module='SavedSearch'}")' value='{$APP.LBL_DELETE}' title='{$APP.LBL_DELETE}' name='ss_delete' id='ss_delete' type='button'>
		<br><span id='curr_search_name'></span>
	</td>
</tr>

<tr>
<td colspan='6'>
<div style='{$DISPLAYSS}' id='inlineSavedSearch' >
	{$SAVED_SEARCH}
</div>
</td>
</tr>

{/if}
{if $displayType != 'popupView'}
<tr>
	<td colspan='5'>
        <input tabindex='2' title='{$APP.LBL_SEARCH_BUTTON_TITLE}' accessKey='{$APP.LBL_SEARCH_BUTTON_KEY}' onclick='SUGAR.savedViews.setChooser()' class='button' type='submit' name='button' value='{$APP.LBL_SEARCH_BUTTON_LABEL}' id='search_form_submit'/>&nbsp;
        <input tabindex='2' title='{$APP.LBL_CLEAR_BUTTON_TITLE}' accessKey='{$APP.LBL_CLEAR_BUTTON_KEY}' onclick='SUGAR.searchForm.clear_form(this.form); document.getElementById("saved_search_select").options[0].selected=true; return false;' class='button' type='button' name='clear' id='search_form_clear' value='{$APP.LBL_CLEAR_BUTTON_LABEL}'/>
        {if $DOCUMENTS_MODULE}
        &nbsp;<input title="{$APP.LBL_BROWSE_DOCUMENTS_BUTTON_TITLE}" accessKey="{$APP.LBL_BROWSE_DOCUMENTS_BUTTON_KEY}" type="button" class="button" value="{$APP.LBL_BROWSE_DOCUMENTS_BUTTON_LABEL}" onclick='open_popup("Documents", 600, 400, "&caller=Documents", true, false, "");' />
        {/if}
        <a id="basic_search_link" onclick="SUGAR.searchForm.searchFormSelect('{$module}|basic_search','{$module}|advanced_search')" href="#">{$APP.LNK_BASIC_SEARCH}</a>
        <span class='white-space'>
            &nbsp;&nbsp;&nbsp;{if $SAVED_SEARCHES_OPTIONS}|&nbsp;&nbsp;&nbsp;<b>{$APP.LBL_SAVED_SEARCH_SHORTCUT}</b>&nbsp;
            {$SAVED_SEARCHES_OPTIONS} {/if}
            <span id='go_btn_span' style='display:none'><input tabindex='2' title='go_select' id='go_select'  onclick='SUGAR.searchForm.clear_form(this.form);' class='button' type='button' name='go_select' value=' {$APP.LBL_GO_BUTTON_LABEL} '/></span>	
        </span>
	</td>
	<td style="text-align: right">
	    {if $DISPLAY_SEARCH_HELP}
	    <img  border='0' src='{sugar_getimagepath file="help-dashlet.gif"}' onmouseover="return overlib(SUGAR.language.get('app_strings', 'LBL_SEARCH_HELP_TEXT'), STICKY, MOUSEOFF,1000,WIDTH, 700, LEFT,CAPTION,'<div style=\'float:left\'>'+SUGAR.language.get('app_strings', 'LBL_SEARCH_HELP_TITLE')+'</div>', CLOSETEXT, '<div style=\'float: right\'><img border=0 style=\'margin-left:2px; margin-right: 2px;\' src={sugar_getimagepath file='close.gif'}></div>',CLOSETITLE, SUGAR.language.get('app_strings', 'LBL_SEARCH_HELP_CLOSE_TOOLTIP'), CLOSECLICK,FGCLASS, 'olFgClass', CGCLASS, 'olCgClass', BGCLASS, 'olBgClass', TEXTFONTCLASS, 'olFontClass', CAPTIONFONTCLASS, 'olCapFontClass');" class="help-search">
	    {/if}
    </td>
</tr>
{/if}
</table>

<script>
{literal}
	if(typeof(loadSSL_Scripts)=='function'){
		loadSSL_Scripts();
	}
{/literal}	
</script>{literal}<script language="javascript">if(typeof sqs_objects == 'undefined'){var sqs_objects = new Array;}sqs_objects['popup_query_form_modified_by_name_advanced']={"form":"popup_query_form","method":"get_user_array","field_list":["user_name","id"],"populate_list":["modified_by_name_advanced","modified_user_id_advanced"],"required_list":["modified_user_id"],"conditions":[{"name":"user_name","op":"like_custom","end":"%","value":""}],"limit":"30","no_match_text":"No Match"};sqs_objects['popup_query_form_created_by_name_advanced']={"form":"popup_query_form","method":"get_user_array","field_list":["user_name","id"],"populate_list":["created_by_name_advanced","created_by_advanced"],"required_list":["created_by"],"conditions":[{"name":"user_name","op":"like_custom","end":"%","value":""}],"limit":"30","no_match_text":"No Match"};sqs_objects['popup_query_form_assigned_user_name_advanced']={"form":"popup_query_form","method":"get_user_array","field_list":["user_name","id"],"populate_list":["assigned_user_name_advanced","assigned_user_id_advanced"],"required_list":["assigned_user_id"],"conditions":[{"name":"user_name","op":"like_custom","end":"%","value":""}],"limit":"30","no_match_text":"No Match"};</script>{/literal}