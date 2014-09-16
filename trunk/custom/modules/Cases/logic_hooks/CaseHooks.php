<?php

//custom/modules/Cases/logic_hooks/CaseHooks.php

class casesHooks{
          function process_record_hook(&$bean, $event, $arguments){
          $bean->acct_mgr_c = '';
          $full_copy = new aCase();
          $full_copy->retrieve($bean->id);
          $linked_accounts = $full_copy->get_linked_beans('accounts_cases','Account');
          foreach($linked_accounts as $acct) {
            $bean->acct_mgr_c = $acct->assigned_user_name;
            };
        };
}
?>
