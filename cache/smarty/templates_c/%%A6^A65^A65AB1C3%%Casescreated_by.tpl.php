<?php /* Smarty version 2.6.11, created on 2011-05-12 14:08:55
         compiled from cache/modules/Import/Casescreated_by.tpl */ ?>

<?php if (strlen ( $this->_tpl_vars['fields']['created_by']['value'] ) <= 0):  $this->assign('value', $this->_tpl_vars['fields']['created_by']['default_value']);  else:  $this->assign('value', $this->_tpl_vars['fields']['created_by']['value']);  endif; ?>  
<input type='text' name='<?php echo $this->_tpl_vars['fields']['created_by']['name']; ?>
' 
    id='<?php echo $this->_tpl_vars['fields']['created_by']['name']; ?>
' size='30' 
     
    value='<?php echo $this->_tpl_vars['value']; ?>
' title='' tabindex='1' > 