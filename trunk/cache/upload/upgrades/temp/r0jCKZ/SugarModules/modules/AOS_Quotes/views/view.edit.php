<?php
if(!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');

require_once('include/MVC/View/views/view.edit.php');

class AOS_QuotesViewEdit extends ViewEdit {
	function AOS_QuotesViewEdit(){
 		parent::ViewEdit();
 	}
	
	function display(){
		$this->populateCurrency();
		$this->populateQuoteTemplates();
		$this->populateLineItems();
		$this->populateAccounts();
		parent::display();
		$this->displayJS();
	}
	
	function populateAccounts(){
		$billAcc = $this->bean->billing_account;
		$billId = $this->bean->billing_account_id;
		$shipAcc = $this->bean->shipping_account;
		$shipId = $this->bean->shipping_account_id;
		
		/*$bill = <<<HTML
			<div class="x-form-field-wrap x-trigger-wrap-focus" id="ext-gen30" style="width: 123px; display: inline;">
				<input type="text" autocomplete="off" title="" value="$billAcc" size="" id="billing_account" tabindex="2" class="sqsEnabled " name="billing_account">
				<img class="x-form-trigger x-form-arrow-trigger" src="themes/default/images/blank.gif" id="ext-gen31" style="display: none;">
			</div>
			<input type="hidden" value="$billId" id="billing_account_id" name="billing_account_id">
			<input type="button" onclick="open_popup('Accounts', 600, 400, '', true, false, {'call_back_function':'set_return','form_name':'EditView','field_to_name_array':{'id':'billing_account_id','name':'billing_account','billing_address_street':'billing_address_street','billing_address_city':'billing_address_city','billing_address_state':'billing_address_state','billing_address_postalcode':'billing_address_postalcode','billing_address_country':'billing_address_country'}}, 'single', true);" value="Select" class="button" accesskey="T" title="Select [Alt+T]" tabindex="2" name="btn_billing_account">
			<input type="button" value="Clear" onclick="this.form.billing_account.value = ''; this.form.billing_account_id.value = '';" class="button" accesskey="C" title="Clear [Alt+C]" tabindex="2" name="btn_clr_billing_account">
HTML;
		$ship = <<<HTML
			<div class="x-form-field-wrap x-trigger-wrap-focus" id="ext-gen56" style="width: 123px; display: inline;">
				<input type="text" autocomplete="off" title="" value="$shipAcc" size="" id="shipping_account" tabindex="2" class="sqsEnabled " name="shipping_account">
				<img class="x-form-trigger x-form-arrow-trigger" src="themes/default/images/blank.gif" id="ext-gen57" style="display: none;">
			</div>
			<input type="hidden" value="$shipId" id="shipping_account_id" name="shipping_account_id">
			<input type="button" onclick="open_popup('Accounts', 600, 400, '', true, false, {'call_back_function':'set_return','form_name':'EditView','field_to_name_array':{'id':'shipping_account_id','name':'shipping_account','shipping_address_street':'shipping_address_street','shipping_address_city':'shipping_address_city','shipping_address_state':'shipping_address_state','shipping_address_postalcode':'shipping_address_postalcode','shipping_address_country':'shipping_address_country'}}, 'single', true);" value="Select" class="button" accesskey="T" title="Select [Alt+T]" tabindex="2" name="btn_shipping_account">
			<input type="button" value="Clear" onclick="this.form.shipping_account.value = ''; this.form.shipping_account_id.value = '';" class="button" accesskey="C" title="Clear [Alt+C]" tabindex="2" name="btn_clr_shipping_account">
HTML;*/
		$bill = <<<HTML
			<div class="x-form-field-wrap x-trigger-wrap-focus" id="ext-gen30" style="width: 123px; display: inline;">
				<input type="text" autocomplete="off" title="" value="$billAcc" size="" id="billing_account" tabindex="2" class="sqsEnabled " name="billing_account">
				<img class="x-form-trigger x-form-arrow-trigger" src="themes/default/images/blank.gif" id="ext-gen31" style="display: none;">
			</div>
			<input type="hidden" value="$billId" id="billing_account_id" name="billing_account_id">
			<input type="button" onclick="open_popup('Accounts', 600, 400, '', true, false, {'call_back_function':'set_return','form_name':'EditView','field_to_name_array':{'id':'billing_account_id','name':'billing_account','billing_address_street':'billing_address_street','billing_address_city':'billing_address_city','billing_address_state':'billing_address_state','billing_address_postalcode':'billing_address_postalcode','billing_address_country':'billing_address_country','shipping_address_street':'shipping_address_street','shipping_address_city':'shipping_address_city','shipping_address_state':'shipping_address_state','shipping_address_postalcode':'shipping_address_postalcode','shipping_address_country':'shipping_address_country'}}, 'single', true);" value="Select" class="button" accesskey="T" title="Select [Alt+T]" tabindex="2" name="btn_billing_account">
			<input type="button" value="Clear" onclick="this.form.billing_account.value = ''; this.form.billing_account_id.value = '';" class="button" accesskey="C" title="Clear [Alt+C]" tabindex="2" name="btn_clr_billing_account">
HTML;
		$this->ss->assign('BillingAccount',$bill);
		$this->ss->assign('ShippingAccount',$ship);
	}
	
	function populateCurrency(){
		global $mod_strings;
		require_once('modules/Currencies/Currency.php');
		$currency  = new Currency();
		$currText = '';
		if(isset($this->bean->currency_id) && !empty($this->bean->currency_id)){
			$currency->retrieve($focus->currency_id);
			if( $currency->deleted != 1){
				$currText =  $currency->iso4217 .' '.$currency->symbol;
			}else{
				$currText = $currency->getDefaultISO4217() .' '.$currency->getDefaultCurrencySymbol();
			}
		}else{
			$currText = $currency->getDefaultISO4217() .' '.$currency->getDefaultCurrencySymbol();
		}
		
		$this->ss->assign('CURRENCY', $currText);
		$mod_strings['LBL_LIST_PRICE'] .= " (".$currText.")";
		$mod_strings['LBL_UNIT_PRICE'] .= " (".$currText.")";
		$mod_strings['LBL_VAT_AMT'] .= " (".$currText.")";
		$mod_strings['LBL_TOTAL_PRICE'] .= " (".$currText.")";
	}
	
	function populateQuoteTemplates(){
		global $app_list_strings, $current_user;
		
		$sql = "SELECT id, name FROM aos_pdf_templates WHERE deleted='0' AND type='Quotes'";
		
		$res = $this->bean->db->query($sql);
		while($row = $this->bean->db->fetchByAssoc($res)){
			$app_list_strings['template_ddown_c_list'][$row['id']] = $row['name'];
		}
	}
	
	function populateLineItems(){
		global $app_list_strings, $app_strings, $mod_strings;
		
		$vat_value=$app_list_strings['vat_list'];
		$vat_value2=array_keys($vat_value);
  		
  		$sql = "SELECT * FROM aos_products_quotes WHERE parent_type = 'AOS_Quotes' AND parent_id = '".$this->bean->id."' AND deleted = 0";
  		$result = $this->bean->db->query($sql);
		$countLine = $this->bean->db->getRowCount($result);
		
		$html = "";
		$html .= "<table border='0' width='100%' id='productLine'>";
		$html .= "<tr>";
		$html .= "<td width='15%' class='dataLabel' style='text-align: left;'>".$mod_strings['LBL_PRODUCT_QUANITY']."</td>";
		$html .= "<td width='15%' class='dataLabel' style='text-align: left;'>".$mod_strings['LBL_PRODUCT_NAME']."</td>";
		$html .= "<td width='15%' class='dataLabel' style='text-align: left;'>".$mod_strings['LBL_LIST_PRICE']."</td>";
		$html .= "<td width='15%' class='dataLabel' style='text-align: left;'>".$mod_strings['LBL_UNIT_PRICE']."</td>";
		$html .= "<td width='15%' class='dataLabel' style='text-align: left;'>".$mod_strings['LBL_VAT_AMT']."</td>";
		$html .= "<td width='15%' class='dataLabel' style='text-align: left;'>".$mod_strings['LBL_TOTAL_PRICE']."</td>";
		$html .= "<td width='10%' class='dataLabel' style='text-align: left;'>&nbsp;</td>";
		$html .= "</tr>";
		
		$i = 0;
		while ($row = $this->bean->db->fetchByAssoc($result)) {
			$row['id'] = (isset($_REQUEST['Duplicate']) && trim($_REQUEST['Duplicate']) == 'Duplicate')?"":$row['id'];
			
			$html .= "<tr id='product_line$i'>";
			
			$html .= "<td class='dataField'><input tabindex='3' type='text' name='qty_product_qty[]' id='qty_product_qty$i' size='20' maxlength='6' value='".$row['product_qty']."' title='' onblur='Quantity_formatNumber($i);calculateProductLine($i);'><input tabindex='3' type='hidden' name='product_qty[]' id='product_qty$i' size='20' maxlength='6' value='".$row['product_qty']."'></td>";
		  	$html .= "<td class='dataField'><input tabindex='3' type='text' name='product_name[]' id='product_name$i' size='15' maxlength='50' value='".$row['name']."' title=''><input type='hidden' name='product_id[]' id='product_id$i' value='".$row['product_id']."'>&nbsp;<input title='".$app_strings['LBL_SELECT_BUTTON_TITLE']."' accessKey='".$app_strings['LBL_SELECT_BUTTON_KEY']."' type='button' tabindex='3' class='button' value='".$app_strings['LBL_SELECT_BUTTON_LABEL']."' name='btn1' onclick='openProductPopup($i)'></td>";

		  	$html .= "<td class='dataField'><input tabindex='3' type='text' name='product_list_price[]' id='product_list_price$i' size='20' maxlength='50' value='".format_number($row['product_list_price'])."' title='' readonly='readonly'><input type='hidden' name='product_cost_price[]' id='product_cost_price$i' value='".format_number($row['product_cost_price'])."' /></td>";
		  	$html .= "<td class='dataField'><input tabindex='3' type='text' name='product_unit_price[]' id='product_unit_price$i' size='20' maxlength='50' value='".format_number($row['product_unit_price'])."' title='' onfocus='copyListPrice($i);' onblur='calculateProductLine($i);'></td>";
			$html .= "<td class='dataField'><input tabindex='3' type='text' name='vat_amt[]' id='vat_amt$i' size='20' maxlength='50' value='".format_number($row['vat_amt'])."' readonly title=''></td>";
		  	
		  	$html .= "<td class='dataField'><input tabindex='3' type='text' name='product_total_price[]' id='product_total_price$i' size='20' maxlength='50' value='".format_number($row['product_total_price'])."' title='' readonly='readonly'></td>";
		  	
		  	$html .= "<td class='dataField'><input type='hidden' name='deleted[]' id='deleted$i' value='0'><input type='hidden' name='product_quote_id[]' value='".$row['id']."'><input type='button' class='button' value='".$mod_strings['LBL_REMOVE_PRODUCT_LINE']."' tabindex='3' onclick='markProductLineDeleted($i)'></td>";
		  	
		  	$html .= "</tr>";
                        
            $html .= "<tr><td height='10px'></td></tr><tr id='product_note_line$i'>";
			$html .= "<td class='dataField'></td>";
			$html .= "<td class='dataField'><textarea tabindex='3' name='product_note[]' id='product_note$i' rows='1' cols='25'>".$row['description']."</textarea></td>";
			$html .= "<td class='dataField'>&nbsp;&nbsp;Vat&nbsp;&nbsp;%&nbsp;&nbsp; :&nbsp;&nbsp;<select name='vat[]' id='vat$i' onchange='calculateProductLine($i)'>";
			for($j=0;$j < count($vat_value2); $j++)
			{
			if($row['vat']==$vat_value2[$j])
			$html .= "<option value='".$vat_value2[$j]."' selected>".$vat_value2[$j]."</option>";
			else
			$html .= "<option value='".$vat_value2[$j]."'>".$vat_value2[$j]."</option>";
			}
			
			
			$html .= "</select></td>";
			$html .= "<td class='dataField' colspan='3'></td>";
			$html .= "</tr>";
		  	
		  	$i++;
		}
		
		$html .= "</table>";
		$html .= "<div style='padding-top: 10px; padding-bottom:10px;'>";
		$html .= "<input type=\"button\" class=\"button\" value=\"".$mod_strings['LBL_ADD_PRODUCT_LINE']."\" id=\"addProductLine\" onclick=\"insertProductLine(".$countLine.")\" />";
		$html .= "</div>";
		
		$sep = get_number_seperators();
		$html .= '<input type="hidden" name="vathidden" id="vathidden" value="'.get_select_options_with_id($vat_value, '').'">
				  <input type="hidden" id="grp_seperator" name="grp_seperator" value="'.$sep[0].'" />
				  <input type="hidden" id="dec_seperator" name="dec_seperator" value="'.$sep[1].'" />
				  <input type="hidden" id="currency_symbol" name="currency_symbol" value="{CURRENCY_SYMBOL}" />';
		
		$this->ss->assign('LINE_ITEMS',$html);
	}
	
	function displayJS(){
		global $app_strings, $mod_strings;
		echo "
			<script type=\"text/javascript\">
				var selectButtonTitle = '". $app_strings['LBL_SELECT_BUTTON_TITLE'] . "';
				var selectButtonKey	  = '". $app_strings['LBL_SELECT_BUTTON_KEY'] . "';
				var selectButtonValue = '". $app_strings['LBL_SELECT_BUTTON_LABEL'] . "';
				var deleteButtonValue = '". $mod_strings['LBL_REMOVE_PRODUCT_LINE'] . "';";
		/*$js=<<<JS
			if(typeof sqs_objects == 'undefined'){var sqs_objects = new Array;}
			sqs_objects['billing_account']={"method":"query","modules":["Accounts"],"group":"or","field_list":["name","id","billing_address_street","billing_address_city","billing_address_state","billing_address_postalcode","billing_address_country"],"populate_list":["billing_account","billing_account_id","billing_address_street","billing_address_city","billing_address_state","billing_address_postalcode","billing_address_country"],"conditions":[{"name":"name","op":"like_custom","end":"%","value":""}],"required_list":["billing_account_id"],"order":"name","limit":"30","no_match_text":"No Match"};
			sqs_objects['shipping_account']={"method":"query","modules":["Accounts"],"group":"or","field_list":["name","id","shipping_address_street","shipping_address_city","shipping_address_state","shipping_address_postalcode","shipping_address_country"],"populate_list":["shipping_account","shipping_account_id","shipping_address_street","shipping_address_city","shipping_address_state","shipping_address_postalcode","shipping_address_country"],"conditions":[{"name":"name","op":"like_custom","end":"%","value":""}],"required_list":["shipping_account_id"],"order":"name","limit":"30","no_match_text":"No Match"};
JS;*/
		$js=<<<JS
			if(typeof sqs_objects == 'undefined'){var sqs_objects = new Array;}
			sqs_objects['billing_account']={"method":"query","modules":["Accounts"],"group":"or","field_list":["name","id","billing_address_street","billing_address_city","billing_address_state","billing_address_postalcode","billing_address_country","shipping_address_street","shipping_address_city","shipping_address_state","shipping_address_postalcode","shipping_address_country"],"populate_list":["billing_account","billing_account_id","billing_address_street","billing_address_city","billing_address_state","billing_address_postalcode","billing_address_country","shipping_address_street","shipping_address_city","shipping_address_state","shipping_address_postalcode","shipping_address_country"],"conditions":[{"name":"name","op":"like_custom","end":"%","value":""}],"required_list":["billing_account_id"],"order":"name","limit":"30","no_match_text":"No Match"};
JS;
		echo $js;				
		echo "</script>
			";
	}
}
?>