<?php
// Location /home/dcmaster/htdocs/custom/modules/Tasks/views/view.edit.php
require_once('include/MVC/View/views/view.edit.php');

class TasksViewEdit extends ViewEdit{

  function TasksViewEdit() {
    parent::SugarView();
  }

  function display(){
    $this->ev->process();
    echo "<!-- \n";
    var_dump($_REQUEST);
    echo "-->";
    if (empty($this->ev->focus->id) && ($_REQUEST['return_module'] == 'Cases')) {
	  $parent = new aCase();
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
	  if((isset($parent->contactname_c))&&($this->ev->fieldDefs['contactname_c']['value']=="")) { $this->ev->fieldDefs['contactname_c']['value'] = $parent->contactname_c; };
	  if((isset($parent->contactphone_c))&&($this->ev->fieldDefs['contactphone_c']['value']=="")) { $this->ev->fieldDefs['contactphone_c']['value'] = $parent->contactphone_c; };
    }
    echo $this->ev->display();
    }
}
?>

