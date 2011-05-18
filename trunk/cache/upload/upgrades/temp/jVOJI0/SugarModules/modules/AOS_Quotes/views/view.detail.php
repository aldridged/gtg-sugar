<?php
if(!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');

require_once('include/MVC/View/views/view.detail.php');

class AOS_QuotesViewDetail extends ViewDetail {
	var $currSymbol;
	function AOS_QuotesViewDetail(){
 		parent::ViewDetail();
 	}
	
	function display(){
		$this->populateCurrency();
		$this->populateQuoteTemplates();
		$this->populateLineItems();
		parent::display();
	}
	
	function populateCurrency(){
		require_once('modules/Currencies/Currency.php');
		$currency  = new Currency();
		if(isset($this->bean->currency_id) && !empty($this->bean->currency_id)){
			$currency->retrieve($focus->currency_id);
			if( $currency->deleted != 1){
				$this->currSymbol =  $currency->symbol;
			}else{
				$this->currSymbol = $currency->getDefaultCurrencySymbol();
			}
		}else{
			$this->currSymbol = $currency->getDefaultCurrencySymbol();
		}
		
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
		global $app_strings, $mod_strings;
		
  		$sql = "SELECT * FROM aos_products_quotes WHERE parent_type = 'AOS_Quotes' AND parent_id = '".$this->bean->id."' AND deleted = 0";
  		
		$result = $this->bean->db->query($sql);
		$html = "";
		$html .= "<table border='0' width='100%' cellpadding='0' cellspacing='0'>";
		$html .= "<tr>";
		$html .= "<td width='10%' class='tabDetailViewDL' style='text-align: left;'>&nbsp;</td>";
		$html .= "<td width='10%' class='tabDetailViewDL' style='text-align: left;'>".$mod_strings['LBL_PRODUCT_QUANITY']."</td>";
		$html .= "<td width='15%' class='tabDetailViewDL' style='text-align: left;'>".$mod_strings['LBL_PRODUCT_NAME']."</td>";
		$html .= "<td width='15%' class='tabDetailViewDL' style='text-align: left;'>".$mod_strings['LBL_LIST_PRICE']."</td>";
		$html .= "<td width='15%' class='tabDetailViewDL' style='text-align: left;'>".$mod_strings['LBL_UNIT_PRICE']."</td>";
		$html .= "<td width='15%' class='tabDetailViewDL' style='text-align: left;'>".$mod_strings['LBL_VAT']." %</td>";
		$html .= "<td width='15%' class='tabDetailViewDL' style='text-align: left;'>".$mod_strings['LBL_VAT_AMT']."</td>";
		$html .= "<td width='15%' class='tabDetailViewDL' style='text-align: left;'>".$mod_strings['LBL_TOTAL_PRICE']."</td>";
		$html .= "</tr>";
		$i = 1;
		while ($row = $this->bean->db->fetchByAssoc($result)) {
			$html .= "<tr>";
			$product_note = wordwrap($row['description'],40,"<br />\n");
			$html .= "<td class='tabDetailViewDF'>".$i++."</td>";
			$html .= "<td class='tabDetailViewDF'>".number_format($row['product_qty'])."</td>";
		  	$html .= "<td class='tabDetailViewDF'><a href='index.php?module=AOS_Products&action=DetailView&record=".$row['product_id']."' class='tabDetailViewDFLink'>".$row['name']."</a><br />".$product_note."</td>";
		  	$html .= "<td class='tabDetailViewDF'>".currency_format_number($row['product_list_price'])."</td>";
		  	$html .= "<td class='tabDetailViewDF'>".currency_format_number($row['product_unit_price'])."</td>";
		  	$html .= "<td class='tabDetailViewDF'>".$row['vat']."</td>";
		  	$html .= "<td class='tabDetailViewDF'>".currency_format_number($row['vat_amt'])."</td>";
		  	$html .= "<td class='tabDetailViewDF'>".currency_format_number($row['product_total_price'])."</td>";
		  	$html .= "</tr>";
		}
		$html .= "</table>";
		$this->ss->assign('LINE_ITEMS',$html);
	}
}
?>