<?php /* Smarty version 2.6.11, created on 2011-04-06 10:40:04
         compiled from modules/Import/tpls/step3.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'sugar_getjspath', 'modules/Import/tpls/step3.tpl', 49, false),array('function', 'overlib_includes', 'modules/Import/tpls/step3.tpl', 50, false),array('function', 'sugar_help', 'modules/Import/tpls/step3.tpl', 83, false),)), $this); ?>
<?php echo '
<style>
<!--
textarea { width: 20em }
-->
</style>
'; ?>

<script type="text/javascript" src="<?php echo smarty_function_sugar_getjspath(array('file' => 'include/javascript/sugar_grp_yui_widgets.js'), $this);?>
"></script>
<?php echo smarty_function_overlib_includes(array(), $this);?>

<?php echo $this->_tpl_vars['MODULE_TITLE']; ?>

<form enctype="multipart/form-data" real_id="importstep3" id="importstep3" name="importstep3" method="POST" action="index.php">
<input type="hidden" name="module" value="Import">
<input type="hidden" name="custom_delimiter" value="<?php echo $this->_tpl_vars['CUSTOM_DELIMITER']; ?>
">
<input type="hidden" name="custom_enclosure" value="<?php echo $this->_tpl_vars['CUSTOM_ENCLOSURE']; ?>
">
<input type="hidden" name="import_type" value="<?php echo $this->_tpl_vars['TYPE']; ?>
">
<input type="hidden" name="source" value="<?php echo $this->_tpl_vars['SOURCE']; ?>
">
<input type="hidden" name="source_id" value="<?php echo $this->_tpl_vars['SOURCE_ID']; ?>
">
<input type="hidden" name="action" value="Step3">
<input type="hidden" name="import_module" value="<?php echo $this->_tpl_vars['IMPORT_MODULE']; ?>
">
<input type="hidden" name="to_pdf" value="1">
<input type="hidden" name="has_header" value="<?php echo $this->_tpl_vars['HAS_HEADER']; ?>
">
<input type="hidden" name="tmp_file" value="<?php echo $this->_tpl_vars['TMP_FILE']; ?>
">
<input type="hidden" name="tmp_file_base" value="<?php echo $this->_tpl_vars['TMP_FILE']; ?>
">
<input type="hidden" name="firstrow" value="<?php echo $this->_tpl_vars['FIRSTROW']; ?>
">
<input type="hidden" name="columncount" value ="<?php echo $this->_tpl_vars['COLUMNCOUNT']; ?>
">
<input type="hidden" name="display_tabs_def">

<div align="right">
    <span class="required" align="right"><?php echo $this->_tpl_vars['APP']['LBL_REQUIRED_SYMBOL']; ?>
</span> <?php echo $this->_tpl_vars['APP']['NTC_REQUIRED']; ?>

</div>

<p>
<?php echo $this->_tpl_vars['MOD']['LBL_SELECT_FIELDS_TO_MAP']; ?>

</p>
<br />
<table border="0" cellpadding="0" width="100%" id="importTable" class="detail view">
<?php $_from = $this->_tpl_vars['rows']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['rows'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['rows']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['key'] => $this->_tpl_vars['item']):
        $this->_foreach['rows']['iteration']++;
 if (($this->_foreach['rows']['iteration'] <= 1)): ?>
<tr>
    <td style="text-align: left;" scope="row">
        <b><?php echo $this->_tpl_vars['MOD']['LBL_DATABASE_FIELD']; ?>
</b>&nbsp;
        <?php echo smarty_function_sugar_help(array('text' => $this->_tpl_vars['MOD']['LBL_DATABASE_FIELD_HELP']), $this);?>

    </td>
    <?php if ($this->_tpl_vars['HAS_HEADER'] == 'on'): ?>
    <td style="text-align: left;" scope="row">
        <b><?php echo $this->_tpl_vars['MOD']['LBL_HEADER_ROW']; ?>
</b>&nbsp;
        <?php echo smarty_function_sugar_help(array('text' => $this->_tpl_vars['MOD']['LBL_HEADER_ROW_HELP']), $this);?>

    </td>
    <?php endif; ?>
    <td style="text-align: left;" scope="row">
        <b><?php echo $this->_tpl_vars['MOD']['LBL_DEFAULT_VALUE']; ?>
</b>&nbsp;
        <?php echo smarty_function_sugar_help(array('text' => $this->_tpl_vars['MOD']['LBL_DEFAULT_VALUE_HELP']), $this);?>

    </td>
    <td style="text-align: left;" scope="row">
        <b><?php echo $this->_tpl_vars['MOD']['LBL_ROW']; ?>
 1</b>&nbsp;
        <?php echo smarty_function_sugar_help(array('text' => $this->_tpl_vars['MOD']['LBL_ROW_HELP']), $this);?>

    </td>
    <?php if ($this->_tpl_vars['HAS_HEADER'] != 'on'): ?>
    <td style="text-align: left;"><b><?php echo $this->_tpl_vars['MOD']['LBL_ROW']; ?>
 2</b></td>
    <?php endif; ?>
</tr>
<?php endif; ?>
<tr>
    <td valign="top" align="left" id="row_<?php echo ($this->_foreach['rows']['iteration']-1); ?>
_col_0">
        <select class='fixedwidth' name="colnum_<?php echo ($this->_foreach['rows']['iteration']-1); ?>
">
            <option value="-1"><?php echo $this->_tpl_vars['MOD']['LBL_DONT_MAP']; ?>
</option>
            <?php echo $this->_tpl_vars['item']['field_choices']; ?>

        </select>
    </td>
    <?php if ($this->_tpl_vars['HAS_HEADER'] == 'on'): ?>
    <td id="row_<?php echo ($this->_foreach['rows']['iteration']-1); ?>
_header"><?php echo $this->_tpl_vars['item']['cell1']; ?>
</td>
    <?php endif; ?>
    <td id="defaultvaluepicker_<?php echo ($this->_foreach['rows']['iteration']-1); ?>
" nowrap="nowrap">
        <?php echo $this->_tpl_vars['item']['default_field']; ?>

    </td>
    <?php if ($this->_tpl_vars['item']['show_remove']): ?>
    <td colspan="2">
        <input title="<?php echo $this->_tpl_vars['MOD']['LBL_REMOVE_ROW']; ?>
" accessKey="" 
            id="deleterow_<?php echo ($this->_foreach['rows']['iteration']-1); ?>
" class="button" type="button" 
            value="  <?php echo $this->_tpl_vars['MOD']['LBL_REMOVE_ROW']; ?>
  ">
    </td>
    <?php else: ?>
    <?php if ($this->_tpl_vars['HAS_HEADER'] != 'on'): ?>
    <td id="row_<?php echo ($this->_foreach['rows']['iteration']-1); ?>
_col_1" scope="row"><?php echo $this->_tpl_vars['item']['cell1']; ?>
</td>
    <?php endif; ?>
    <td id="row_<?php echo ($this->_foreach['rows']['iteration']-1); ?>
_col_2" scope="row"><?php echo $this->_tpl_vars['item']['cell2']; ?>
</td>
    <?php endif; ?>
</tr>
<?php endforeach; endif; unset($_from); ?>
<tr>
    <td align="left" colspan="4" style="background: transparent;">
        <input title="<?php echo $this->_tpl_vars['MOD']['LBL_ADD_ROW']; ?>
" accessKey="" id="addrow" class="button" type="button" 
            name="button" value="  <?php echo $this->_tpl_vars['MOD']['LBL_ADD_ROW']; ?>
  ">
        <input title="<?php echo $this->_tpl_vars['MOD']['LBL_SHOW_ADVANCED_OPTIONS']; ?>
" accessKey="" id="toggleImportOptions" class="button" type="button" 
            name="button" value="  <?php echo $this->_tpl_vars['MOD']['LBL_SHOW_ADVANCED_OPTIONS']; ?>
  ">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <span scope="row"><strong><?php echo $this->_tpl_vars['MOD']['LBL_SAVE_MAPPING_AS']; ?>
</strong></span>
        <span >
            <input type="text" name="save_map_as" id="save_map_as" value="" 
                style="width: 20em" maxlength="254">
            &nbsp;<?php echo smarty_function_sugar_help(array('text' => $this->_tpl_vars['MOD']['LBL_SAVE_MAPPING_HELP']), $this);?>

        </span>
    </td>
</tr>
<tr style="display: none;" id="importOptions">
    <td valign="middle" colspan="4">
        <table border="0" width="100%">
        <tr>
            <td valign="top" width="50%">
                <div>
                    <h4><?php echo $this->_tpl_vars['MOD']['LBL_IMPORT_FILE_SETTINGS']; ?>
&nbsp;<?php echo smarty_function_sugar_help(array('text' => $this->_tpl_vars['MOD']['LBL_IMPORT_FILE_SETTINGS_HELP']), $this);?>
</h4>
                    <table border=0 class="edit view">
                    <tr>
                        <td scope="row"><slot><?php echo $this->_tpl_vars['MOD']['LBL_CHARSET']; ?>
</slot></td>
                        <td ><slot><select tabindex='4' name='importlocale_charset'><?php echo $this->_tpl_vars['CHARSETOPTIONS']; ?>
</select></slot></td>
                    </tr>
                    <tr>
                        <td scope="row"><slot><?php echo $this->_tpl_vars['MOD']['LBL_DATE_FORMAT']; ?>
</slot></td>
                        <td ><slot><select tabindex='4' name='importlocale_dateformat'><?php echo $this->_tpl_vars['DATEOPTIONS']; ?>
</select></slot></td>
                    </tr>
                    <tr>
                        <td scope="row"><slot><?php echo $this->_tpl_vars['MOD']['LBL_TIME_FORMAT']; ?>
</slot></td>
                        <td ><slot><select tabindex='4' name='importlocale_timeformat'><?php echo $this->_tpl_vars['TIMEOPTIONS']; ?>
</select></slot></td>
                    </tr>
                    <tr>
                        <td scope="row"><slot><?php echo $this->_tpl_vars['MOD']['LBL_TIMEZONE']; ?>
</slot></td>
                        <td ><slot><select tabindex='4' name='importlocale_timezone'><?php echo $this->_tpl_vars['TIMEZONEOPTIONS']; ?>
</select></slot></td>
                    </tr>
                    <tr>
                        <td scope="row"><slot><?php echo $this->_tpl_vars['MOD']['LBL_CURRENCY']; ?>
</slot></td>
                        <td ><slot>
                            <select tabindex='4' id='currency_select' name='importlocale_currency' onchange='setSymbolValue(this.selectedIndex);setSigDigits();'><?php echo $this->_tpl_vars['CURRENCY']; ?>
</select>
                            <input type="hidden" id="symbol" value="">
                        </slot></td>
                    </tr>
                    <tr>
                        <td scope="row"><slot>
                            <?php echo $this->_tpl_vars['MOD']['LBL_CURRENCY_SIG_DIGITS']; ?>
:
                        </slot></td>
                        <td ><slot>
                            <select id='sigDigits' onchange='setSigDigits(this.value);' name='importlocale_default_currency_significant_digits'><?php echo $this->_tpl_vars['sigDigits']; ?>
</select>
                        </slot></td>
                    </tr>
                    <tr>
                        <td scope="row"><slot>
                            <i><?php echo $this->_tpl_vars['MOD']['LBL_LOCALE_EXAMPLE_NAME_FORMAT']; ?>
</i>:
                        </slot></td>
                        <td ><slot>
                            <input type="text" disabled id="sigDigitsExample" name="sigDigitsExample">
                        </slot></td>
                    </tr>
                    <tr>
                        <td scope="row"><slot><?php echo $this->_tpl_vars['MOD']['LBL_NUMBER_GROUPING_SEP']; ?>
</slot></td>
                        <td ><slot>
                            <input tabindex='4' name='importlocale_num_grp_sep' id='default_number_grouping_seperator'
                                type='text' maxlength='1' size='1' value='<?php echo $this->_tpl_vars['NUM_GRP_SEP']; ?>
' 
                                onkeydown='setSigDigits();' onkeyup='setSigDigits();'>
                        </slot></td>
                    </tr>
                    <tr>
                        <td scope="row"><slot><?php echo $this->_tpl_vars['MOD']['LBL_DECIMAL_SEP']; ?>
</slot></td>
                        <td ><slot>
                            <input tabindex='4' name='importlocale_dec_sep' id='default_decimal_seperator' 
                                type='text' maxlength='1' size='1' value='<?php echo $this->_tpl_vars['DEC_SEP']; ?>
'
                                onkeydown='setSigDigits();' onkeyup='setSigDigits();'>
                        </slot></td>
                    </tr>
                    <tr>
                        <td scope="row" valign="top"><?php echo $this->_tpl_vars['MOD']['LBL_LOCALE_DEFAULT_NAME_FORMAT']; ?>
: </td>
                        <td  valign="top">
                            <input onkeyup="setPreview();" onkeydown="setPreview();" id="default_locale_name_format" type="text" tabindex='4' name="importlocale_default_locale_name_format" value="<?php echo $this->_tpl_vars['default_locale_name_format']; ?>
">
                           <br /><?php echo $this->_tpl_vars['MOD']['LBL_LOCALE_NAME_FORMAT_DESC']; ?>

                        </td>
                    </tr>
                    <tr>
                        <td scope="row" valign="top"><i><?php echo $this->_tpl_vars['MOD']['LBL_LOCALE_EXAMPLE_NAME_FORMAT']; ?>
:</i> </td>
                        <td  valign="top"><input tabindex='4' id="nameTarget" name="no_value" id=":q" value="" style="border: none;" disabled size="50"></td>		
                    </tr>
                    </table>
                </div>
            </td>
            <td valign="top" width="50%">
                <div>
                    <h4><?php echo $this->_tpl_vars['MOD']['LBL_VERIFY_DUPS']; ?>
&nbsp;<?php echo smarty_function_sugar_help(array('text' => $this->_tpl_vars['MOD']['LBL_VERIFY_DUPLCATES_HELP']), $this);?>
</h4>
                    <?php echo $this->_tpl_vars['TAB_CHOOSER']; ?>

                </div>
            </td>
        </tr>
        </table>
    </td>
</tr>
</table>
<?php echo $this->_tpl_vars['JAVASCRIPT_CHOOSER']; ?>


<?php if ($this->_tpl_vars['NOTETEXT'] != '' || $this->_tpl_vars['required_fields'] != ''): ?>
<p>
<b><?php echo $this->_tpl_vars['MOD']['LBL_NOTES']; ?>
</b>
<ul>
<li><?php echo $this->_tpl_vars['MOD']['LBL_REQUIRED_NOTE'];  echo $this->_tpl_vars['required_fields']; ?>
</li>
<?php echo $this->_tpl_vars['NOTETEXT']; ?>

</ul>
</p>
<?php endif; ?>

<br />
<table width="100%" cellpadding="2" cellspacing="0" border="0">
<tr>
    <td align="left">
        <input title="<?php echo $this->_tpl_vars['MOD']['LBL_BACK']; ?>
" accessKey="" id="goback" class="button" type="submit" name="button" value="  <?php echo $this->_tpl_vars['MOD']['LBL_BACK']; ?>
  ">&nbsp;
        <input title="<?php echo $this->_tpl_vars['MOD']['LBL_IMPORT_NOW']; ?>
" accessKey="" id="importnow" class="button" type="button" name="button" value="  <?php echo $this->_tpl_vars['MOD']['LBL_IMPORT_NOW']; ?>
  ">
    </td>
</tr>
</table>

</form>
<?php echo '
<script type="text/javascript">
<!--
/**
 * Singleton to handle processing the import
 */
