<?php /* Smarty version 2.6.11, created on 2011-05-12 17:06:54
         compiled from modules/ACLRoles/DetailView.tpl */ ?>


<form action="index.php" method="post" name="DetailView" id="form">

			<input type="hidden" name="module" value="ACLRoles">
			<input type="hidden" name="user_id" value="">
			<input type="hidden" name="record" value="<?php echo $this->_tpl_vars['ROLE']['id']; ?>
">
			<input type="hidden" name="isDuplicate" value=''>
			<input type='hidden' name='return_record' value='<?php echo $this->_tpl_vars['RETURN']['record']; ?>
'>
			<input type='hidden' name='return_action' value='<?php echo $this->_tpl_vars['RETURN']['action']; ?>
'>
			<input type='hidden' name='return_module' value='<?php echo $this->_tpl_vars['RETURN']['module']; ?>
'>
			<input type="hidden" name="action">

			
		<input title="<?php echo $this->_tpl_vars['APP']['LBL_EDIT_BUTTON_TITLE']; ?>
" accessKey="<?php echo $this->_tpl_vars['APP']['LBL_EDIT_BUTTON_KEY']; ?>
" class="button primary" onclick="this.form.action.value='EditView'" type="submit" name="button" value="  <?php echo $this->_tpl_vars['APP']['LBL_EDIT_BUTTON']; ?>
 "> <input title="<?php echo $this->_tpl_vars['APP']['LBL_DUPLICATE_BUTTON_TITLE']; ?>
" accessKey="<?php echo $this->_tpl_vars['APP']['LBL_DUPLICATE_BUTTON_KEY']; ?>
" class="button" onclick="this.form.isDuplicate.value='1'; this.form.action.value='EditView'" type="submit" name="button" value=" <?php echo $this->_tpl_vars['APP']['LBL_DUPLICATE_BUTTON']; ?>
 "> <input title="<?php echo $this->_tpl_vars['APP']['LBL_DELETE_BUTTON_TITLE']; ?>
" accessKey="<?php echo $this->_tpl_vars['APP']['LBL_DELETE_BUTTON_KEY']; ?>
" class="button" onclick="this.form.return_module.value='ACLRoles'; this.form.return_action.value='index'; this.form.action.value='Delete'; return confirm('<?php echo $this->_tpl_vars['APP']['NTC_DELETE_CONFIRMATION']; ?>
')" type="submit" name="button" value=" <?php echo $this->_tpl_vars['APP']['LBL_DELETE_BUTTON']; ?>
 ">
		</form>
		</p>
		<p>
		<TABLE width='100%' class='detail view' border='0' cellpadding=0 cellspacing = 1  >
		<TR>
<td valign='top' width='15%' align='right'><b><?php echo $this->_tpl_vars['MOD']['LBL_NAME']; ?>
:</b></td><td width='85%' colspan='3'><?php echo $this->_tpl_vars['ROLE']['name']; ?>
</td>
</tr
><TR>
<td valign='top'  width='15%' align='right'><b><?php echo $this->_tpl_vars['MOD']['LBL_DESCRIPTION']; ?>
:</b></td><td colspan='3' valign='top'  width='85%' align='left'><?php echo $this->_tpl_vars['ROLE']['description']; ?>
</td>
</tr></table>
</p>
		<p>
		
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "modules/ACLRoles/EditViewBody.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>