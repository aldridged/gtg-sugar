<?php

//custom/modules/Cases/logic_hooks/CaseHooks.php

class casesHooks{
          function process_record_hook(&$bean, $event, $arguments){
          $bean->acct_mgr_c = '';
          $full_copy = new Account();
          $full_copy->retrieve($bean->account_id);
          $bean->acct_mgr_c = $full_copy->assigned_user_name;
        }
}
?>
