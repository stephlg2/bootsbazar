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
<div id="js-product-list-top" class="row products-selection">

  <div class="col-lg-12 p-0">
    <div class="sort-by-row">
      {block name='sort_by'}
        {include file='catalog/_partials/sort-orders.tpl' sort_orders=$listing.sort_orders}
      {/block}

      {if !empty($listing.rendered_facets)}
          <button type="button" id="search_filter_toggler" class="btn form-arrondi" data-target="#offcanvas_search_filter" data-toggle="modal">
          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--!Font Awesome Pro 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2024 Fonticons, Inc.--><path d="M0 400l0 32 16 0 64 0 0 32 0 32 32 0 96 0 32 0 0-32 0-32 256 0 16 0 0-32-16 0-256 0 0-32 0-32-32 0-96 0-32 0 0 32 0 32-64 0L0 400zm208 32l0 32-96 0 0-32 0-32 0-32 96 0 0 32 0 32zM0 240l0 32 16 0 256 0 0 32 0 32 32 0 96 0 32 0 0-32 0-32 64 0 16 0 0-32-16 0-64 0 0-32 0-32-32 0-96 0-32 0 0 32 0 32L16 240 0 240zM112 112l0 32 0 32 32 0 96 0 32 0 0-32 0-32 224 0 16 0 0-32-16 0L272 80l0-32 0-32-32 0-96 0-32 0 0 32 0 32L16 80 0 80l0 32 16 0 96 0zm32 0l0-32 0-32 96 0 0 32 0 32 0 32-96 0 0-32zM400 240l0 32 0 32-96 0 0-32 0-32 0-32 96 0 0 32z"/></svg>
            {l s='Filter' d='Shop.Theme.Actions'}
          </button>
      {/if}
    </div>
  </div>

    <div class="nombre-articles text-sm-left mt-1 col-12 " id="block_total_origin" style="display: none">
        {l s='%total% item(s)' d='Shop.Theme.Catalog' sprintf=['%total%' => $listing.pagination.total_items]}
    </div>
</div>


