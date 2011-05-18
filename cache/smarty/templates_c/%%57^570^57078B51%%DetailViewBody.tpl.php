<?php /* Smarty version 2.6.11, created on 2011-05-12 16:32:54
         compiled from modules/ACLRoles/DetailViewBody.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'capitalize', 'modules/ACLRoles/DetailViewBody.tpl', 73, false),)), $this); ?>


<TABLE width='100%' class='detail view' border='0' cellpadding=0 cellspacing = 1  >
<TR>
<td style="background: transparent;"></td>
<?php $_from = $this->_tpl_vars['ACTION_NAMES']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['ACTION_NAME']):
?>
	<td style="text-align: center;" scope="row"><b><?php echo $this->_tpl_vars['ACTION_NAME']; ?>
</b></td>
<?php endforeach; else: ?>

          <td colspan="2">&nbsp;</td>

<?php endif; unset($_from); ?>
</TR>
<?php $_from = $this->_tpl_vars['CATEGORIES']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['CATEGORY_NAME'] => $this->_tpl_vars['TYPES']):
?>


    <?php if ($this->_tpl_vars['APP_LIST']['moduleList'][$this->_tpl_vars['CATEGORY_NAME']] != 'Users'): ?>


	<TR>
	<?php if ($this->_tpl_vars['APP_LIST']['moduleList'][$this->_tpl_vars['CATEGORY_NAME']] == 'Users'): ?>
	<td nowrap width='1%' scope="row"><b><?php echo $this->_tpl_vars['MOD']['LBL_USER_NAME_FOR_ROLE']; ?>
</b></td>
	<?php else: ?>
	<td nowrap width='1%' scope="row"><b><?php echo $this->_tpl_vars['APP_LIST']['moduleList'][$this->_tpl_vars['CATEGORY_NAME']]; ?>
</b></td>
	<?php endif; ?>
	<?php $_from = $this->_tpl_vars['ACTION_NAMES']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['ACTION_NAME'] => $this->_tpl_vars['ACTION_LABEL']):
?>
		<?php $this->assign('ACTION_FIND', 'false'); ?>
		<?php $_from = $this->_tpl_vars['TYPES']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['TYPE_NAME'] => $this->_tpl_vars['ACTIONS']):
?>
			<?php $_from = $this->_tpl_vars['ACTIONS']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['ACTION_NAME_ACTIVE'] => $this->_tpl_vars['ACTION']):
?>
				<?php if ($this->_tpl_vars['ACTION_NAME'] == $this->_tpl_vars['ACTION_NAME_ACTIVE']): ?>
					<?php $this->assign('ACTION_FIND', 'true'); ?>
					<td  width='<?php echo $this->_tpl_vars['TDWIDTH']; ?>
%' align='center'><div align='center' class="acl<?php echo ((is_array($_tmp=$this->_tpl_vars['ACTION']['accessLabel'])) ? $this->_run_mod_handler('capitalize', true, $_tmp) : smarty_modifier_capitalize($_tmp)); ?>
"><b><?php echo $this->_tpl_vars['ACTION']['accessName']; ?>
</b></div></td>
				<?php endif; ?>
			<?php endforeach; endif; unset($_from); ?>
		<?php endforeach; endif; unset($_from); ?>
		<?php if ($this->_tpl_vars['ACTION_FIND'] == 'false'): ?>
			<td nowrap width='<?php echo $this->_tpl_vars['TDWIDTH']; ?>
%' style="text-align: center;">
			<div><font color='red'>N/A</font></div>
			</td>
		<?php endif; ?>
	<?php endforeach; endif; unset($_from); ?>
	</TR>


    <?php endif; ?>


<?php endforeach; else: ?>
	<tr> <td colspan="2">No Actions</td></tr>
<?php endif; unset($_from); ?>
</TABLE>