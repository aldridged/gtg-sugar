<?php
/**
 * Products, Quotations & Invoices modules.
 * Extensions to SugarCRM
 * @package Advanced OpenSales for SugarCRM
 * @subpackage Products
 * @copyright SalesAgility Ltd http://www.salesagility.com
 * 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU AFFERO GENERAL PUBLIC LICENSE as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU AFFERO GENERAL PUBLIC LICENSE
 * along with this program; if not, see http://www.gnu.org/licenses
 * or write to the Free Software Foundation,Inc., 51 Franklin Street,
 * Fifth Floor, Boston, MA 02110-1301  USA
 *
 * @author Salesagility Ltd <support@salesagility.com>
 */

$dictionary['AOS_Products_Quotes'] = array(
	'table'=>'aos_products_quotes',
	'audited'=>true,
	'fields'=>array (
  'product_qty' => 
  array (
    'required' => false,
    'name' => 'product_qty',
    'vname' => 'LBL_PRODUCT_QTY',
    'type' => 'int',
    'massupdate' => 0,
    'comments' => '',
    'help' => '',
    'importable' => 'true',
    'duplicate_merge' => 'disabled',
    'duplicate_merge_dom_value' => '0',
    'audited' => 0,
    'reportable' => 0,
    'len' => '11',
    'disable_num_format' => '',
  ),
  'product_cost_price' => 
  array (
    'required' => false,
    'name' => 'product_cost_price',
    'vname' => 'LBL_PRODUCT_COST_PRICE',
    'type' => 'float',
    'massupdate' => 0,
    'comments' => '',
    'help' => '',
    'importable' => 'true',
    'duplicate_merge' => 'disabled',
    'duplicate_merge_dom_value' => '0',
    'audited' => 0,
    'reportable' => 0,
    'len' => '16',
    'precision' => '2',
  ),
  'product_list_price' => 
  array (
    'required' => '1',
    'name' => 'product_list_price',
    'vname' => 'LBL_PRODUCT_LIST_PRICE',
    'type' => 'float',
    'massupdate' => 0,
    'comments' => '',
    'help' => '',
    'importable' => 'true',
    'duplicate_merge' => 'disabled',
    'duplicate_merge_dom_value' => '0',
    'audited' => 1,
    'reportable' => 0,
    'len' => '16',
    'precision' => '2',
  ),
  'product_unit_price' => 
  array (
    'required' => '1',
    'name' => 'product_unit_price',
    'vname' => 'LBL_PRODUCT_UNIT_PRICE',
    'type' => 'float',
    'massupdate' => 0,
    'comments' => '',
    'help' => '',
    'importable' => 'true',
    'duplicate_merge' => 'disabled',
    'duplicate_merge_dom_value' => '0',
    'audited' => 1,
    'reportable' => 0,
    'len' => '16',
    'precision' => '2',
  ),
  'vat_amt' => 
  array (
    'required' => '1',
    'name' => 'vat_amt',
    'vname' => 'LBL_VAT_AMT',
    'type' => 'float',
    'massupdate' => 0,
    'comments' => '',
    'help' => '',
    'importable' => 'true',
    'duplicate_merge' => 'disabled',
    'duplicate_merge_dom_value' => '0',
    'audited' => 1,
    'reportable' => 0,
    'len' => '16',
    'precision' => '2',
  ),
  'product_total_price' => 
  array (
    'required' => '1',
    'name' => 'product_total_price',
    'vname' => 'LBL_PRODUCT_TOTAL_PRICE',
    'type' => 'float',
    'massupdate' => 0,
    'comments' => '',
    'help' => '',
    'importable' => 'true',
    'duplicate_merge' => 'disabled',
    'duplicate_merge_dom_value' => '0',
    'audited' => 1,
    'reportable' => 0,
    'len' => '16',
    'precision' => '2',
  ),
  'vat' => 
  array (
    'required' => false,
    'name' => 'vat',
    'vname' => 'LBL_VAT',
    'type' => 'enum',
    'massupdate' => 0,
    'default' => '5.0',
    'comments' => '',
    'help' => '',
    'importable' => 'true',
    'duplicate_merge' => 'disabled',
    'duplicate_merge_dom_value' => '0',
    'audited' => 0,
    'reportable' => 0,
    'len' => 100,
    'options' => 'vat_list',
    'studio' => 'visible',
  ),
  'parent_name' => 
  array (
    'required' => false,
    'source' => 'non-db',
    'name' => 'parent_name',
    'vname' => 'LBL_FLEX_RELATE',
    'type' => 'parent',
    'massupdate' => 0,
    'comments' => '',
    'help' => '',
    'importable' => 'false',
    'duplicate_merge' => 'disabled',
    'duplicate_merge_dom_value' => '0',
    'audited' => 1,
    'reportable' => 0,
    'len' => 25,
    'options' => 'product_quote_parent_type_dom',
    'studio' => 'visible',
    'type_name' => 'parent_type',
    'id_name' => 'parent_id',
    'parent_type' => 'record_type_display',
  ),
  'parent_type' => 
  array (
    'required' => false,
    'name' => 'parent_type',
    'vname' => 'LBL_PARENT_TYPE',
    'type' => 'parent_type',
    'massupdate' => 0,
    'comments' => '',
    'help' => '',
    'importable' => 'false',
    'duplicate_merge' => 'disabled',
    'duplicate_merge_dom_value' => 0,
    'audited' => 0,
    'reportable' => 0,
    'len' => 100,
    'dbType' => 'varchar',
    'studio' => 'hidden',
  ),
  'parent_id' => 
  array (
    'required' => false,
    'name' => 'parent_id',
    'vname' => 'LBL_PARENT_ID',
    'type' => 'id',
    'massupdate' => 0,
    'comments' => '',
    'help' => '',
    'importable' => 'false',
    'duplicate_merge' => 'disabled',
    'duplicate_merge_dom_value' => 0,
    'audited' => 0,
    'reportable' => 0,
    'len' => 36,
  ),
  'product_id' => 
  array (
    'required' => false,
    'name' => 'product_id',
    'vname' => '',
    'type' => 'id',
    'massupdate' => 0,
    'comments' => '',
    'help' => '',
    'importable' => 'true',
    'duplicate_merge' => 'disabled',
    'duplicate_merge_dom_value' => 0,
    'audited' => 0,
    'reportable' => 0,
    'len' => 36,
  ),
  'product' => 
  array (
    'required' => false,
    'source' => 'non-db',
    'name' => 'product',
    'vname' => 'LBL_PRODUCT',
    'type' => 'relate',
    'massupdate' => 0,
    'comments' => '',
    'help' => '',
    'importable' => 'true',
    'duplicate_merge' => 'disabled',
    'duplicate_merge_dom_value' => '0',
    'audited' => 1,
    'reportable' => 0,
    'len' => '255',
    'id_name' => 'product_id',
    'ext2' => 'AOS_Products',
    'module' => 'AOS_Products',
    'quicksearch' => 'enabled',
    'studio' => 'visible',
  ),
),
	'relationships'=>array (
),
	'optimistic_lock'=>true,
);
require_once('include/SugarObjects/VardefManager.php');
VardefManager::createVardef('AOS_Products_Quotes','AOS_Products_Quotes', array('basic','assignable'));