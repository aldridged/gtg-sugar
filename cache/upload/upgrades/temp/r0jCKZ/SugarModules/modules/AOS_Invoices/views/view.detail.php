<?php
if(!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');

require_once('include/MVC/View/views/view.detail.php');

class AOS_InvoicesViewDetail extends ViewDetail {
	var $currSymbol;
	function AOS_InvoicesViewDetail(){
 		parent::ViewDetail();
 	}
	
	function display(){
		$this->populateQuoteTemplates();
		$this->displayPopupHtml();
		$this->populateCurrency();
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
		
		$sql = "SELECT id, name FROM aos_pdf_templates WHERE deleted='0' AND type='Invoices'";

		$res = $this->bean->db->query($sql);
		while($row = $this->bean->db->fetchByAssoc($res)){
			$app_list_strings['template_ddown_c_list'][$row['id']] = $row['name'];
		}
	}
	
	function populateLineItems(){
		global $app_strings, $mod_strings;
		
  		$sql = "SELECT * FROM aos_products_quotes WHERE parent_type = 'AOS_Invoices' AND parent_id = '".$this->bean->id."' AND deleted = 0";
  		
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
	
	function displayPopupHtml(){
		global $app_list_strings;
		$templates = explode('^,^',trim($this->bean->template_ddown_c));
		
		echo '	<div id="popupDiv_ara" style="display:none;position:absolute;opacity:1;z-index:9999;background:#FFFFFF;margin-left:25%;margin-top:10%;">
				<form id="popupForm" action="index.php?module=AOS_Invoices" method="post">
 				<table style="border: #000 solid 2px;padding-left:20px;padding-right:20px;padding-top:10px;padding-bottom:10px;" >
					<tr>
						<td>';
		if(trim($this->bean->template_ddown_c) != ''){
			echo 'Please Select a Template.';
			echo  '			</td>
					</tr>';
			foreach($templates as $template){
				$template = str_replace('^','',$template);
				$js = "document.getElementById('popupDivBack_ara').style.display='none';document.getElementById('popupDiv_ara').style.display='none';var form=document.getElementById('popupForm');if(form!=null){form.templateID.value='".$template."';form.submit();}else{alert('Error!');}";
				echo '<tr><td><a href="#" onclick="'.$js.'">'.$app_list_strings['template_ddown_c_list'][$template].'</a></td></tr>';
			}
		}else{
			echo 'Please Select a Template by editing the Invoice and selecting an Invoice template.<br>
					If you have not created an Invoice template, go to the PDF templates module and create one.
					<br>Click to continue.';
			echo  '	</td>
					</tr>';
		}
		
		echo '	</table>
				<input type="hidden" name="templateID" value="" />
				<input type="hidden" name="action" value="generatePdf" />
				<input type="hidden" name="record" value="'.$this->bean->id.'" />
				</form>
				</div>
				<div id="popupDivBack_ara" onclick="this.style.display=\'none\';document.getElementById(\'popupDiv_ara\').style.display=\'none\';" style="top:0px;left:0px;position:absolute;height:100%;width:100%;background:#000000;opacity:0.5;display:none;vertical-align:middle;text-align:center;z-index:9998;">
				</div>
				<script>
					function showPopup(action){
						var form=document.getElementById(\'popupForm\');
						var ppd=document.getElementById(\'popupDivBack_ara\');
						var ppd2=document.getElementById(\'popupDiv_ara\');
						if(form!=null && ppd!=null && ppd2!=null){
							ppd.style.display=\'block\';
							ppd2.style.display=\'block\';
							form.action.value=action;
						}else{
							alert(\'Error!\');
						}
					}
				</script>';
	}
}
?>