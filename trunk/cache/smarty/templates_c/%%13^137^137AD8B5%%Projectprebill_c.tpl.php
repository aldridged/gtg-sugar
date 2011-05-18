<?php /* Smarty version 2.6.11, created on 2011-05-12 13:12:45
         compiled from cache/modules/Import/Projectprebill_c.tpl */ ?>

<?php if (strval ( $this->_tpl_vars['fields']['prebill_c']['value'] ) == '1' || strval ( $this->_tpl_vars['fields']['prebill_c']['value'] ) == 'yes' || strval ( $this->_tpl_vars['fields']['prebill_c']['value'] ) == 'on'): ?> 
<?php $this->assign('checked', 'CHECKED');  else:  $this->assign('checked', "");  endif; ?>
<input type="hidden" name="<?php echo $this->_tpl_vars['fields']['prebill_c']['name']; ?>
" value="0"> 
<input type="checkbox" id="<?php echo $this->_tpl_vars['fields']['prebill_c']['name']; ?>
" 
name="<?php echo $this->_tpl_vars['fields']['prebill_c']['name']; ?>
" 
value="1" title='' tabindex="1" <?php echo $this->_tpl_vars['checked']; ?>
 >