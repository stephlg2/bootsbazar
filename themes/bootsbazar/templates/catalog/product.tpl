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
    <div class="row row-fiche-produit">
      <div class="col-lg-8 col-photos-produit p-0">

       

        {block name='page_content_container'}
          <section class="page-content--product" id="content">
            {block name='page_content'}
              {block name='product_flags'}
                {include file='catalog/_partials/product-flags.tpl'}
              {/block}

              {block name='product_cover_thumbnails'}
                {include file='catalog/_partials/product-cover-thumbnails.tpl'}
              {/block}

              <div id="tableau-detail"></div>
            {/block}
          </section>
        {/block}
      </div>

      <div class="col-lg-4 col-description">
        <div class="bloc-description">
          {block name='page_header_container'}
            {block name='page_header'}
              {block name='product_name'}
                {assign var=nom_produit value="-"|explode:$product.name}
                {if $nom_produit[0] != 'meafl'}

                  {if isset($product.pack_quantity) && $product.pack_quantity}
                    {$product.pack_quantity|intval|cat:' x '}
                  {/if}

                  <a class="product-name" href="{$product.link|escape:'html':'UTF-8'}"
                    title="{$product.name|escape:'html':'UTF-8'}">
                    <h1 class="Nom-Produit">{$nom_produit[0]|truncate:38:'...'|escape:'html':'UTF-8'}</h1>
                    <p class="Variante-titre-fiche-produit">{$nom_produit[2]|truncate:38:'...'|escape:'html':'UTF-8'}</p>

                    {block name='product_description_short'}
                      <div id="product-description-short-{$product.id}" class="Titre-Produit2">{$product.description_short nofilter}</div>
                    {/block}
                  </a>

                {/if}
              {/block}
            {/block}
          {/block}

          <div class="product-information" role="region" aria-label="{l s='Product information' d='Shop.Theme.Accessibility'}">

            {block name='product_prices'}
              {include file='catalog/_partials/product-prices.tpl'}
            {/block}

            {if $product.is_customizable && count($product.customizations.fields)}
              {block name='product_customization'}
                {include file="catalog/_partials/product-customization.tpl" customizations=$product.customizations}
              {/block}
            {/if}

            <div class="product-actions" role="region" aria-label="{l s='Product actions' d='Shop.Theme.Accessibility'}">
              {block name='product_buy'}
                <form action="{$urls.pages.cart}" method="post" id="add-to-cart-or-refresh">
                  <input type="hidden" name="token" value="{$static_token}">
                  <input type="hidden" name="id_product" value="{$product.id}" id="product_page_product_id">
                  <input type="hidden" name="id_customization" value="{$product.id_customization}" id="product_customization_id">

                  {block name='product_variants'}
                    {include file='catalog/_partials/product-variants.tpl'}
                  {/block}

                  {block name='product_pack'}
                    {if $packItems}
                      <section class="product-pack mb-4">
                        <p class="h4">{l s='This pack contains' d='Shop.Theme.Catalog'}</p>
                        {foreach from=$packItems item="product_pack"}
                          {block name='product_miniature'}
                            {include file='catalog/_partials/miniatures/pack-product.tpl' product=$product_pack}
                          {/block}
                        {/foreach}
                      </section>
                    {/if}
                  {/block}

                  {block name='product_discounts'}
                    {include file='catalog/_partials/product-discounts.tpl'}
                  {/block}

                  {block name='product_add_to_cart'}
                    <div class="bouton-guide-taille">
                      <svg aria-hidden="true" focusable="false" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512"><!--!Font Awesome Pro 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2024 Fonticons, Inc.--><path d="M32 352l576 0V160l-80 0v64 16H496V224 160H432v64 16H400V224 160H336v64 16H304V224 160H240v64 16H208V224 160H144v64 16H112V224 160l-80 0 0 192zM0 384V352 160 128H32 608h32v32V352v32H608L32 384H0z"/></svg>
                      <button class="btn btn-size-guide" type="button" data-toggle="canvas" data-target="#bs-canvas-right"
                        aria-expanded="false" aria-controls="bs-canvas-right">
                        {l s='Size guide' d='Shop.Theme.Catalog'}
                      </button>
                    </div>
                    {include file='catalog/_partials/product-add-to-cart.tpl'}
                  {/block}

                  {block name='product_additional_info'}
                    {include file='catalog/_partials/product-additional-info.tpl'}
                  {/block}

                </form>
                {if !$product->online_only}
                  {hook h="displayProductDispoBtq"}
                {/if}
              {/block}
            </div>

            {block name='product_tabs'}
              <h2 id="product-tabs-title" class="sr-only">{l s='Product details and information' d='Shop.Theme.Accessibility'}</h2>
              <section aria-labelledby="product-tabs-title">
                {include file='catalog/_partials/product-tabs.tpl'}
              </section>
            {/block}
          </div>

          {block name='hook_display_reassurance'}
            {hook h='displayReassurance'}
          {/block}

          <div class="reassurance-fiche">
            <svg aria-hidden="true" focusable="false" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512"><!--!Font Awesome Pro 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2024 Fonticons, Inc.--><path d="M128 32l224 0c17.7 0 32 14.3 32 32l0 320-133.5 0c-13.2-37.3-48.7-64-90.5-64c-24.6 0-47 9.2-64 24.4L96 288l-32 0 0 96 0 32c0 53 43 96 96 96s96-43 96-96l128 0c0 53 43 96 96 96s96-43 96-96l48 0c8.8 0 16-7.2 16-16s-7.2-16-16-16l-16 0 0-148.2c0-11.5-4.1-22.5-11.6-31.2l-78.7-91.8C508.6 102.1 495.3 96 481.3 96L416 96l0-32c0-35.3-28.7-64-64-64L128 0C92.7 0 64 28.7 64 64l0 32L16 96c-8.8 0-16 7.2-16 16s7.2 16 16 16l224 0c8.8 0 16-7.2 16-16s-7.2-16-16-16L96 96l0-32c0-17.7 14.3-32 32-32zM570.9 224L416 224l0-96 65.3 0c4.7 0 9.1 2 12.1 5.6L570.9 224zM416 256l160 0 0 128-5.5 0c-13.2-37.3-48.7-64-90.5-64c-24.6 0-47 9.2-64 24.4l0-88.4zM96 416a64 64 0 1 1 128 0A64 64 0 1 1 96 416zm384-64a64 64 0 1 1 0 128 64 64 0 1 1 0-128zM48 160c-8.8 0-16 7.2-16 16s7.2 16 16 16l224 0c8.8 0 16-7.2 16-16s-7.2-16-16-16L48 160zM16 224c-8.8 0-16 7.2-16 16s7.2 16 16 16l224 0c8.8 0 16-7.2 16-16s-7.2-16-16-16L16 224z"/></svg>
            <p>{l s='Free delivery on all orders<br>Free returns' d='Shop.Theme.Catalog'}</p>
          </div>

          <div class="carousel-fiche-produit">
            {hook h="hicarousel" id="6"}
          </div>

        </div>
        {hook h="displayProductDispoBtqModale"}
        {include file='catalog/_partials/guide-des-tailles.tpl'}
      </div>

    </div>

    {block name='product_images_modal'}
      {include file='catalog/_partials/product-images-modal.tpl'}
    {/block}

    {block name='page_footer_container'}
      <footer class="page-footer" role="contentinfo">{block name='page_footer'}{/block}</footer>
    {/block}

    <div class="container-fluid contenu-enrichi">
      <div class="container">
        {block name='product_text_enriched'}
          {hook h="cat-`$product.id_category_default`"}
        {/block}
      </div>
    </div>

  </section>

{/block}