<?php
require_once('include/MVC/View/views/view.edit.php');

class ProjectViewEdit extends ViewEdit{

  function ProjectViewEdit() {
    parent::SugarView();
  }

  function display(){
    $this->ev->process();
    //echo "<!-- \n";
    //var_dump($_REQUEST);
    //echo "-->";
    if (empty($this->ev->focus->id) && ($_REQUEST['relate_to'] == 'projects_accounts')) {
	  $parent = new Account();
      $parent->retrieve($_REQUEST['relate_id']);
      if((isset($parent->specialbilling_c))&&($this->ev->fieldDefs['specialbilling_c']['value']=="")) { $this->ev->fieldDefs['specialbilling_c']['value'] = $parent->specialbilling_c; };
      if((isset($parent->name))&&($this->ev->fieldDefs['customer_c']['value']=="")) { $this->ev->fieldDefs['customer_c']['value'] = $parent->name; };
    }
    echo $this->ev->display();
    }
}
?>
