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
 {block name='cart_summary_product_line'}
  <a href="{$product.url}" title="{$product.name}" class="mr-3">
    <img class="media-object" src="{$product.cover.small.url}" alt="{$product.name}" width="50">
  </a>
<div class="media-body small">
  <div class="product-name nom-produit-panier">{block name='product_name'}
    {assign var=nom_produit value="-"|explode:$product.name}
    {if $nom_produit[0] != 'meafl'}
        
            {if isset($product.pack_quantity) && $product.pack_quantity}{$product.pack_quantity|intval|cat:' x '}{/if}
        <div class="product-name" href="{$product.link|escape:'html':'UTF-8'}"
        title="{$product.name|escape:'html':'UTF-8'}">
        <h1 class="Nom-Produit">{$nom_produit[0]|truncate:38:'...'|escape:'html':'UTF-8'}</h1>
       <p class="matiere-produit-fiche variant-titre"> {$nom_produit[1]|truncate:38:'...'|escape:'html':'UTF-8'} 
       <span class="puce-sep-titre">-</span> {$nom_produit[2]|truncate:38:'...'|escape:'html':'UTF-8'}
       <span class="puce-sep-titre"> </span> {$nom_produit[3]|truncate:38:'...'|escape:'html':'UTF-8'}
       </p>
       </div>
       
    {/if}
{/block}</div>
 {** <div class="clearfix">
    <span class="product-quantity float-left">x{$product.quantity}</span>
    <span class="product-price float-right">{$product.price}</span>
  </div> *}
  {hook h='displayProductPriceBlock' product=$product type="unit_price"}
{foreach from=$product.attributes key="attribute" item="value"}
    <div class="product-line-info product-line-info-secondary text-muted small">
        <span class="label">{$attribute}:</span>
        <span class="value">{$value}</span>
    </div>
{/foreach}

</div>
{/block}
