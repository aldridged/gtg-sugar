<?php /* Smarty version 2.6.11, created on 2011-05-24 11:49:22
         compiled from modules/SugarFeed/Dashlets/SugarFeedDashlet/Options.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'html_options', 'modules/SugarFeed/Dashlets/SugarFeedDashlet/Options.tpl', 67, false),)), $this); ?>


<div style='width:100%'>
<form name='configure_<?php echo $this->_tpl_vars['id']; ?>
' action="index.php" method="post" onSubmit='return SUGAR.dashlets.postForm("configure_<?php echo $this->_tpl_vars['id']; ?>
", SUGAR.mySugar.uncoverPage);'>
<input type='hidden' name='id' value='<?php echo $this->_tpl_vars['id']; ?>
'>
<input type='hidden' name='module' value='Home'>
<input type='hidden' name='action' value='ConfigureDashlet'>
<input type='hidden' name='to_pdf' value='true'>
<input type='hidden' name='configure' value='true'>
<table width="100%" cellpadding="0" cellspacing="0" border="0" class="edit view" align="center">
<tr>
    <td valign='top' nowrap class='dataLabel'><?php echo $this->_tpl_vars['titleLBL']; ?>
</td>
    <td valign='top' class='dataField'>
    	<input class="text" name="title" size='20' maxlength='80' value='<?php echo $this->_tpl_vars['title']; ?>
'>
    </td>
</tr>
<tr>
    <td valign='top' nowrap class='dataLabel'><?php echo $this->_tpl_vars['rowsLBL']; ?>
</td>
    <td valign='top' class='dataField'>
    	<input class="text" name="rows" size='3' value='<?php echo $this->_tpl_vars['rows']; ?>
'>
    </td>
</tr>
<tr>
    <td valign='top' nowrap class='dataLabel'><?php echo $this->_tpl_vars['categoriesLBL']; ?>
</td>
    <td valign='top' class='dataField'>
    	<?php echo smarty_function_html_options(array('name' => 'categories[]','options' => $this->_tpl_vars['categories'],'selected' => $this->_tpl_vars['selectedCategories'],'multiple' => true,'size' => 6), $this);?>

    </td>
</tr>
<tr>
    <td align="right" colspan="2">
        <input type='submit' class='button' value='<?php echo $this->_tpl_vars['saveLBL']; ?>
'>
   	</td>
</tr>
</table>
</form>
</div>