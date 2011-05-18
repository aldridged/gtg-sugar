<?php /* Smarty version 2.6.11, created on 2011-05-12 13:11:01
         compiled from cache/modules/Import/Projectpo_c.tpl */ ?>

<?php if (strlen ( $this->_tpl_vars['fields']['po_c']['value'] ) <= 0):  $this->assign('value', $this->_tpl_vars['fields']['po_c']['default_value']);  else:  $this->assign('value', $this->_tpl_vars['fields']['po_c']['value']);  endif; ?>  
<input type='text' name='<?php echo $this->_tpl_vars['fields']['po_c']['name']; ?>
' 
    id='<?php echo $this->_tpl_vars['fields']['po_c']['name']; ?>
' size='30' 
    maxlength='255' 
    value='<?php echo $this->_tpl_vars['value']; ?>
' title='' tabindex='1' > 