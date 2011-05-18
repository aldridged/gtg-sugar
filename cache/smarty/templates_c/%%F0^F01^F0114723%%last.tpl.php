<?php /* Smarty version 2.6.11, created on 2011-05-12 13:13:18
         compiled from modules/Import/tpls/last.tpl */ ?>
<?php echo $this->_tpl_vars['MODULE_TITLE']; ?>

<span>
<?php echo $this->_tpl_vars['MOD']['LBL_SUCCESS']; ?>
<BR>
<?php if ($this->_tpl_vars['createdCount'] > 0): ?>
<b><?php echo $this->_tpl_vars['createdCount']; ?>
</b>&nbsp;<?php echo $this->_tpl_vars['MOD']['LBL_SUCCESSFULLY_IMPORTED']; ?>
<br />
<?php endif;  if ($this->_tpl_vars['updatedCount'] > 0): ?>
<b><?php echo $this->_tpl_vars['updatedCount']; ?>
</b>&nbsp;<?php echo $this->_tpl_vars['MOD']['LBL_UPDATE_SUCCESSFULLY']; ?>
<br />
<?php endif;  if ($this->_tpl_vars['errorCount'] > 0): ?>
<b><?php echo $this->_tpl_vars['errorCount']; ?>
</b>&nbsp;<?php echo $this->_tpl_vars['MOD']['LBL_RECORDS_SKIPPED_DUE_TO_ERROR']; ?>
<br />
<a href="<?php echo $this->_tpl_vars['errorFile']; ?>
" target='_blank'><?php echo $this->_tpl_vars['MOD']['LNK_ERROR_LIST']; ?>
</a><br />
<a href ="<?php echo $this->_tpl_vars['errorrecordsFile']; ?>
" target='_blank'><?php echo $this->_tpl_vars['MOD']['LNK_RECORDS_SKIPPED_DUE_TO_ERROR']; ?>
</a><br />
<?php endif;  if ($this->_tpl_vars['dupeCount'] > 0): ?>
<b><?php echo $this->_tpl_vars['dupeCount']; ?>
</b>&nbsp;<?php echo $this->_tpl_vars['MOD']['LBL_DUPLICATES']; ?>
<br />
<a href ="<?php echo $this->_tpl_vars['dupeFile']; ?>
" target='_blank'><?php echo $this->_tpl_vars['MOD']['LNK_DUPLICATE_LIST']; ?>
</a><br />
<?php endif; ?>

<form name="importlast" id="importlast" method="POST" action="index.php">
<input type="hidden" name="module" value="Import">
<input type="hidden" name="action" value="Undo">
<input type="hidden" name="import_module" value="<?php echo $this->_tpl_vars['IMPORT_MODULE']; ?>
">

<br />
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
    <td align="left" style="padding-bottom: 2px;">
        <input title="<?php echo $this->_tpl_vars['MOD']['LBL_UNDO_LAST_IMPORT']; ?>
" accessKey="" class="button" 
            type="submit" name="undo" id="undo" value="  <?php echo $this->_tpl_vars['MOD']['LBL_UNDO_LAST_IMPORT']; ?>
  ">
        <input title="<?php echo $this->_tpl_vars['MOD']['LBL_IMPORT_MORE']; ?>
" accessKey="" class="button" type="submit"
            name="importmore" id="importmore" value="  <?php echo $this->_tpl_vars['MOD']['LBL_IMPORT_MORE']; ?>
  ">
        <input title="<?php echo $this->_tpl_vars['MOD']['LBL_FINISHED'];  echo $this->_tpl_vars['MODULENAME']; ?>
" accessKey="" class="button" type="submit" 
            name="finished" id="finished" value="  <?php echo $this->_tpl_vars['MOD']['LBL_IMPORT_COMPLETE']; ?>
  ">
        <?php echo $this->_tpl_vars['PROSPECTLISTBUTTON']; ?>

    </td>
</tr>
</table>
</form>
<?php if ($this->_tpl_vars['PROSPECTLISTBUTTON'] != ''): ?>
<form name="DetailView">
    <input type="hidden" name="module" value="Prospects">
    <input type="hidden" name="record" value="id">
</form>
<?php endif;  echo $this->_tpl_vars['JAVASCRIPT']; ?>
