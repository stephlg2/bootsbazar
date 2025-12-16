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
<section id="js-checkout-summary" class="card js-cart mb-5" data-refresh-url="{$urls.pages.cart}?ajax=1&action=refresh">
  <div class="card-body card__summary">
    {block name='hook_checkout_summary_top'}
      {hook h='displayCheckoutSummaryTop'}
    {/block}

    {block name='cart_summary_products'}
      <div class="cart-summary-products">

        <p class="mb-0">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><!--!Font Awesome Pro 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2024 Fonticons, Inc.--><path d="M160 96v32H288V96c0-35.3-28.7-64-64-64s-64 28.7-64 64zm-32 64H48c-8.8 0-16 7.2-16 16V416c0 35.3 28.7 64 64 64H352c35.3 0 64-28.7 64-64V176c0-8.8-7.2-16-16-16H320v80c0 8.8-7.2 16-16 16s-16-7.2-16-16V160H160v80c0 8.8-7.2 16-16 16s-16-7.2-16-16V160zm0-32V96c0-53 43-96 96-96s96 43 96 96v32h80c26.5 0 48 21.5 48 48V416c0 53-43 96-96 96H96c-53 0-96-43-96-96V176c0-26.5 21.5-48 48-48h80z"/></svg>
        {$cart.summary_string}</p>

        <p>
          <a class="link__showsummary" href="#" data-toggle="collapse" data-target="#cart-summary-product-list">
            <span class="small"> {l s='show details' d='Shop.Theme.Actions'} </span><i class="material-icons">expand_more</i>

          </a>
        </p>


        {block name='cart_summary_product_list'}
          <div class="collapse" id="cart-summary-product-list">
            <ul class="media-list">
              {foreach from=$cart.products item=product}
                <li class="media media-list__item">{include file='checkout/_partials/cart-summary-product-line.tpl' product=$product}</li>
              {/foreach}
            </ul>
          </div>
        {/block}
      </div>
    {/block}

    {block name='cart_summary_subtotals'}
        {include file='checkout/_partials/cart-summary-subtotals.tpl' cart=$cart}
    {/block}
      {block name='cart_summary_voucher'}
          {include file='checkout/_partials/cart-voucher.tpl'}
      {/block}
  </div>



  {block name='cart_summary_totals'}
      <div class="card-footer">
    {include file='checkout/_partials/cart-summary-totals.tpl' cart=$cart}
      </div>
  {/block}

</section>
