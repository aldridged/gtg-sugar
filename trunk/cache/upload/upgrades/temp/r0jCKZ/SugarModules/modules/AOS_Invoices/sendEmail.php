<?php
	if(!isset($_REQUEST['record']) || empty($_REQUEST['record']) || !isset($_REQUEST['templateID']) || empty($_REQUEST['templateID'])){
		die('Error retrieving record. This record may be deleted or you may not be authorized to view it.');
	}
	
	require_once('modules/AOS_Invoices/AOS_Invoices.php');
	require_once('modules/AOS_Quotes/PDF_Lib/html2fpdf.php');
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
	
	$template = new AOS_PDF_Templates();
	$template->retrieve($_REQUEST['templateID']);
	
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
	
	$text = preg_replace($search, $replace, $template->description);
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
	foreach($lineItems as $id => $productId){
		$obb['AOS_Products_Quotes'] = $id;
		$obb['AOS_Products'] = $productId;
		$text .= $sep . TemplateParser::parse_template($linePart, $obb);
		$sep = '</td></tr><tr><td>';
	}
	$text .= $parts[1];
	
	
	$converted = TemplateParser::parse_template($text, $object_arr);
	
	$printable = str_replace("\$","" ,$converted);
	
	require_once('modules/Emails/Email.php');
	//First Create e-mail draft
	$email = new Email();
	// set the id for relationships
	$email->id = create_guid();
	$email->new_with_id = true;
	
	//subject
	$email->name = "Invoice For ".$invoice->name."";
	//body
	$email->description_html = $printable;
	//type is draft
	$email->type = "draft";
	$email->status = "draft";
	
	if(!empty($invoice->billing_contact_id) && $invoice->billing_contact_id!="") {
		require_once('modules/Contacts/Contact.php');
		$contact = new Contact;
		$contact->retrieve($invoice->billing_contact_id);
		
		if(!empty($contact->email1)){
			$email->to_addrs_emails = $contact->email1.";";
			$email->to_addrs = $invoice->billing_contact_name." <".$contact->email1.">";
		} 
	}
	
	//team id
	$email->team_id  = $current_user->default_team;
	//assigned_user_id
	$email->assigned_user_id = $current_user->id;
	//Save the email object
	global $timedate;
	$email->date_start = $timedate->to_display_date_time(gmdate($GLOBALS['timedate']->get_db_date_time_format()));
	$email->save(FALSE);
	$email_id = $email->id;	
	
	//redirect
	if($email_id=="") {
		echo "Unable to initiate Email Client";
		exit; 
	} else {
		header("Location: index.php?action=Compose&module=Emails&return_module=AOS_Invoices&return_action=DetailView&return_id=".$_REQUEST['record']."&recordId=".$email_id);
	}

?>