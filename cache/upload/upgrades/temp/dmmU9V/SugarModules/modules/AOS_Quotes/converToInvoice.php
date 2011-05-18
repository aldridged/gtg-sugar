<?php
	require_once('modules/AOS_Quotes/AOS_Quotes.php');
	require_once('modules/AOS_Invoices/AOS_Invoices.php');
	require_once('modules/AOS_Products_Quotes/AOS_Products_Quotes.php');
	
	global $timedate;
	//Setting values in Quotes
	$quote = new AOS_Quotes();
	$quote->retrieve($_REQUEST['record']);
	$quote->invoice_status = 'Invoiced';
	$quote->save();
	
	//Setting Invoice Values
	$invoice = new AOS_Invoices();
	$rawRow = $quote->fetched_row;
	$rawRow['id'] = '';
	$rawRow['template_ddown_c'] = ' ';
	$rawRow['quote_number'] = $rawRow['number'];
	$rawRow['number'] = '';
	$rawRow['quote_date'] = $timedate->to_display_date_time($rawRow['date_entered'],true,false);
	$rawRow['invoice_date'] = $timedate->to_display_date_time(date('Y-m-d h:i:s'),true,false);
	$invoice->populateFromRow($rawRow);
	$invoice->save();
	
	//Setting invoice quote relationship
	require_once('modules/Relationships/Relationship.php');
	$key = Relationship::retrieve_by_modules('AOS_Quotes', 'AOS_Invoices', $GLOBALS['db']);
	if (!empty($key)) {
		$quote->load_relationship($key);
		$quote->$key->add($invoice->id);
	} 
	
	//Setting Line Items
	$sql = "SELECT * FROM aos_products_quotes WHERE parent_type = 'AOS_Quotes' AND parent_id = '".$quote->id."' AND deleted = 0";
  	$result = $this->bean->db->query($sql);
	while ($row = $this->bean->db->fetchByAssoc($result)) {
		$row['id'] = '';
		$row['parent_id'] = $invoice->id;
		$row['parent_type'] = 'AOS_Invoices';
		$prod_invoice = new AOS_Products_Quotes();
		$prod_invoice->populateFromRow($row);
		$prod_invoice->save();
	}
	ob_clean();
	header('Location: index.php?module=AOS_Invoices&action=DetailView&record='.$invoice->id);
?>