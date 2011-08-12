<?PHP
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

/**
 * THIS CLASS IS FOR DEVELOPERS TO MAKE CUSTOMIZATIONS IN
 */
require_once('modules/AOS_Quotes/AOS_Quotes_sugar.php');
class AOS_Quotes extends AOS_Quotes_sugar {
	
	function AOS_Quotes(){	
		parent::AOS_Quotes_sugar();
	}
	
	function save($check_notify = FALSE){
		// If new or duplicate entry, get a quote number otherwise already set.
		$this->number = (empty($this->id)) ? $this->db->getOne("SELECT count(id)+1 FROM aos_quotes"): $this->number;
		
		parent::save($check_notify);
		if(isset($_POST['product_id']) && !empty($_POST['product_id'])){
			$this->saveListItems();
		}
	}
	
	function saveListItems(){
		require_once('modules/AOS_Products_Quotes/AOS_Products_Quotes.php');
		$productQuote = new AOS_Products_Quotes();

		$product = array('id' => $_POST['product_quote_id'],
						 'product_id' => $_POST['product_id'],
						 'product_name' => $_POST['product_name'],
						 'product_qty' => $_POST['product_qty'],
						 'vat'=>$_POST['vat'],
						 'vat_amt' => $_POST['vat_amt'],				 
						 'product_list_price' => $_POST['product_list_price'],
						 'product_unit_price' => $_POST['product_unit_price'],
						 'product_total_price' => $_POST['product_total_price'],
						 'product_rate' => $_POST['product_rate'],
						 'product_prov_price' => $_POST['product_prov_price'],
						 'start_date' => $_POST['start_date'],
						 'stop_date' => $_POST['stop_date'],
						 'product_note' => $_POST['product_note'],
						 'product_note2' => $_POST['product_note2'],
						 'deleted' => $_POST['deleted']);
							 
		$productLineCount = count($product['product_id']);
		
		for ($i = 0; $i < $productLineCount; $i++) {
			$productQuote->id = $product['id'][$i];
			$productQuote->parent_id = $this->id;
			$productQuote->parent_type = 'AOS_Quotes';
			$productQuote->product_id = $product['product_id'][$i];
			$productQuote->name = $product['product_name'][$i];
			$productQuote->product_qty = $product['product_qty'][$i];
			$productQuote->product_list_price = unformat_number($product['product_list_price'][$i]);
			$productQuote->product_unit_price = unformat_number($product['product_unit_price'][$i]);
			$productQuote->vat = $product['vat'][$i];
			$productQuote->vat_amt = unformat_number($product['vat_amt'][$i]);	
			$productQuote->product_total_price = unformat_number($product['product_total_price'][$i]);
			$productQuote->product_rate = $product['product_rate'][$i];
			$productQuote->product_prov_price = unformat_number($product['product_prov_price'][$i]);
			$productQuote->start_date = $product['start_date'][$i];
			$productQuote->stop_date = $product['stop_date'][$i];
			$productQuote->description = $product['product_note'][$i];
			$productQuote->description2 = $product['product_note2'][$i];
			$productQuote->deleted = $product['deleted'][$i];
			
			if ($productQuote->deleted == 1) {
				$productQuote->mark_deleted($productQuote->id);
			} else {
				if(trim($productQuote->product_id) != ''){
					$productQuote->save();
				}
			}
		}
	}	
}
?>
