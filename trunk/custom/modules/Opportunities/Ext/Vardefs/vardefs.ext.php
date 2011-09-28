<?php 
 //WARNING: The contents of this file are auto-generated


 // created: 2011-09-09 15:55:49
$dictionary['Opportunity']['fields']['sales_stage']['default']='S';
$dictionary['Opportunity']['fields']['sales_stage']['len']=100;

 

 // created: 2011-09-09 16:11:32

 

 // created: 2011-09-09 16:20:03

 

// created: 2010-12-20 02:55:45
$dictionary["Opportunity"]["fields"]["aos_quotes"] = array (
  'name' => 'aos_quotes',
    'type' => 'link',
    'relationship' => 'opportunity_aos_quotes',
    'module'=>'AOS_Quotes',
    'bean_name'=>'AOS_Quotes',
    'source'=>'non-db',
);


// created: 2010-12-20 02:56:01
$dictionary["Opportunity"]["relationships"]["opportunity_aos_quotes"] = array (
	'lhs_module'=> 'Opportunities', 
	'lhs_table'=> 'opportunities', 
	'lhs_key' => 'id',
	'rhs_module'=> 'AOS_Quotes', 
	'rhs_table'=> 'aos_quotes', 
	'rhs_key' => 'opportunity_id',
	'relationship_type'=>'one-to-many',
);

?>