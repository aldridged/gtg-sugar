<?php /* Smarty version 2.6.11, created on 2011-05-12 13:10:52
         compiled from cache/modules/Import/Projectocsg_c.tpl */ ?>

<?php if (strlen ( $this->_tpl_vars['fields']['ocsg_c']['value'] ) <= 0):  $this->assign('value', $this->_tpl_vars['fields']['ocsg_c']['default_value']);  else:  $this->assign('value', $this->_tpl_vars['fields']['ocsg_c']['value']);  endif; ?>  
<input type='text' name='<?php echo $this->_tpl_vars['fields']['ocsg_c']['name']; ?>
' 
    id='<?php echo $this->_tpl_vars['fields']['ocsg_c']['name']; ?>
' size='30' 
    maxlength='255' 
    value='<?php echo $this->_tpl_vars['value']; ?>
' title='' tabindex='1' > 