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
{block name='product_miniature_item'}
    <article class="product-miniature js-product-miniature mb-3" role="listitem" data-id-product="{$product.id_product}"
        data-id-product-attribute="{$product.id_product_attribute}">
        <div class="card card-product">

            <div class="card-img-top product__card-img">
                {block name='product_thumbnail'}
                    <a href="{$product.canonical_url}" class="thumbnail product-thumbnail" aria-label="{l s='View product %name%' sprintf=['%name%' => $product.name] d='Shop.Theme.Accessibility'}">
                        {if $product.cover}
                            <img width="500px" height="500px" src="{$product.cover.bySize.home_default.url}"
                                alt="{$product.cover.legend|default:$product.name|truncate:30:'...'}"
                                data-full-size-image-url="{$product.cover.category.url}">
                        {elseif isset($urls.no_picture_image)}
                            <img src="{$urls.no_picture_image.bySize.home_default.url}">
                        {else}
                            <img
                                src="data:image/gif;base64,R0lGODlhAQABAIAAAMLCwgAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==">
                        {/if}

                    </a>

                {/block}
                <div class="highlighted-informations p-2{if !$product.main_variants} no-variants{/if} visible--desktop">


                    {block name='product_variants'}
                        {if $product.main_variants}
                            {include file='catalog/_partials/variant-links.tpl' variants=$product.main_variants}
                        {/if}
                    {/block}
                </div>

            </div>
            {* end card-img-top*}

            <div class="card-body">
                <div class="product-description product__card-desc">
                    {block name='product_name'}
                        {assign var=nom_produit value="-"|explode:$product.name}
                        {if $nom_produit[0] != 'meafl'}

                            {if isset($product.pack_quantity) && $product.pack_quantity}{$product.pack_quantity|intval|cat:' x '}{/if}
                            <div class="product-name descriptions-categorie" aria-labelledby="product-title-{$product.id_product}" title="{$product.name|escape:'html':'UTF-8'}">
                                
                                <h2 class="product-title" id="product-title-{$product.id_product}" aria-level="2">{$nom_produit[0]|truncate:38:'...'|escape:'html':'UTF-8'}</h2>
                                <span class="sep-title-cat"></span>
                                <p class="desc-nom-produit"> <span class="ligne2-produit-card">
                                    {$nom_produit[2]|truncate:38:'...'|escape:'html':'UTF-8'}</span></p>

                            </div>

                        {/if}
                    {/block}

                    {block name='product_reviews'}
                        {hook h='displayProductListReviews' product=$product}
                    {/block}
                    {block name='product_price_and_shipping'}
                        {if $product.show_price}
                            <div class="product-price-and-shipping">
                                {if $product.has_discount}
                                    {hook h='displayProductPriceBlock' product=$product type="old_price"}


                                    <span class="regular-price">{$product.regular_price}</span>

                                {/if}

                                {hook h='displayProductPriceBlock' product=$product type="before_price"}


                                <span class="price{if $product.has_discount} current-price-discount{/if}">{$product.price}</span>


                                {hook h='displayProductPriceBlock' product=$product type='unit_price'}

                                {hook h='displayProductPriceBlock' product=$product type='weight'}
                            </div>
                        {/if}
                    {/block}


                </div>

            </div>
            {* end card body*}
            {block name='product_flags'}
                <ul class="product-flags">
                    {foreach from=$product.flags item=flag}
                        {if $flag.type == "out_of_stock"}
                            {hook h='displayFlagProduct' product=$product flag=$flag}
                        {else}
                            <li
                                class="product-flag {$flag.type}{if $flag.type == "discount"} discount-flag {if $flag.label|strstr:"€"} discount-amount {else} discount-percent {/if}{/if}">
                                {$flag.label}</li>
                        {/if}
                    {/foreach}
                </ul>
            {/block}
        </div>
        {* end card product*}



    </article>
{/block}