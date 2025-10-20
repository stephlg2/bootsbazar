{*
* 2021 Anvanto
*
* NOTICE OF LICENSE
*
* This file is not open source! Each license that you purchased is only available for 1 wesite only.
* If you want to use this file on more websites (or projects), you need to purchase additional licenses.
* You are not allowed to redistribute, resell, lease, license, sub-license or offer our resources to any third party.
*
*  @author Anvanto <anvantoco@gmail.com>
*  @copyright  2021 Anvanto
*  @license    Valid for 1 website (or project) for each purchase of license
*  International Registered Trademark & Property of Anvanto
*}

<div id="_desktop_cart">
  <div class="blockcart cart-preview js-sidebar-cart-trigger {if $cart.products_count > 0}active{else}inactive{/if}" data-refresh-url="{$refresh_url|escape:'htmlall':'UTF-8'}">
    <div class="header">
        <a class="blockcart-link" rel="nofollow" href="{$cart_url|escape:'htmlall':'UTF-8'}">
         
       <p>
       <div class="icon-header">
       <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><!--!Font Awesome Pro 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2024 Fonticons, Inc.--><path d="M160 112v48H288V112c0-35.3-28.7-64-64-64s-64 28.7-64 64zm-48 96H48V416c0 26.5 21.5 48 48 48H352c26.5 0 48-21.5 48-48V208H336v56c0 13.3-10.7 24-24 24s-24-10.7-24-24V208H160v56c0 13.3-10.7 24-24 24s-24-10.7-24-24V208zm0-48V112C112 50.1 162.1 0 224 0s112 50.1 112 112v48h64c26.5 0 48 21.5 48 48V416c0 53-43 96-96 96H96c-53 0-96-43-96-96V208c0-26.5 21.5-48 48-48h64z"/></svg>
       </div>
       </p>
            <span class="cart-products-count">{$cart.products_count|intval}</span>
        </a>
    </div>
    <div class="cart-dropdown js-cart-source hidden-xs-up">
      <div class="cart-dropdown-wrapper">
		{if isset($widget.title) && $widget.title !=''}
        <div class="products-section-title">
          <p class="titre-header-sb-panier">{$widget.title|escape:'htmlall':'UTF-8'}</p>
        </div>
		{/if}
        {if $cart.products}
          <ul class="cart-items">
            {foreach from=$cart.products item=product}
              <li class="cart-product-line">{include 'module:an_sidebarcart/views/templates/front/an_sidebarcart-product-line.tpl' product=$product}</li>
            {/foreach}
          </ul>
          <div class="cart-bottom">
            <div class="cart-subtotals">
              {foreach from=$cart.subtotals item="subtotal"}
                {if $subtotal}
                <div class="total-line sous_total {$subtotal.type|escape:'htmlall':'UTF-8'}">
                  <span class="label">{$subtotal.label|escape:'htmlall':'UTF-8'}</span>
                  <span class="value price">{if $subtotal.type == "discount"}-{/if} {$subtotal.value}</span>
                </div>
                {/if}
              {/foreach}
            </div>
            <hr>
            <div class="cart-total total-line">
              <span class="label">{$cart.totals.total.label|escape:'htmlall':'UTF-8'}</span>
              <span class="value price price-total"> {$cart.totals.total.value}</span>
            </div>
            <div class="cart-action">
              <div class="text-center">
                <a href="{$cart_url}" class="btn btn-primary">{l s='Processed to Checkout' d='Shop.Theme.Actions'} &nbsp;<i class="caret-right"></i></a>
              </div>
            </div>
          </div>
        {else}
          <div class="no-items">
           <span class="panier-vide"> {l s='There are no more items in your cart' d='Shop.Theme.Checkout'}</span>
           {*
        Suppression carousel sidebar
           *}    
          </div>
        {/if}
      </div>
    </div>

  </div>
</div>
