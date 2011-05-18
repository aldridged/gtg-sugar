<?php
	if(!isset($_REQUEST['record']) || empty($_REQUEST['record']) || !isset($_REQUEST['templateID']) || empty($_REQUEST['templateID'])){
		die('Error retrieving record. This record may be deleted or you may not be authorized to view it.');
	}
	error_reporting(0);
	require_once('modules/AOS_Invoices/AOS_Invoices.php');
	require_once('modules/AOS_Quotes/PDF_Lib/html2pdf.class.php');
	require_once('modules/AOS_Quotes/TemplateParser.php');
	require_once('modules/AOS_PDF_Templates/AOS_PDF_Templates.php');
	
	$invoice = new AOS_Invoices();
	$invoice->retrieve($_REQUEST['record']);
	
	$lineItems = array();
	$sql = "SELECT id, product_id FROM aos_products_quotes WHERE parent_type = 'AOS_Invoices' AND parent_id = '".$this->bean->id."' AND deleted = 0";
	$res = $invoice->db->query($sql);
	while($row = $invoice->db->fetchByAssoc($res)){
		$lineItems[$row['id']] = $row['product_id'];
	}
	
	$tempalte = new AOS_PDF_Templates();
	$tempalte->retrieve($_REQUEST['templateID']);
	
	$object_arr = array();
	$object_arr['AOS_Invoices'] = $invoice->id;
	
	$search = array ('@<script[^>]*?>.*?</script>@si', // Strip out javascript
					'@<[\/\!]*?[^<>]*?>@si',          // Strip out HTML tags
					'@([\r\n])[\s]+@',                // Strip out white space
					'@&(quot|#34);@i',                // Replace HTML entities
					'@&(amp|#38);@i',
					'@&(lt|#60);@i',
					'@&(gt|#62);@i',
					'@&(nbsp|#160);@i',
					'@&(iexcl|#161);@i',
					'@&(cent|#162);@i',
					'@&(pound|#163);@i',
					'@&(copy|#169);@i',
					'@&#(\d+);@e',
					'@<address[^>]*?>@si'
	);

	$replace = array ('',
					 '',
					 '\1',
					 '"',
					 '&',
					 '<',
					 '>',
					 ' ',
					 chr(161),
					 chr(162),
					 chr(163),
					 chr(169),
					 'chr(\1)',
					 '<br>'
		);
	
	$text = preg_replace($search, $replace, $tempalte->description);
	$text = str_replace('aos_quotes', 'aos_invoices', $text);
	$text = str_replace("\$subtotal_amount","\$aos_invoices_subtotal_amount",$text);
	$text = str_replace("\$tax_amount","\$aos_invoices_tax_amount",$text);
	$text = str_replace("\$shipping_amount","\$aos_invoices_shipping_amount",$text);
	$text = str_replace("\$total_amount","\$aos_invoices_total_amount",$text);
				 
	//Converting Text
	$parts = explode('$aos_products_quotes_name',$text);
	$text = $parts[0];
	$parts = explode('$aos_products_quotes_product_total_price',$parts[1]);
	$linePart = '$aos_products_quotes_name' . $parts[0] . '$aos_products_quotes_product_total_price';
	
	//Converting Line Items
	$obb = array();
	$sep = '';
	$tdTemp = explode('<tr>',$text);
	foreach($lineItems as $id => $productId){
		$obb['AOS_Products_Quotes'] = $id;
		$obb['AOS_Products'] = $productId;
		$text .= $sep . TemplateParser::parse_template($linePart, $obb);
		$sep = '</td></tr><tr>' . $tdTemp[count($tdTemp)-1];
	}
	$text .= $parts[1];
	
	
	$converted = TemplateParser::parse_template($text, $object_arr);
	
	$printable = str_replace("\$","" ,$converted);
		
	$file_name = "Invoice_".str_replace(" ","_",$invoice->name).".pdf";
	
	ob_clean();
	try{
		$pdf=new HTML2PDF();
		$pdf->setDefaultFont('Arial');
		$pdf->writeHTML($printable, isset($_GET['vuehtml']));
		$pdf->Output($file_name, "D");
	}catch(HTML2PDF_exception $e){ 
		echo $e;
	}
?>