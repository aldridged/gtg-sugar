<?php

if(!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point'); 

if(ACLController::checkAccess('Project', 'import', true)) $module_menu[]=Array("index.php?module=Import&action=Step1&import_module=Project&return_module=Project&return_action=index", "Import","Import", 'Project');

?>
