{**
* 2013 - 2018 HiPresta
*
* MODULE Carousels Pack
*
* @author    HiPresta <suren.mikaelyan@gmail.com>
* @copyright HiPresta 2018
* @license   AddonsPrestaShop license limitation
* @link      http://www.hipresta.com
*
* NOTICE OF LICENSE
*
* Don't use this module on several shops. The license provided by PrestaShop Addons
* for all its modules is valid only once for a single shop.
*}

<div class="custom_product_content">
	{if $psv >= 1.6}
		<div class="col-lg-12">
			<div class="panel">
				<div class="panel-heading">{l s='Products' mod='hicarouselspack'}</div>
				<div class="form-wrapper">
					<div class="form-group">
						<label class="control-label col-lg-12" for="reductionProductFilter">{l s='Search Product' mod='hicarouselspack'}</label>
						<div class="col-lg-12">
							<div class="col-lg-12">
								<input type="text" id="reductionProductFilter" name="custom_product_filter" value="" autocomplete="off" class="ac_input">
							</div>
							<div class="col-lg-12">
								<button type="button" id="add_custom_product_item" class="btn btn-default" name="submit_custom_product_add_pr" data-id-carousel="{$id_carousel|intval}">
									<i class="icon-plus-sign-alt"></i> {l s='Add this product' mod='hicarouselspack'}
								</button>
							</div>
						</div>
						<div class="error col-lg-offset-3 alert alert-warning pack-empty-warning hide" style="margin-top: 32px; margin-left: 27%"></div>
					</div>
				</div>
				<div class="custom_products_list">
					<div class="form-group listOfPack">
						<ul id="divPackItems" class="list-unstyled">
							{foreach from=$cp_products item=product}
								<li class="product-pack-item media-product-pack" style="width: 100%">
									<img class="media-product-pack-img" src="{$product['img_link']|escape:'htmlall':'UTF-8'}"/>
									<span class="media-product-pack-title">
										{l s='Name' mod='hicarouselspack'}: {$product['name']|truncate:20:'..'|escape:'html':'UTF-8'}
									</span>
									<span class="media-product-pack-ref">
										{l s='REF' mod='hicarouselspack'}: {$product['reference']|escape:'html':'UTF-8'}
									</span>
									<a href="#" class="btn btn-default media-product-pack-action delete_custom_product" data-delete="{$product['id_product']|escape:'htmlall':'UTF-8'}" data-id-carousel="{$id_carousel|intval}">
									<i class="fa-sharp fa-light fa-xmark"></i>
									</a>
								</li>
							{/foreach}
						</ul>
					</div>
				</div>
			</div>
		</div>
	{else}
		<div id="custom-product-carousel">
			<h3 class="custom-product-title">{l s='Products' mod='hicarouselspack'}</h3>
			<label>{l s='Search Product' mod='hicarouselspack'}</label>
			<div>
				<input type="text" id="reductionProductFilter" name="custom_product_filter" value="" autocomplete="off" class="ac_input">
				<button type="button" id="add_custom_product_item" class="btn btn-default" name="submit_custom_product_add_pr" data-id-carousel="{$id_carousel|intval}">
					<img src="../img/admin/add.gif"> {l s='Add this product' mod='hicarouselspack'}
				</button>
				<div class="error custom-product-errors hide"></div>
				<div class="custom_products_list">
					<div class="listOfPack">
						<ul>
							{foreach from=$cp_products item=product}
								<li>
									<img class="media-product-pack-img" src="{$product['img_link']|escape:'htmlall':'UTF-8'}"/>
									<span class="product-pack-title">
										{l s='Name'  mod='hicarouselspack'}: {$product['name']|truncate:14:'..'|escape:'html':'UTF-8'}
									</span>
									<span class="product-pack-ref">
										{l s='REF'  mod='hicarouselspack'}: {$product['reference']|escape:'html':'UTF-8'}
									</span>
									<a href="#" class="delete_custom_product" data-delete="{$product['id_product']|escape:'htmlall':'UTF-8'}" data-id-carousel="{$id_carousel|intval}">
										<img src="../img/admin/delete.gif" alt="{l s='Deletel'  mod='hicarouselspack'}">
									</a>
								</li>
							{/foreach}
						</ul>
					</div>
				</div>
			</div>
		</div>
	{/if}
	<script type="text/javascript">
		$(document).ready(function(){
			$('#reductionProductFilter').autocomplete(cp_module_controller_dir+"&ajax=1", {
		        minChars: 2,
		        max: 50,
		        width: 500,
		        formatItem: function (data) {
		            return data[0]+ '. '+data[2] + '-' + data[1];
		        },
		        scroll: false,
		        multiple: false,
		        extraParams: {
		            action : 'product_search',
		            id_lang : id_lang,
		            secure_key : cp_secure_key,
		        }
		    });
		});
	</script>
</div>
