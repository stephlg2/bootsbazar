{**
 * 2007-2017 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to http://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2017 PrestaShop SA
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
{assign var=filter_attribute_active value=array()}
{assign var=out_of_stock_attribut value=false}
{if !empty($listing.result->getFacetCollection())}
    {foreach from=$listing.result->getFacetCollection()->getFacets() item="facet" key="pos"}
        {if $facet->getType() == "attribute_group"}
            {foreach from=$facet->getFilters() item="filter" key="pos"}
                {if $filter->isActive()}
                    {$filter_attribute_active[] =$filter->getLabel() }
                {/if}
            {/foreach}
        {/if}
    {/foreach}
{/if}
<div id="js-product-list">
    <div class="products" role="list" aria-live="polite" aria-atomic="true" aria-relevant="additions removals">

        {foreach from=$listing.products item="product"}
            {$out_of_stock_attribut = false}

            {foreach from=$product['main_variants'] item="attribute" key="pos"}
                {if !$product['main_variants_status'][$attribute['id_product_attribute']] && in_array($attribute['name'],$filter_attribute_active)}
                    {$out_of_stock_attribut = true}
                {/if}
            {/foreach}


            {if !$out_of_stock_attribut }
                {block name='product_miniature'}
                    {include file='catalog/_partials/miniatures/product.tpl' product=$product}
                {/block}
            {/if}
        {/foreach}
        <div id="product-count" class="sr-only" aria-live="polite" aria-atomic="true">
          {l s='%d products displayed' sprintf=[$listing.pagination.total] d='Shop.Theme.Catalog'}
        </div>
        {hook h='displayListingSpecialProduct' category=$category pagination=$listing.pagination}
    </div>

    <nav aria-label="{l s='Pagination' d='Shop.Theme.Global'}" class="pagination-product">
      {block name='pagination'}
          {include file='_partials/pagination.tpl' pagination=$listing.pagination}
      {/block}
    </nav>

</div>
