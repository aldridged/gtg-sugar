<?php

/**
 * Advanced, robust set of sales and support modules.
 *
 * @package OpenSales for SugarCRM
 * @subpackage Products
 * @copyright 2008 php|webpros.com(tm)  http://www.phpwebpros.com/
 * 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, see http://www.gnu.org/licenses
 * or write to the Free Software Foundation,Inc., 51 Franklin Street,
 * Fifth Floor, Boston, MA 02110-1301  USA
 *
 * @author Rustin Phares <rustin.phares@phpwebpros.com>
 */

$manifest = array(
    'acceptable_sugar_versions' => array (
      'regex_matches' => array (
       0 => "4.5.*",
       1 => "5.0.*",
       2 => "5.1.*",
       3 => "5.2.*"
      ),
    ),
    'acceptable_sugar_flavors' => array (
       0 => 'OS',
       1 => 'CE',
    ),
    'name'                      => 'OpenSales Products for SugarCRM',
    'description'               => 'This module is for creating and managing sales and service products.',
    'author'                    => 'Rustin Phares',
    'published_date'            => '2009-03-21',
    'version'                   => '1.0.1',
    'type'                      => 'module',
    'icon'                      => '',
    'is_uninstallable'          => true,
);

$installdefs = array(
 'id'       => 'products',
 'copy'     => array(
                array('from'    => '<basepath>/modules/Products',
                      'to'      => 'modules/Products',
                )
               ),

 
 'language'=> array(
   array('from'     => '<basepath>/application/app_strings.php', 
         'to_module'=> 'application',
         'language' => 'en_us'
   ),
 //BUILDER:START of language
   array('from'     => '<basepath>/modules/Accounts/en_us.lang.php', 
         'to_module'=> 'Accounts',
         'language' => 'en_us'
   ),
   array('from'      => '<basepath>/modules/Contacts/en_us.lang.php',
       'to_module' => 'Contacts',
       'language'  => 'en_us'
       ),
   array('from'      => '<basepath>/modules/Project/en_us.lang.php',
       'to_module' => 'Project',
       'language'  => 'en_us'
       ),
 //BUILDER:END of language 
 ),
 
 'vardefs'=> array(
        array('from'=> '<basepath>/vardefs/contacts_vardefs.php',
 		  'to_module'=> 'Contacts'
 		  )
 ),
 
 'layoutdefs'=> array(
                      array('from'=> '<basepath>/layoutdefs/contacts_layoutdefs.php',
                            'to_module'=> 'Contacts'
                            )
                      ),

 'beans'=> array(
    array('module'=> 'Products',
          'class' => 'Product',
          'path'  => 'modules/Products/Product.php',
          'tab'   => true,
       )
 ),
 'relationships'=>array(
 //BUILDER:START of relationships
 array(
      'module'           => 'Accounts',
      'meta_data'        =>'<basepath>/relationships/products_accountsMetaData.php',
      'module_vardefs'   =>'<basepath>/vardefs/accounts_vardefs.php',
      'module_layoutdefs'=>'<basepath>/layoutdefs/accounts_layoutdefs.php'
     ),
 array(
      'module'           => 'Products',
      'meta_data'        =>'<basepath>/relationships/products_productsMetaData.php',
      'module_vardefs'   =>'<basepath>/vardefs/products_vardefs.php',
      'module_layoutdefs'=>'<basepath>/layoutdefs/products_layoutdefs.php'
     ),
 array(
      'module'           => 'Project',
      'meta_data'        =>'<basepath>/relationships/products_projectsMetaData.php',
      'module_vardefs'   =>'<basepath>/vardefs/project_vardefs.php',
      'module_layoutdefs'=>'<basepath>/layoutdefs/project_layoutdefs.php'
     ),
 //BUILDER:END of relationships 
 ),
 
 'post_execute'=>array(
		0 => '<basepath>/post_install/install_actions.php',
	),

);
?>