<?php /* Smarty version 2.6.11, created on 2011-05-12 14:07:18
         compiled from cache/modules/Import/Casesdescription.tpl */ ?>

<?php if (empty ( $this->_tpl_vars['fields']['description']['value'] )):  $this->assign('value', $this->_tpl_vars['fields']['description']['default_value']);  else:  $this->assign('value', $this->_tpl_vars['fields']['description']['value']);  endif; ?>  




<textarea  id='<?php echo $this->_tpl_vars['fields']['description']['name']; ?>
' name='<?php echo $this->_tpl_vars['fields']['description']['name']; ?>
'
rows="6" 
cols="80" 
title='' tabindex="1" ><?php echo $this->_tpl_vars['value']; ?>
</textarea>

