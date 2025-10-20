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
{extends file=$layout}

{block name='content'}

  <section id="main">
    <h1 class="products-section-title">{l s='Shopping Cart' d='Shop.Theme.Checkout'}</h1>
    <div class="cart-grid row">
    <div id="before_cart_header">
    {hook h="rasHookTplEdit" id="before_cart_header"}
</div>
      <!-- Left Block: cart product informations & shpping -->
      <div class="cart-grid-body col-12 col-lg-8">

        <!-- cart products detailed -->
        <div class="card cart-container">

          <div class="row">
            <div class="col-resume-panier col-lg-7">
              <div class="card-body cart__card-body js-cart__card-body">
                <div class="cart__card-loader">
                  <div class="spinner-border" role="status"><span
                      class="sr-only">{l s='Loading...' d='Shop.Theme.Global'}</span></div>
                </div>
                {block name='cart_overview'}
                  {include file='checkout/_partials/cart-detailed.tpl' cart=$cart}
                {/block}
              </div>
            </div>

            <div class="col-prix-panier col-lg-5 p-0">
            <div class="container-bouton-commander">
              {block name='cart_summary'}
                <div class="card cart-summary">
                  <div class="card-body card-body--summary">
                    {block name='hook_shopping_cart'}
                      {hook h='displayShoppingCart'}
                    {/block}

                    {block name='cart_totals'}
                      {include file='checkout/_partials/cart-detailed-totals.tpl' cart=$cart}
                    {/block}
                  </div>


                </div>
              {/block}
              <div class="container">
                <div class="row">


                  <div class="col-lg-12 p-0">
                    {block name='cart_actions'}
                      {include file='checkout/_partials/cart-detailed-actions.tpl' cart=$cart}
                    {/block}
                  </div>


                  <div class="col-lg-12">
                  
                    {block name='continue_shopping'}
                      <a class="label btn btn-outline-primary btn-continuer-achat" href="{$urls.pages.index}">
                      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512"><!--!Font Awesome Pro 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2024 Fonticons, Inc.--><path d="M20.7 267.3c-6.2-6.2-6.2-16.4 0-22.6l192-192c6.2-6.2 16.4-6.2 22.6 0s6.2 16.4 0 22.6L54.6 256 235.3 436.7c6.2 6.2 6.2 16.4 0 22.6s-16.4 6.2-22.6 0l-192-192z"/></svg>
                      {l s='Continue shopping' d='Shop.Theme.Actions'}
                      </a>
                    {/block}
                  </div>


                </div>

              </div>

              <div id="after_order_button">
              {hook h="rasHookTplEdit" id="after_order_button"}
          </div>

            </div>
            </div>
          </div>



        </div>




        <!-- shipping informations -->
        {block name='hook_shopping_cart_footer'}
          {hook h='displayShoppingCartFooter'}
        {/block}
      </div>

        

      <!-- Right Block: cart subtotal & cart total -->
      <div class="cart-grid-right col-12 col-lg-4 mt-4 mt-lg-0">



        {block name='hook_reassurance'}
          {hook h='displayReassurance'}
        {/block}



      </div>

    </div>
  </section>

   <!-- Bandeau COM -->
   <div class="block-bandeau_page_commande">{hook h="rasHookTplEdit" id="bandeau_page_commande"}</div>


  <div class="suggestion-panier"> 	{hook h="hicarousel" id="5"}</div>
{/block}