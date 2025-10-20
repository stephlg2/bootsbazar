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
<!doctype html>
<html lang="{$language.iso_code}">

<head>
  {block name='head'}
    {include file='_partials/head.tpl'}
  {/block}
</head>

<body id="{$page.page_name}" class="{$page.body_classes|classnames}">

  {block name='hook_after_body_opening_tag'}
    {hook h='displayAfterBodyOpeningTag'}
  {/block}

  <header id="header" class="l-header">
    {block name='header'}
      {include file='checkout/_partials/header.tpl'}
    {/block}
  </header>

  {block name='notifications'}
    {include file='_partials/notifications.tpl'}
  {/block}

  <section id="wrapper" class="l-wrapper l-wrapper--boxed">
    {hook h="displayWrapperTop"}

    {block name='content'}
      <section id="content">
        <div class="row">
          <div id="js-checkout-process" class="col-lg-8 col-md-12 accordion mb-4">
            <div class="container container-tunnel">

              <div class="col-lg-12 col-md-12 col-sm-12">
                <span class="logo-tunnel"><a href="{$urls.base_url}"><img class="logo img-fluid" src="{$shop.logo}"
                      alt="{$shop.name}"></a>


                </span>
               
              </div>
              <div class="col-lg-12 col-sm-12 panier-mobile">
                <div class="contenu-panier-mobile visible--mobile">
                  {block name='cart_summary_products'}
                    <div class="cart-summary-products">

                    <p class="mb-0 nombre-articles"> 
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><!--!Font Awesome Pro 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2024 Fonticons, Inc.--><path d="M160 96v32H288V96c0-35.3-28.7-64-64-64s-64 28.7-64 64zm-32 64H48c-8.8 0-16 7.2-16 16V416c0 35.3 28.7 64 64 64H352c35.3 0 64-28.7 64-64V176c0-8.8-7.2-16-16-16H320v80c0 8.8-7.2 16-16 16s-16-7.2-16-16V160H160v80c0 8.8-7.2 16-16 16s-16-7.2-16-16V160zm0-32V96c0-53 43-96 96-96s96 43 96 96v32h80c26.5 0 48 21.5 48 48V416c0 53-43 96-96 96H96c-53 0-96-43-96-96V176c0-26.5 21.5-48 48-48h80z"></path></svg>
                    {$cart.summary_string}</p>

                      <p>
                        <a class="link__showsummary" href="#" data-toggle="collapse"
                          data-target="#cart-summary-product-list">
                          <i class="material-icons">expand_more</i> <span
                            class="small">{l s='show details' d='Shop.Theme.Actions'} </span>

                        </a>
                      </p>


                      {block name='cart_summary_product_list'}
                        <div class="collapse" id="cart-summary-product-list">
                          <ul class="media-list">
                            {foreach from=$cart.products item=product}
                              <li class="media media-list__item">
                                {include file='checkout/_partials/cart-summary-product-line.tpl' product=$product} 
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
                                
                                </li>
                                
                            {/foreach}
                          </ul>
                          <div class="total-mobil">
                            {block name='cart_summary_subtotals'}
                              {include file='checkout/_partials/cart-summary-subtotals.tpl' cart=$cart}
                            {/block}
                            

                            {block name='cart_summary_total'}
                              {if !$configuration.display_prices_tax_incl && $configuration.taxes_enabled}
                                  <div class="cart-summary-line">
                                      <span class="label">{$cart.totals.total.label}&nbsp;{$cart.labels.tax_short}</span>
                                      <span class="value">{$cart.totals.total.value}</span>
                                  </div>
                                  <div class="cart-summary-line cart-total">
                                      <span class="label">{$cart.totals.total_including_tax.label}</span>
                                      <span class="value">{$cart.totals.total_including_tax.value}</span>
                                  </div>
                              {else}
                                  <div class="cart-summary-line cart-total">
                                      <span class="label">{$cart.totals.total.label}&nbsp;{if $configuration.taxes_enabled}{$cart.labels.tax_short}{/if}</span>
                                      <span class="value">{$cart.totals.total.value}</span>
                                  </div>
                              {/if}
                          {/block}


                            </div>
                          </div>
                        {/block}





                      </div>
                    {/block}

                  </div>
                </div>


                {block name='checkout_process'}
                  {render file='checkout/checkout-process.tpl' ui=$checkout_process}
                {/block}
                <footer id="footer" class="l-footer">
                  {block name='footer'}
                    {include file='checkout/_partials/footer.tpl'}
                  {/block}
                </footer>
              </div>
            </div>
            <div class="col-lg-4 order-checkout">
              <div class="panier-tunnel-PC">
             
                {block name='cart_summary'}

                  {include file='checkout/_partials/cart-summary.tpl' cart = $cart}
                {/block}

                {hook h='displayReassurance'}
              </div>
            </div>
          </div>
        </section>
      {/block}
      {hook h="displayWrapperBottom"}
    </section>


    {block name='offcanvas_modals'}
      {* offcanvas search filter *}
      <div class="modal fade" id="offcanvas_search_filter" tabindex="-1" role="dialog" data-modal-hide-mobile>
        <div class="modal-dialog modal-dialog__offcanvas modal-dialog__offcanvas--right" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-label="{l s='Close' d='Shop.Theme.Global'}">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <div id="_mobile_search_filters_wrapper"></div>
            </div>
          </div>
        </div>
      </div>
      {* end search filter *}
      {* offcanvas menu *}
      <div class="modal fade" id="mobile_top_menu_wrapper" tabindex="-1" role="dialog" data-modal-hide-mobile>
        <div class="modal-dialog modal-dialog__offcanvas" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-label="{l s='Close' d='Shop.Theme.Global'}">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <div class="js-top-menu mobile" id="_mobile_top_menu"></div>
              <div class="js-top-menu-bottom">
                <div id="_mobile_currency_selector"></div>
                <div id="_mobile_language_selector"></div>
                <div id="_mobile_contact_link"></div>
              </div>
            </div>
          </div>
        </div>
      </div>
      {* end offcanvas menu *}
    {/block}
    {block name='javascript_bottom'}
      {include file="_partials/javascript.tpl" javascript=$javascript.bottom}
    {/block}

    {block name='hook_before_body_closing_tag'}
      {hook h='displayBeforeBodyClosingTag'}
    {/block}

  </body>

  </html>