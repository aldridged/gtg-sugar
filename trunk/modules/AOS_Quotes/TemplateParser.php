<?php
class TemplateParser{
		function parse_template_bean($string, $bean_name, &$focus) {
			$repl_arr = array();
			
			foreach($focus->field_defs as $field_def) {
				if($field_def['type'] == 'enum' && isset($field_def['options'])) {
					$translated = translate($field_def['options'],$bean_name,$focus->$field_def['name']);

					if(isset($translated) && ! is_array($translated)) {
						$repl_arr[strtolower($focus->module_dir)."_".$field_def['name']] = $translated;
					} else { // unset enum field, make sure we have a match string to replace with ""
						$repl_arr[strtolower($focus->module_dir)."_".$field_def['name']] = '';
					}
				} else {
					$repl_arr[strtolower($focus->module_dir)."_".$field_def['name']] = $focus->$field_def['name'];
				}
			} // end foreach()
	
			krsort($repl_arr);
			reset($repl_arr);
	
			foreach ($repl_arr as $name=>$value) {
				if($value != '' && is_string($value)) {
					$string = str_replace("\$$name", $value, $string);
				} else {
					$string = str_replace("\$$name", ' ', $string);
				}
			}
	
			return $string;
		}
		function parse_template($string, &$bean_arr) {
			global $beanFiles, $beanList;
	
			foreach($bean_arr as $bean_name => $bean_id) {
				require_once($beanFiles[$beanList[$bean_name]]);
	
				$focus = new $beanList[$bean_name];
				$focus->retrieve($bean_id);
				
				$string = TemplateParser::parse_template_bean($string, $bean_name, $focus);
			}
			return $string;
		}
	}
?>