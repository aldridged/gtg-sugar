<?php
if(!defined('sugarEntry') || !sugarEntry)
	die('Not A Valid Entry Point');
/*********************************************************************************
 * SugarCRM is a customer relationship management program developed by
 * SugarCRM, Inc. Copyright (C) 2004-2011 SugarCRM Inc.
 * 
 * This program is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Affero General Public License version 3 as published by the
 * Free Software Foundation with the addition of the following permission added
 * to Section 15 as permitted in Section 7(a): FOR ANY PART OF THE COVERED WORK
 * IN WHICH THE COPYRIGHT IS OWNED BY SUGARCRM, SUGARCRM DISCLAIMS THE WARRANTY
 * OF NON INFRINGEMENT OF THIRD PARTY RIGHTS.
 * 
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
 * details.
 * 
 * You should have received a copy of the GNU Affero General Public License along with
 * this program; if not, see http://www.gnu.org/licenses or write to the Free
 * Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
 * 02110-1301 USA.
 * 
 * You can contact SugarCRM, Inc. headquarters at 10050 North Wolfe Road,
 * SW2-130, Cupertino, CA 95014, USA. or at email address contact@sugarcrm.com.
 * 
 * The interactive user interfaces in modified source and object code versions
 * of this program must display Appropriate Legal Notices, as required under
 * Section 5 of the GNU Affero General Public License version 3.
 * 
 * In accordance with Section 7(b) of the GNU Affero General Public License version 3,
 * these Appropriate Legal Notices must retain the display of the "Powered by
 * SugarCRM" logo. If the display of the logo is not reasonably feasible for
 * technical reasons, the Appropriate Legal Notices must display the words
 * "Powered by SugarCRM".
 ********************************************************************************/

require_once ('modules/DynamicFields/DynamicField.php');
require_once ('modules/DynamicFields/FieldCases.php');
global $db;

if (!isset ($db)) {
	$db = DBManagerFactory:: getInstance();
}
global $dbManager;
if (!isset ($dbManager)) {
	$dbManager = DBManagerFactory::getInstance();
}

$result = $db->query('SELECT * FROM fields_meta_data WHERE deleted = 0 ORDER BY custom_module');
$modules = array ();
/*
 * get the real field_meta_data
 */
while ($row = $db->fetchByAssoc($result)) {
	$the_modules = $row['custom_module'];
	if (!isset ($modules[$the_modules])) {
		$modules[$the_modules] = array ();
	}
	$modules[$the_modules][$row['name']] = $row['name'];
}

$simulate = false;
if (!isset ($_REQUEST['run'])) {
	$simulate = true;
	echo "SIMULATION MODE - NO CHANGES WILL BE MADE EXCEPT CLEARING CACHE";
}

foreach ($modules as $the_module => $fields) {
	$class_name = $beanList[$the_module];
	echo "<br><br>Scanning $the_module <br>";

	require_once ($beanFiles[$class_name]);
	$mod = new $class_name ();
	if (!$db->tableExists($mod->table_name."_cstm")) {
		$mod->custom_fields = new DynamicField();
		$mod->custom_fields->setup($mod);
		$mod->custom_fields->createCustomTable();
	}

	if ($db->dbType == 'oci8') {
	} elseif ($db->dbType == 'mssql') {
        $def_query="SELECT col.name as field, col_type.name as type, col.is_nullable, col.precision as data_precision, col.max_length as data_length, col.scale data_scale";
        $def_query.=" FROM sys.columns col";
        $def_query.=" join sys.types col_type on col.user_type_id=col_type.user_type_id ";
        $def_query.=" where col.object_id = (select object_id(sys.schemas.name + '.' + sys.tables.name)"; 
        $def_query.=" from sys.tables  join sys.schemas on sys.schemas.schema_id = sys.tables.schema_id";
        $def_query.=" where sys.tables.name='".$mod->table_name."_cstm')";        
        $result = $db->query($def_query);    
	}
	else {
		$result = $db->query("DESCRIBE $mod->table_name"."_cstm");
	}
    
	while ($row = $db->fetchByAssoc($result)) {
		$col = strtolower(empty ($row['Field']) ? $row['field'] : $row['Field']);
		$the_field = $mod->custom_fields->getField($col);
		$type = strtolower(empty ($row['Type']) ? $row['type'] : $row['Type']);
		if ($db->dbType == 'oci8' or $db->dbType == 'mssql') {
			if ($row['data_precision']!= '' and $row['data_scale']!='') {
				$type.='(' . $row['data_precision'];
				if (!empty($row['data_scale'])) {
					$type.=',' . $row['data_scale'];				
				}		
				$type.=')';
			}	 else {
				if ($row['data_length']!= '' && (strtolower($row['type'])=='varchar' or strtolower($row['type'])=='varchar2')) {
					$type.='(' . $row['data_length'] . ')';
			
				} 
			}	
		}	
		if (!isset ($fields[$col]) && $col != 'id_c') {
			if (!$simulate) {
				$db->query("ALTER TABLE $mod->table_name"."_cstm DROP COLUMN $col");
			}
			unset ($fields[$col]);
			echo "Dropping Column $col from $mod->table_name"."_cstm for module $the_module<br>";
		} else {
			if ($col != 'id_c') {
				//$db_data_type = $dbManager->helper->getColumnType(strtolower($the_field->data_type));
				$db_data_type = strtolower(str_replace(' ' , '', $the_field->get_db_type()));
				
				$type = strtolower(str_replace(' ' , '', $type));
				if (strcmp($db_data_type,$type) != 0) {

					echo "Fixing Column Type for $col changing $type to ".$db_data_type."<br>";
					if (!$simulate) {
						$db->query($the_field->get_db_modify_alter_table($mod->table_name.'_cstm'));
                    }
				}
			}

			unset ($fields[$col]);
		}

	}

	echo sizeof($fields)." field(s) missing from $mod->table_name"."_cstm<br>";
	foreach ($fields as $field) {
		echo "Adding Column $field to $mod->table_name"."_cstm<br>";
		if (!$simulate)
			$mod->custom_fields->add_existing_custom_field($field);
	}

}

DynamicField :: deleteCache();
echo '<br>Done<br>';
if ($simulate) {
	echo '<a href="index.php?module=Administration&action=UpgradeFields&run=true">Execute non-simulation mode</a>';
}
?>