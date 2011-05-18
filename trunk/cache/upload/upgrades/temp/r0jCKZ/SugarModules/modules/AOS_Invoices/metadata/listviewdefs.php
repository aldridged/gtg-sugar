<?php
if(!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');
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

$module_name = 'AOS_Invoices';
$OBJECT_NAME = 'AOS_INVOICES';
$listViewDefs[$module_name] = array(
	'NAME' => array(
		'width' => '40', 
		'label' => 'LBL_ACCOUNT_NAME', 
		'link' => true,
        'default' => true), 
	'BILLING_ADDRESS_CITY' => array(
		'width' => '10', 
		'label' => 'LBL_CITY',
        'default' => true 
		),
	'PHONE_OFFICE' => array(
		'width' => '10', 
		'label' => 'LBL_PHONE',
        'default' => true),
    $OBJECT_NAME . '_TYPE' => array(
        'width' => '10', 
        'label' => 'LBL_TYPE'),
    'INDUSTRY' => array(
        'width' => '10', 
        'label' => 'LBL_INDUSTRY'),
    'ANNUAL_REVENUE' => array(
        'width' => '10', 
        'label' => 'LBL_ANNUAL_REVENUE'),
    'PHONE_FAX' => array(
        'width' => '10', 
        'label' => 'LBL_PHONE_FAX'),
    'BILLING_ADDRESS_STREET' => array(
        'width' => '15', 
        'label' => 'LBL_BILLING_ADDRESS_STREET'),
    'BILLING_ADDRESS_STATE' => array(
        'width' => '7', 
        'label' => 'LBL_BILLING_ADDRESS_STATE'),
    'BILLING_ADDRESS_POSTALCODE' => array(
        'width' => '10', 
        'label' => 'LBL_BILLING_ADDRESS_POSTALCODE'),
    'BILLING_ADDRESS_COUNTRY' => array(
        'width' => '10', 
        'label' => 'LBL_BILLING_ADDRESS_COUNTRY'),
    'SHIPPING_ADDRESS_STREET' => array(
        'width' => '15', 
        'label' => 'LBL_SHIPPING_ADDRESS_STREET'),
    'SHIPPING_ADDRESS_CITY' => array(
        'width' => '10', 
        'label' => 'LBL_SHIPPING_ADDRESS_CITY'),
    'SHIPPING_ADDRESS_STATE' => array(
        'width' => '7', 
        'label' => 'LBL_SHIPPING_ADDRESS_STATE'),
    'SHIPPING_ADDRESS_POSTALCODE' => array(
        'width' => '10', 
        'label' => 'LBL_SHIPPING_ADDRESS_POSTALCODE'),
    'SHIPPING_ADDRESS_COUNTRY' => array(
        'width' => '10', 
        'label' => 'LBL_SHIPPING_ADDRESS_COUNTRY'),
    'PHONE_ALTERNATE' => array(
        'width' => '10', 
        'label' => 'LBL_PHONE_ALT'),
    'WEBSITE' => array(
        'width' => '10', 
        'label' => 'LBL_WEBSITE'),
    'OWNERSHIP' => array(
        'width' => '10', 
        'label' => 'LBL_OWNERSHIP'),
    'EMPLOYEES' => array(
        'width' => '10', 
        'label' => 'LBL_EMPLOYEES'),
    'TICKER_SYMBOL' => array(
        'width' => '10', 
        'label' => 'LBL_TICKER_SYMBOL'),
   






    'ASSIGNED_USER_NAME' => array(
        'width' => '2', 
        'label' => 'LBL_ASSIGNED_USER',
        'default' => true),
   
);
?>
