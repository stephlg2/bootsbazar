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
<div class="product-line-grid row no-gutters">
    <div class="col-lg-12">
    
        <div class="media">
         <a href="{$product.link|escape:'html':'UTF-8'}" title="{$product.name|escape:'html':'UTF-8'}">   
         <img src="{$product.cover.bySize.cart_default.url}" alt="{$product.name|escape:'quotes'}"
                 class="product-line__img" width="{$product.cover.bySize.cart_default.width}"
                 height="{$product.cover.bySize.cart_default.height}">
         </a>
            <div class="media-body product-line__body">
            <a class="h5 product-line__title titre-panier-details" href="{$product.url}"
            data-id_customization="{$product.id_customization|intval}">{block name='product_name'}
             {assign var=nom_produit value="-"|explode:$product.name}
             {if $nom_produit[0] != 'meafl'}
                 
                     {if isset($product.pack_quantity) && $product.pack_quantity}{$product.pack_quantity|intval|cat:' x '}{/if}
                 <div class="product-name" href="{$product.link|escape:'html':'UTF-8'}"
                      title="{$product.name|escape:'html':'UTF-8'}">
                      <h2 class="Nom-Produit">{$nom_produit[0]|truncate:38:'...'|escape:'html':'UTF-8'} 
                      
                      
                      </h2>
                      <div class="cart-line-product-actions supprim-produit-panier">
                      <a
                              class                       = "remove-from-cart"
                              rel                         = "nofollow"
                              href                        = "{$product.remove_from_cart_url}"
                              data-link-action            = "delete-from-cart"
                              data-id-product             = "{$product.id_product|escape:'javascript'}"
                              data-id-product-attribute   = "{$product.id_product_attribute|escape:'javascript'}"
                              data-id-customization   	  = "{$product.id_customization|escape:'javascript'}"
                      >
                          {if !isset($product.is_gift) || !$product.is_gift}
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512"><!--!Font Awesome Pro 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2024 Fonticons, Inc.--><path d="M345 137c9.4-9.4 9.4-24.6 0-33.9s-24.6-9.4-33.9 0l-119 119L73 103c-9.4-9.4-24.6-9.4-33.9 0s-9.4 24.6 0 33.9l119 119L39 375c-9.4 9.4-9.4 24.6 0 33.9s24.6 9.4 33.9 0l119-119L311 409c9.4 9.4 24.6 9.4 33.9 0s9.4-24.6 0-33.9l-119-119L345 137z"/></svg>
                          {/if}
                      </a>
        
                      {block name='hook_cart_extra_product_actions'}
                          {hook h='displayCartExtraProductActions' product=$product}
                      {/block}
        
                  </div>
                  <div class="product-name descriptif-panier" href="{$product.link|escape:'html':'UTF-8'}"
                  title="{$product.name|escape:'html':'UTF-8'}">
                 
                 <p class="matiere-produit-fiche variant-titre"> 
                 {$nom_produit[1]|truncate:38:'...'|escape:'html':'UTF-8'} / 
                 {$nom_produit[2]|truncate:50:'...'|escape:'html':'UTF-8'}
                 </p>
                 </div>
                 </div>
                


             {/if}
         {/block}</a>
         {foreach from=$product.attributes key="attribute" item="value"}
            <div class="small">
                <span class="">{$attribute}:</span>
                <span class="value">{$value}</span>
            </div>
        {/foreach}

                <div class="product-line-info product-price{if $product.has_discount} has-discount{/if}">
                    {if $product.has_discount}
                        <div class="product-discount">
                            <span class="regular-price">{$product.regular_price}</span>
                            {if $product.discount_type === 'percentage'}
                                
                            {else}
                            
                            {/if}
                        </div>
                    {/if}

                    <div class="current-price">
                        <span class="current-price-display price{if $product.has_discount} current-price-discount{/if}">{$product.price}</span>
                        {if $product.unit_price_full}
                            <div class="unit-price-cart">{$product.unit_price_full}</div>
                        {/if}
                    </div>
                </div>
                {* end product-price *}
                
                {if is_array($product.customizations) && $product.customizations|count}
                    {block name='cart_detailed_product_line_customization'}
                        <div class="mt-3">
                        {foreach from=$product.customizations item="customization"}
                            <a href="#" data-toggle="modal" data-target="#product-customizations-modal-{$customization.id_customization}">{l s='Product customization' d='Shop.Theme.Catalog'}</a>
                            <div class="modal fade customization-modal" id="product-customizations-modal-{$customization.id_customization}" tabindex="-1" role="dialog" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h4 class="modal-title">{l s='Product customization' d='Shop.Theme.Catalog'}</h4>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="{l s='Close' d='Shop.Theme.Global'}">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            {foreach from=$customization.fields item="field"}
                                                <div class="product-customization-line row">
                                                    <div class="col-sm-3 col-4 label">
                                                        {$field.label}
                                                    </div>
                                                    <div class="col-sm-9 col-8 value">
                                                        {if $field.type == 'text'}
                                                            {if (int)$field.id_module}
                                                                {$field.text nofilter}
                                                            {else}
                                                                {$field.text}
                                                            {/if}
                                                        {elseif $field.type == 'image'}
                                                            <img src="{$field.image.small.url}">
                                                        {/if}
                                                    </div>
                                                </div>
                                            {/foreach}
                                        </div>
                                    </div>
                                </div>
                            </div>
                        {/foreach}
                        </div>
                    {/block}
                {/if}

            
       


          {*d-flex align-items-start justify-content-between*}
          <div class="product-actions">
          {if isset($product.is_gift) && $product.is_gift}
              <span class="gift-quantity">{$product.quantity}</span>
          {else}
              <div>
                  <input
                          class="js-cart-line-product-quantity"
                          data-down-url="{$product.down_quantity_url}"
                          data-up-url="{$product.up_quantity_url}"
                          data-update-url="{$product.update_quantity_url}"
                          data-product-id="{$product.id_product}"
                          type="number"
                          value="{$product.quantity}"
                          name="product-quantity-spin"
                          min="{$product.minimal_quantity}"
                  />
              </div>
          {/if}
         


      </div>
  </div>
  </div>
  </div>
    </div>
    {* end first col *}
  