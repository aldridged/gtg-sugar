<?php
/*********************************************************************************
 * SugarCRM is a customer relationship management program developed by
 * SugarCRM, Inc. Copyright (C) 2004-2011 SugarCRM Inc.
 * 
 * This program is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Affero General Public License version 3 as published by the
 * Free Software Foundation with the addition of the following permission added
 * to Section 15 as permitted in Section 7(a): FOR ANY PART OF THE COVERED WORK
 * IN WHICH THE COPYRIGHT IS OWNED BY SUGARCRM, SUGARCRM DISCLAIMS THE WARRANTY
 * OF NON INFRINGEMENT OF THIRD PARTY RIGHTS.
 * 
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
 * details.
 * 
 * You should have received a copy of the GNU Affero General Public License along with
 * this program; if not, see http://www.gnu.org/licenses or write to the Free
 * Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
 * 02110-1301 USA.
 * 
 * You can contact SugarCRM, Inc. headquarters at 10050 North Wolfe Road,
 * SW2-130, Cupertino, CA 95014, USA. or at email address contact@sugarcrm.com.
 * 
 * The interactive user interfaces in modified source and object code versions
 * of this program must display Appropriate Legal Notices, as required under
 * Section 5 of the GNU Affero General Public License version 3.
 * 
 * In accordance with Section 7(b) of the GNU Affero General Public License version 3,
 * these Appropriate Legal Notices must retain the display of the "Powered by
 * SugarCRM" logo. If the display of the logo is not reasonably feasible for
 * technical reasons, the Appropriate Legal Notices must display the words
 * "Powered by SugarCRM".
 ********************************************************************************/

/*
 * Created on Apr 13, 2007
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
require_once('include/EditView/EditView2.php');
 class ViewEdit extends SugarView{
 	var $ev;
 	var $type ='edit';
 	var $useForSubpanel = false;  //boolean variable to determine whether view can be used for subpanel creates
 	var $useModuleQuickCreateTemplate = false; //boolean variable to determine whether or not SubpanelQuickCreate has a separate display function
 	var $showTitle = true;

 	function ViewEdit(){
 		parent::SugarView();
 	}

 	function preDisplay(){
 		
 	    $metadataFile = $this->getMetaDataFile();
 		$this->ev = new EditView();
 		$this->ev->ss =& $this->ss;
 		$this->ev->setup($this->module, $this->bean, $metadataFile, 'include/EditView/EditView.tpl');

 	}

 	function display(){

		//Set Default Assigned User
		if (empty($this->bean->fetched_row['id']))
		{
     		$this->bean->assigned_user_name = 'Operations Group';
     		$this->bean->assigned_user_id = 'd2853b4a-80b4-7697-9a42-4e5698bb1544';
		}

		$this->ev->process();

		//echo "<!-- \n";
    		//var_dump($_REQUEST);
    		//echo "-->";

		if (empty($this->ev->focus->id) && ($_REQUEST['return_relationship'] == 'projects_cases')) {
	  		$parent = new Project();
      			$parent->retrieve($_REQUEST['return_id']);
	  		if((isset($parent->facility_c))&&($this->ev->fieldDefs['facility_c']['value']=="")) { $this->ev->fieldDefs['facility_c']['value'] = $parent->facility_c; };
	  		if((isset($parent->wellname_c))&&($this->ev->fieldDefs['wellname_c']['value']=="")) { $this->ev->fieldDefs['wellname_c']['value'] = $parent->wellname_c; };
	  		if((isset($parent->afe_c))&&($this->ev->fieldDefs['afe_c']['value']=="")) { $this->ev->fieldDefs['afe_c']['value'] = $parent->afe_c; };
	  		if((isset($parent->po_c))&&($this->ev->fieldDefs['po_c']['value']=="")) { $this->ev->fieldDefs['po_c']['value'] = $parent->po_c; };
	  		if((isset($parent->parish_c))&&($this->ev->fieldDefs['parish_c']['value']=="")) { $this->ev->fieldDefs['parish_c']['value'] = $parent->parish_c; };
	  		if((isset($parent->areablock_c))&&($this->ev->fieldDefs['areablock_c']['value']=="")) { $this->ev->fieldDefs['areablock_c']['value'] = $parent->areablock_c; };
      			if((isset($parent->specialbilling_c))&&($this->ev->fieldDefs['specialbilling_c']['value']=="")) { $this->ev->fieldDefs['specialbilling_c']['value'] = $parent->specialbilling_c; };
	  		if((isset($parent->lat_c))&&($this->ev->fieldDefs['lat_c']['value']=="")) { $this->ev->fieldDefs['lat_c']['value'] = $parent->lat_c; };
	  		if((isset($parent->longitude_c))&&($this->ev->fieldDefs['longitude_c']['value']=="")) { $this->ev->fieldDefs['longitude_c']['value'] = $parent->longitude_c; };
	  		if((isset($parent->drivingdirections_c))&&($this->ev->fieldDefs['drivingdirections_c']['value']=="")) { $this->ev->fieldDefs['drivingdirections_c']['value'] = $parent->drivingdirections_c; };
      			if((isset($parent->customer_c))&&($this->ev->fieldDefs['customer_c']['value']=="")) { $this->ev->fieldDefs['customer_c']['value'] = $parent->customer_c; };
    		};
		echo $this->ev->display($this->showTitle);
 	}


 }
?>
