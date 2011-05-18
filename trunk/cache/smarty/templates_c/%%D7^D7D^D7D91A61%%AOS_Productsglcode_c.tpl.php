<?php /* Smarty version 2.6.11, created on 2011-05-12 14:48:40
         compiled from cache/modules/Import/AOS_Productsglcode_c.tpl */ ?>

<?php if (strlen ( $this->_tpl_vars['fields']['glcode_c']['value'] ) <= 0):  $this->assign('value', $this->_tpl_vars['fields']['glcode_c']['default_value']);  else:  $this->assign('value', $this->_tpl_vars['fields']['glcode_c']['value']);  endif; ?>  
<input type='text' name='<?php echo $this->_tpl_vars['fields']['glcode_c']['name']; ?>
' 
    id='<?php echo $this->_tpl_vars['fields']['glcode_c']['name']; ?>
' size='30' 
    maxlength='25' 
    value='<?php echo $this->_tpl_vars['value']; ?>
' title='GL Code' tabindex='1' > 