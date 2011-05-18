<?php
if(!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');

require_once('include/MVC/View/views/view.edit.php');

class AOS_PDF_TemplatesViewEdit extends ViewEdit {
	function AOS_PDF_TemplatesViewEdit(){
 		parent::ViewEdit();
 	}
	
	function display(){
		$this->displayJSInclude();
		$this->setDefaultValue();
		$this->setFields();
		parent::display();
		$this->displayJS();
	}
	
	function setDefaultValue(){
		if(trim($this->bean->description) == ''){
			$this->bean->description = '<p>&nbsp;</p>
						<p>&nbsp;</p>
						<p>
						<table border="2">
						<tbody>
						<tr>
						<td>Item</td>
						<td>Quantity</td>
						<td>List Price</td>
						<td>Selling Price</td>
						<td>Part Number</td>
						<td>Tax</td>
						<td>Product_Total</td>
						</tr>
						<tr>
						<td>$aos_products_quotes_name</td>
						<td>&nbsp;$aos_products_quotes_product_qty</td>
						<td>&nbsp;$aos_products_quotes_product_list_price</td>
						<td>&nbsp;$aos_products_quotes_product_unit_price</td>
						<td>&nbsp;$aos_products_part_number</td>
						<td>&nbsp;$aos_products_quotes_vat_amt</td>
						<td>&nbsp;$aos_products_quotes_product_total_price</td>
						</tr>
						<tr>
						<td colspan="5">&nbsp;</td>
						<td>&nbsp;Subtotal Amount</td>
						<td>&nbsp;$subtotal_amount</td>
						</tr>
						<tr>
						<td colspan="5">&nbsp;</td>
						<td>&nbsp;Total Tax</td>
						<td>&nbsp;$tax_amount</td>
						</tr>
						<tr>
						<td colspan="5">&nbsp;</td>
						<td>&nbsp;Shipping Amount</td>
						<td>&nbsp;$shipping_amount</td>
						</tr>
						<tr>
						<td colspan="5">&nbsp;</td>
						<td>&nbsp;Grand Total</td>
						<td>&nbsp;$total_amount</td>
						</tr>
						</tbody>
						</table>
						</p>
						<p>&nbsp;</p>
						<p>&nbsp;</p>
						<p>&nbsp;</p>';
		}
	}
	
	function displayJSInclude(){
		echo '
<script type="text/javascript" language="Javascript" src="include/JSON.js"></script>
<script type="text/javascript" language="Javascript" src="include/javascript/tiny_mce/tiny_mce.js"></script>
<link type="text/css" href="include/javascript/tiny_mce/advanced/css/editor_ui.css" />
<script type="text/javascript" language="Javascript">

function showVariable(fld){
	document.getElementById(\'variable_text\').value=fld;
}

function populateVariables(type){
	options = quoteOptions;
	if(type == \'Quotes\'){
		options = quoteOptions;
	}else if(type == \'Invoices\'){
		options = invoiceOptions;
	}else{
		options = quoteOptions;
	}
	for(i=0;i<document.getElementById(\'variable_name\').options.length;i++){
		document.getElementById(\'variable_name\').remove(0);
	} 
	document.getElementById(\'variable_name\').innerHTML = options;
}

function insert_variable(text) {
    var inst = tinyMCE.getInstanceById("description");
    if (inst) inst.getWin().focus();
    inst.execCommand(\'mceInsertRawHTML\', false, text);
}
</script>
			';
	}
	
	function setFields(){
		global $app_list_strings;
		//Setting type Field
		$this->ss->assign('CUSTOM_TYPE','<select id="type" name="type" onchange="populateVariables(this.options[this.selectedIndex].value)">'.
							get_select_options($app_list_strings[$this->bean->field_defs['type']['options']],$this->bean->type).
							'</select>');
		
		//Setting Insertable fields
		require_once('modules/AOS_Invoices/AOS_Invoices.php');
		require_once('modules/AOS_Quotes/AOS_Quotes.php');
		$quote_options_array = array(''=>'');
		$invoice_option_array = array(''=>'');
		
		//Getting Fields
		$quote = new AOS_Quotes();
		foreach($quote->field_defs as $name => $arr){
			if(!((isset($arr['dbType']) && strtolower($arr['dbType']) == 'id') || $arr['type'] == 'id' || $arr['type'] == 'link')){
				$quote_options_array['$aos_quotes_'.$name] = translate($arr['vname'],'AOS_Quotes');
			}
		}
		$invoice = new AOS_Invoices();
		foreach($invoice->field_defs as $name => $arr){
			if(!((isset($arr['dbType']) && strtolower($arr['dbType']) == 'id') || $arr['type'] == 'id' || $arr['type'] == 'link')){
				$invoice_option_array['$aos_invoices_'.$name] = translate($arr['vname'],'AOS_Invoices');
			}
		}
		
		$quote_options = get_select_options($quote_options_array,'');
		$invoice_options = get_select_options($invoice_option_array,'');
		
		if($this->bean->type == 'Quotes'){
			$options = $quote_options;
		}else if($this->bean->type == 'Invoices'){
			$options = $invoice_options;
		}else{
			$options = $quote_options;
		}
		
		$quote_options = ereg_replace( "\n", '', $quote_options);
		$invoice_options = ereg_replace( "\n", '', $invoice_options);
		
		$insert_fields = <<<HTML
		<select name='variable_name' id='variable_name' tabindex="50" onchange="showVariable(this.options[this.selectedIndex].value);">
			$options
		</select>
		<input type="text" size="30" tabindex="60" name="variable_text" id="variable_text" />
		<input type='button' tabindex="70" onclick='insert_variable(document.EditView.variable_text.value);' class='button' value='Insert'>
		<script type="text/javascript">
			var quoteOptions = "$quote_options";
			var invoiceOptions = "$invoice_options";
		</script>
HTML;
		$this->ss->assign('INSERT_FIELDS',$insert_fields);
	}
	
	function displayJS(){
		require_once("include/SugarTinyMCE.php");
		require_once("include/JSON.php");
		
		$tiny = new SugarTinyMCE();
        $tinyMCE = $tiny->getConfig();
		
		$locationHref = 'http://'.$_SERVER['HTTP_HOST'].substr($_SERVER['PHP_SELF'],0,strrpos($_SERVER['PHP_SELF'],'/'));
		$js =<<<JS
<script type="text/javascript">
	$tinyMCE
	var location_href = '{$locationHref}';
	if(typeof(tinyMCE) != 'undefined') {
		tinyMCE.baseURL = location_href+'/include/javascript/tiny_mce';
		tinyMCE.srcMode = '';
		if(navigator.appName != 'Netscape') {
			tinyMCE.init({
				theme_advanced_toolbar_align : tinyConfig.theme_advanced_toolbar_align,
				clean : false,
				clean_on_startup : false,
				width: tinyConfig.width,
				theme: tinyConfig.theme,
				theme_advanced_toolbar_location : tinyConfig.theme_advanced_toolbar_location,
				theme_advanced_buttons1: "code,help,separator,bold,italic,underline,strikethrough,separator,justifyleft,justifycenter,justifyright,justifyfull,separator,forecolor,backcolor,separator,styleselect,formatselect,fontselect,fontsizeselect",
				theme_advanced_buttons2: "cut,copy,paste,pastetext,pasteword,selectall,separator,search,replace,separator,bullist,numlist,separator,outdent,indent,separator,ltr,rtl,separator,undo,redo,separator, link,unlink,anchor,image,separator,sub,sup,separator,charmap,visualaid",
				theme_advanced_buttons3: "tablecontrols,separator,advhr,hr,removeformat,separator,insertdate,inserttime,separator,preview",
				strict_loading_mode: true,
				mode: "exact",
				language: "en",
				plugins : tinyConfig.plugins,
				elements : tinyConfig.elements,
				extended_valid_elements : tinyConfig.extended_valid_elements,
				mode: tinyConfig.mode
			});
		} else {
			tinyMCE.init({
				theme_advanced_toolbar_align : tinyConfig.theme_advanced_toolbar_align,
				width: tinyConfig.width,
				theme: tinyConfig.theme,
				theme_advanced_toolbar_location : tinyConfig.theme_advanced_toolbar_location,
				theme_advanced_buttons1: "code,help,separator,bold,italic,underline,strikethrough,separator,justifyleft,justifycenter,justifyright,justifyfull,separator,forecolor,backcolor,separator,styleselect,formatselect,fontselect,fontsizeselect",
				theme_advanced_buttons2: "cut,copy,paste,pastetext,pasteword,selectall,separator,search,replace,separator,bullist,numlist,separator,outdent,indent,separator,ltr,rtl,separator,undo,redo,separator, link,unlink,anchor,image,separator,sub,sup,separator,charmap,visualaid",
				theme_advanced_buttons3: "tablecontrols,separator,advhr,hr,removeformat,separator,insertdate,inserttime,separator,preview",
				strict_loading_mode: true,
				mode: "exact",
				language: "en",
				plugins : tinyConfig.plugins,
				elements : tinyConfig.elements,
				extended_valid_elements : tinyConfig.extended_valid_elements,
				mode: tinyConfig.mode,
				strict_loading_mode : true
			});
		}
	}
</script>
<script type="text/javascript" language="Javascript" src="include/javascript/tiny_mce/langs/en.js"></script>
<script type="text/javascript" language="Javascript" src="include/javascript/tiny_mce/plugins/insertdatetime/editor_plugin.js"></script>
<script type="text/javascript" language="Javascript" src="include/javascript/tiny_mce/plugins/preview/editor_plugin.js"></script>
<script type="text/javascript" language="Javascript" src="include/javascript/tiny_mce/plugins/searchreplace/editor_plugin.js"></script>


<script type="text/javascript" language="Javascript" src="include/javascript/tiny_mce/plugins/advhr/langs/en.js"></script>
<script type="text/javascript" language="Javascript" src="include/javascript/tiny_mce/plugins/paste/langs/en.js"></script>
<script language="javascript">
	if(typeof(tinyMCE) != 'undefined') {	
		 var t = tinyMCE.getInstanceById('description');
		 if(typeof(t) == 'undefined')  {
            
            var nav = new String(navigator.appVersion);

            tinyMCE.execCommand('mceAddControl', false, 'description');
            var instance =  tinyMCE.getInstanceById('description');
            var tableEl = document.getElementById(instance.editorId + '_parent').firstChild;
            var toolbar = document.getElementById(instance.editorId + '_toolbar');
            if (tinyMCE.isMSIE) {
                instance.iframeElement.style.height = "100%";
                instance.iframeElement.height = "100%";
            } else {
                instance.iframeElement.style.height = "100%";
            }
            tableEl.style.height = "100%";
        }
	}
	//alert(JSON);
</script>
JS;
		echo $js;
	}
}
?>