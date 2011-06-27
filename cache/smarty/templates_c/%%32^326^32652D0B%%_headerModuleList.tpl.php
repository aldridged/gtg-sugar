<?php /* Smarty version 2.6.11, created on 2011-06-27 16:28:40
         compiled from themes/Sugar5/tpls/_headerModuleList.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'sugar_link', 'themes/Sugar5/tpls/_headerModuleList.tpl', 44, false),)), $this); ?>
<div id="moduleList">
<ul>
    <li class="noBorder">&nbsp;</li>
    <?php $_from = $this->_tpl_vars['moduleTopMenu']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['moduleList'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['moduleList']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['name'] => $this->_tpl_vars['module']):
        $this->_foreach['moduleList']['iteration']++;
?>
    <?php if ($this->_tpl_vars['name'] == $this->_tpl_vars['MODULE_TAB']): ?>
    <li class="noBorder">
        <span class="currentTabLeft">&nbsp;</span><span class="currentTab"><?php echo smarty_function_sugar_link(array('id' => "moduleTab_".($this->_tpl_vars['name']),'module' => $this->_tpl_vars['name']), $this);?>
</span><span class="currentTabRight">&nbsp;</span>
    <?php else: ?>
    <li>
        <span class="notCurrentTabLeft">&nbsp;</span><span class="notCurrentTab"><?php echo smarty_function_sugar_link(array('id' => "moduleTab_".($this->_tpl_vars['name']),'module' => $this->_tpl_vars['name'],'data' => $this->_tpl_vars['module']), $this);?>
</span><span class="notCurrentTabRight">&nbsp;</span>
    <?php endif; ?>
    </li>
    <?php endforeach; endif; unset($_from); ?>
    <?php if (count ( $this->_tpl_vars['moduleExtraMenu'] ) > 0): ?>
    <li id="moduleTabExtraMenu">
        <a href="#">&gt;&gt;</a><br />
        <ul class="cssmenu">
            <?php $_from = $this->_tpl_vars['moduleExtraMenu']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['moduleList'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['moduleList']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['name'] => $this->_tpl_vars['module']):
        $this->_foreach['moduleList']['iteration']++;
?>
            <li><?php echo smarty_function_sugar_link(array('id' => "moduleTab_".($this->_tpl_vars['name']),'module' => $this->_tpl_vars['name'],'data' => $this->_tpl_vars['module']), $this);?>

            <?php endforeach; endif; unset($_from); ?>
        </ul>        
    </li>
    <?php endif; ?>
</ul>
</div>