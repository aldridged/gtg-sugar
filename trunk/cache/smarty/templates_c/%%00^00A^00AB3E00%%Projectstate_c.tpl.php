<?php /* Smarty version 2.6.11, created on 2011-05-12 13:09:47
         compiled from cache/modules/Import/Projectstate_c.tpl */ ?>

<?php if (strlen ( $this->_tpl_vars['fields']['state_c']['value'] ) <= 0):  $this->assign('value', $this->_tpl_vars['fields']['state_c']['default_value']);  else:  $this->assign('value', $this->_tpl_vars['fields']['state_c']['value']);  endif; ?>  
<input type='text' name='<?php echo $this->_tpl_vars['fields']['state_c']['name']; ?>
' 
    id='<?php echo $this->_tpl_vars['fields']['state_c']['name']; ?>
' size='30' 
    maxlength='255' 
    value='<?php echo $this->_tpl_vars['value']; ?>
' title='' tabindex='1' > 