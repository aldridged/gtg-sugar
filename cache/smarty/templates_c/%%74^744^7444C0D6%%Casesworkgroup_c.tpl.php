<?php /* Smarty version 2.6.11, created on 2011-05-12 14:10:42
         compiled from cache/modules/Import/Casesworkgroup_c.tpl */ ?>

<?php if (strlen ( $this->_tpl_vars['fields']['workgroup_c']['value'] ) <= 0):  $this->assign('value', $this->_tpl_vars['fields']['workgroup_c']['default_value']);  else:  $this->assign('value', $this->_tpl_vars['fields']['workgroup_c']['value']);  endif; ?>  
<input type='text' name='<?php echo $this->_tpl_vars['fields']['workgroup_c']['name']; ?>
' 
    id='<?php echo $this->_tpl_vars['fields']['workgroup_c']['name']; ?>
' size='30' 
    maxlength='255' 
    value='<?php echo $this->_tpl_vars['value']; ?>
' title='' tabindex='1' > 