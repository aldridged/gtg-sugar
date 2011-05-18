<?php /* Smarty version 2.6.11, created on 2011-04-06 08:45:27
         compiled from modules/SugarFeed/Dashlets/SugarFeedDashlet/SugarFeedScript.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'sugar_getjspath', 'modules/SugarFeed/Dashlets/SugarFeedDashlet/SugarFeedScript.tpl', 78, false),)), $this); ?>


<?php echo '
<script type="text/javascript">
if(typeof SugarFeed == \'undefined\') { // since the dashlet can be included multiple times a page, don\'t redefine these functions
	SugarFeed = function() {
	    return {
	    	/**
	    	 * Called when the textarea is blurred
	    	 */
	        pushUserFeed: function(id) {
	        	ajaxStatus.showStatus(\'';  echo $this->_tpl_vars['saving'];  echo '\'); // show that AJAX call is happening
	        	// what data to post to the dashlet
    	    	
    	    	postData = \'to_pdf=1&module=Home&action=CallMethodDashlet&method=pushUserFeed&id=\' + id ;
				YAHOO.util.Connect.setForm(document.getElementById(\'form_\' + id));
				var cObj = YAHOO.util.Connect.asyncRequest(\'POST\',\'index.php\', 
								  {success: SugarFeed.saved, failure: SugarFeed.saved, argument: id}, postData);
	        },
		    /**
	    	 * handle the response of the saveText method
	    	 */
	        saved: function(data) {
	        	SUGAR.mySugar.retrieveDashlet(data.argument);
	           	ajaxStatus.flashStatus(\'';  echo $this->_tpl_vars['done'];  echo '\');
	        }, 
	        deleteFeed: function(record, id){
				postData = \'to_pdf=1&module=Home&action=CallMethodDashlet&method=deleteUserFeed&id=\' + id + \'&record=\' +  record;
				var cObj = YAHOO.util.Connect.asyncRequest(\'POST\',\'index.php\', 
								  {success: SugarFeed.saved, failure: SugarFeed.saved, argument: id}, postData);	        
	        }
	    };
	}();
}
</script>
'; ?>

<script type="text/javascript" src="<?php echo smarty_function_sugar_getjspath(array('file' => "include/javascript/popup_helper.js"), $this);?>
">
</script>