<?php /* Smarty version 2.6.11, created on 2011-04-06 08:53:36
         compiled from include/SugarFields/Fields/Phone/ListView.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'sugar_fetch', 'include/SugarFields/Fields/Phone/ListView.tpl', 38, false),array('function', 'sugar_phone', 'include/SugarFields/Fields/Phone/ListView.tpl', 39, false),)), $this); ?>
<?php ob_start();  echo smarty_function_sugar_fetch(array('object' => $this->_tpl_vars['parentFieldArray'],'key' => $this->_tpl_vars['col']), $this); $this->_smarty_vars['capture']['getPhone'] = ob_get_contents();  $this->assign('phone', ob_get_contents());ob_end_clean();  echo smarty_function_sugar_phone(array('value' => $this->_tpl_vars['phone']), $this);?>