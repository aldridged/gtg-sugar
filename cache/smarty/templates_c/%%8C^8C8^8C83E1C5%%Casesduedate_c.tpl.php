<?php /* Smarty version 2.6.11, created on 2011-05-12 14:07:18
         compiled from cache/modules/Import/Casesduedate_c.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'sugar_getimagepath', 'cache/modules/Import/Casesduedate_c.tpl', 5, false),)), $this); ?>


<?php $this->assign('date_value', $this->_tpl_vars['fields']['duedate_c']['value']); ?>
<input autocomplete="off" type="text" name="<?php echo $this->_tpl_vars['fields']['duedate_c']['name']; ?>
" id="<?php echo $this->_tpl_vars['fields']['duedate_c']['name']; ?>
" value="<?php echo $this->_tpl_vars['date_value']; ?>
" title=''  tabindex='1' size="11" maxlength="10">
<img border="0" src="<?php echo smarty_function_sugar_getimagepath(array('file' => 'jscalendar.gif'), $this);?>
" alt="<?php echo $this->_tpl_vars['APP']['LBL_ENTER_DATE']; ?>
" id="<?php echo $this->_tpl_vars['fields']['duedate_c']['name']; ?>
_trigger" align="absmiddle" />
<script type="text/javascript">
Calendar.setup ({
inputField : "<?php echo $this->_tpl_vars['fields']['duedate_c']['name']; ?>
",
daFormat : "<?php echo $this->_tpl_vars['CALENDAR_FORMAT']; ?>
",
button : "<?php echo $this->_tpl_vars['fields']['duedate_c']['name']; ?>
_trigger",
singleClick : true,
dateStr : "<?php echo $this->_tpl_vars['date_value']; ?>
",
step : 1,
weekNumbers:false
}
);
</script>