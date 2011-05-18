<?php /* Smarty version 2.6.11, created on 2011-05-12 17:06:36
         compiled from modules/ACLRoles/EditView.tpl */ ?>


<script>
<?php echo '
function set_focus(){
	document.getElementById(\'name\').focus();
}
'; ?>

</script>

<form method='POST' name='EditView' action='index.php'>
<TABLE width='100%' border='0' cellpadding=0 cellspacing = 0 class="actionsContainer">
<tbody>
<tr>
<td>
<input type='hidden' name='record' value='<?php echo $this->_tpl_vars['ROLE']['id']; ?>
'>
<input type='hidden' name='module' value='ACLRoles'>
<input type='hidden' name='action' value='Save'>
<input type='hidden' name='isduplicate' value='<?php echo $this->_tpl_vars['ISDUPLICATE']; ?>
'>
<input type='hidden' name='return_record' value='<?php echo $this->_tpl_vars['RETURN']['record']; ?>
'>
<input type='hidden' name='return_action' value='<?php echo $this->_tpl_vars['RETURN']['action']; ?>
'>
<input type='hidden' name='return_module' value='<?php echo $this->_tpl_vars['RETURN']['module']; ?>
'> &nbsp;
<input title="<?php echo $this->_tpl_vars['APP']['LBL_SAVE_BUTTON_TITLE']; ?>
" id='save_button' accessKey="<?php echo $this->_tpl_vars['APP']['LBL_SAVE_BUTTON_KEY']; ?>
" class="button primary" onclick="this.form.action.value='Save';return check_form('EditView');" type="submit" name="button" value="<?php echo $this->_tpl_vars['APP']['LBL_SAVE_BUTTON_LABEL']; ?>
" >
<input title="<?php echo $this->_tpl_vars['APP']['LBL_CANCEL_BUTTON_TITLE']; ?>
"   class='cancel_button' accessKey="<?php echo $this->_tpl_vars['APP']['LBL_CANCEL_BUTTON_KEY']; ?>
" type='submit' name='save' value="<?php echo $this->_tpl_vars['APP']['LBL_CANCEL_BUTTON_LABEL']; ?>
" class='button' onclick='document.EditView.action.value="<?php echo $this->_tpl_vars['RETURN']['action']; ?>
";document.EditView.module.value="<?php echo $this->_tpl_vars['RETURN']['module']; ?>
";document.EditView.record.value="<?php echo $this->_tpl_vars['RETURN']['record']; ?>
";document.EditView.submit();'>
</td>
</tr>
</tbody>
</table>
<TABLE width='100%' class="edit view"  border='0' cellpadding=0 cellspacing = 0  >
<TR>
<td scope="row" align='right'><?php echo $this->_tpl_vars['MOD']['LBL_NAME']; ?>
:<span class="required"><?php echo $this->_tpl_vars['APP']['LBL_REQUIRED_SYMBOL']; ?>
</span></td><td >
<input id='name' name='name' type='text' value='<?php echo $this->_tpl_vars['ROLE']['name']; ?>
'>
</td><td>&nbsp;</td><td>&nbsp;</td>
</tr>
<tr>
<td scope="row" align='right'><?php echo $this->_tpl_vars['MOD']['LBL_DESCRIPTION']; ?>
:</td>
<td ><textarea name='description' cols="80" rows="8"><?php echo $this->_tpl_vars['ROLE']['description']; ?>
</textarea></td>
</tr>
</table>

</form>
<script type="text/javascript">
addToValidate('EditView', 'name', 'varchar', true, '<?php echo $this->_tpl_vars['MOD']['LBL_NAME']; ?>
');
</script>