ProcessImport = new function()
{
    /*
     * number of file to process processed
     */
    this.fileCount         = 0;
    
    /*
     * total files to processs
     */
    this.fileTotal         = ';  echo $this->_tpl_vars['FILECOUNT']-1;  echo ';
    
    /*
     * total records to process
     */
    this.recordCount       = ';  echo $this->_tpl_vars['RECORDCOUNT'];  echo ';
    
    /*
     * maximum number of records per file
     */
    this.recordThreshold   = ';  echo $this->_tpl_vars['RECORDTHRESHOLD'];  echo ';
    
    /*
     * submits the form
     */
    this.submit = function()
    {
        document.getElementById("importstep3").tmp_file.value = 
            document.getElementById("importstep3").tmp_file_base.value + \'-\' + this.fileCount;
        YAHOO.util.Connect.setForm(document.getElementById("importstep3"));
        YAHOO.util.Connect.asyncRequest(\'POST\', \'index.php\', 
            {
                success: function(o) {
                    if (o.responseText.replace(/^\\s+|\\s+$/g, \'\') != \'\') {
                        this.failure(o);
                    }
                    else {
                        var locationStr = "index.php?module=Import"
                            + "&action=Last" 
                            + "&type=';  echo $this->_tpl_vars['TYPE'];  echo '" 
                            + "&import_module=';  echo $this->_tpl_vars['IMPORT_MODULE'];  echo '";
                        if ( ProcessImport.fileCount >= ProcessImport.fileTotal ) {
                        	YAHOO.SUGAR.MessageBox.updateProgress(1,\'';  echo $this->_tpl_vars['MOD']['LBL_IMPORT_COMPLETE'];  echo '\');
                            document.location.href = locationStr;
                        }
                        else {
                            document.getElementById("importstep3").save_map_as.value = \'\';
                            ProcessImport.fileCount++;
                            ProcessImport.submit();
                        }
                    }
                },
                failure: function(o) {
                	YAHOO.SUGAR.MessageBox.minWidth = 500;
                	YAHOO.SUGAR.MessageBox.show({
                    	type:  "alert", 
                    	title: \'';  echo $this->_tpl_vars['MOD']['LBL_IMPORT_ERROR'];  echo '\', 
                    	msg:   o.responseText, 
                        fn: function() { window.location.reload(true); }
                    });
                }
            }
        );
        var move = 0;
        if ( this.fileTotal > 0 ) {
            move = this.fileCount/this.fileTotal;
        }
        YAHOO.SUGAR.MessageBox.updateProgress( move,
            "';  echo $this->_tpl_vars['MOD']['LBL_IMPORT_RECORDS'];  echo ' " + ((this.fileCount * this.recordThreshold) + 1)
                        + " ';  echo $this->_tpl_vars['MOD']['LBL_IMPORT_RECORDS_TO'];  echo ' " + Math.min(((this.fileCount+1) * this.recordThreshold),this.recordCount)
                        + " ';  echo $this->_tpl_vars['MOD']['LBL_IMPORT_RECORDS_OF'];  echo ' " + this.recordCount );
    }
    
    /*
     * begins the form submission process
     */
    this.begin = function() 
    {
        datestarted = \'';  echo $this->_tpl_vars['MOD']['LBL_IMPORT_STARTED'];  echo ' \' +
                YAHOO.util.Date.format(\'';  echo $this->_tpl_vars['datetimeformat'];  echo '\');
        YAHOO.SUGAR.MessageBox.show({
            title: \'';  echo $this->_tpl_vars['STEP4_TITLE'];  echo '\',
            msg: datestarted,
            width: 500,
            type: "progress",
            closable:false,
            animEl: \'importnow\'
        });
        this.submit();
    }
}
-->
</script>
'; ?>

<?php echo $this->_tpl_vars['JAVASCRIPT']; ?>

<?php echo '
<script type="text/javascript" language="Javascript">
enableQS(false);
';  echo $this->_tpl_vars['getNameJs'];  echo '
';  echo $this->_tpl_vars['getNumberJs'];  echo '
';  echo $this->_tpl_vars['currencySymbolJs'];  echo '
	setSymbolValue(document.getElementById(\'currency_select\').selectedIndex);
	setSigDigits();

';  echo $this->_tpl_vars['confirmReassignJs'];  echo '
</script>
'; ?>
