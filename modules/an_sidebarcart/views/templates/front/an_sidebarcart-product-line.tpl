{*
* 2007-2018 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
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
* @author    Anvanto <anvantoco@gmail.com>
* @copyright 2007-2018 Anvanto
* @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*}

  <div class="product-remove">
    <a
    class                       = "remove-from-cart"
    rel                         = "nofollow"
    href                        = "{$product.remove_from_cart_url}"
    title                       = "delete-from-cart"
    data-link-action            = "delete-from-cart"
    data-id-product             = "{$product.id_product}"
    data-id-product-attribute   = "{$product.id_product_attribute}"
    data-id-customization       = "{$product.id_customization}"
    >
    {if !isset($product.is_gift) || !$product.is_gift}
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512"><!--!Font Awesome Pro 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2024 Fonticons, Inc.--><path d="M192 233.4L59.5 100.9 36.9 123.5 169.4 256 36.9 388.5l22.6 22.6L192 278.6 324.5 411.1l22.6-22.6L214.6 256 347.1 123.5l-22.6-22.6L192 233.4z"/></svg>
    {/if}
</a>
</div>

   <span class="product-image">
      <img src="{$product.cover.bySize.cart_default.url}" alt="{$product.name}" class="img-fluid">

  </span>
  <div class="product-infos">



      <a class="product-name product-name-sidebar" href="{$product.url}">
      {block name='product_name'}
        {assign var=nom_produit value="-"|explode:$product.name}
        {if $nom_produit[0] != 'meafl'}
            
                {if isset($product.pack_quantity) && $product.pack_quantity}{$product.pack_quantity|intval|cat:' x '}{/if}
                  <div class="product-name" href="{$product.link|escape:'html':'UTF-8'}"
                  title="{$product.name|escape:'html':'UTF-8'}">
                  
                  <p class="Nom-Produit">{$nom_produit[0]|truncate:38:'...'|escape:'html':'UTF-8'}  </p>
                 <p class="matiere-produit-fiche variant-titre"> {$nom_produit[1]|truncate:38:'...'|escape:'html':'UTF-8'} / {$nom_produit[2]|truncate:30:'...'|escape:'html':'UTF-8'}
                 <br>{$nom_produit[3]|truncate:38:'...'|escape:'html':'UTF-8'}
                 </p>
                 </div>
           
        {/if}

        
    {/block}

    
    
    </a>
      {foreach from=$product.attributes key="attribute" item="value"}
      <div class="product-line-info">
        <span class="label">{$attribute}:</span>
        <span class="value">{$value}</span>
    </div>
    {/foreach}
 
   
</div>



{if $product.customizations|count}{/if}
