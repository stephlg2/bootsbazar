{**
* 2013 - 2018 HiPresta
*
* MODULE Carousels Pack
*
* @author    HiPresta <suren.mikaelyan@gmail.com>
* @copyright HiPresta 2018
* @license   AddonsPrestaShop license limitation
* @link      http://www.hipresta.com
*
* NOTICE OF LICENSE
*
* Don't use this module on several shops. The license provided by PrestaShop Addons
* for all its modules is valid only once for a single shop.
*}

{if isset($cp_products) && $cp_products}
    {if $psv >= 1.7}
        <section class="featured-products clearfix">
    {else}
        <div class="clearfix carousels-pack-block">
            <div class="block">
    {/if}
                {if isset($carousel_options) && !empty($carousel_options)}
                    {if $carousel_options['show_title']}
                        <p class="h3 h3-also-like">
                            {if $carousel_options['title'] != ''}
                                {$carousel_options['title']|escape:'htmlall':'UTF-8'}
                            {/if}
                        </p>
                    {/if}
                {/if}
                <div class="{if $carousel_options['activate_carousel']}carousels-pack-action {/if} carousels-pack carousels-pack-{$carousel_options['id_carousel']|escape:'htmlall':'UTF-8'}"
                    data-carousel-type = "{$carousel_options['type']|escape:'htmlall':'UTF-8'}"
                    data-id-carousel = "{$carousel_options['id_carousel']|escape:'htmlall':'UTF-8'}"
                    data-carousel-nav = "{$carousel_options['nav']|escape:'htmlall':'UTF-8'}"
                    data-carousel-pagination = "{$carousel_options['pagination']|escape:'htmlall':'UTF-8'}"
                    data-carousel-autoplay = "{$carousel_options['autoplay']|escape:'htmlall':'UTF-8'}"
                    data-carousel-items = "{$carousel_options['items']|escape:'htmlall':'UTF-8'}"
                    data-carousel-items-desktop = "{$carousel_options['items_desktop']|escape:'htmlall':'UTF-8'}"
                    data-carousel-desktop-small = "{$carousel_options['desktop_small']|escape:'htmlall':'UTF-8'}"
                    data-carousel-tablet = "{$carousel_options['tablet']|escape:'htmlall':'UTF-8'}"
                    data-carousel-mobile = "{$carousel_options['mobile']|escape:'htmlall':'UTF-8'}"
                    data-carousel-rewind-speed = "{$carousel_options['rewind_speed']|escape:'htmlall':'UTF-8'}"
                    data-carousel-slide-speed = "{$carousel_options['slide_speed']|escape:'htmlall':'UTF-8'}"
                    data-carousel-pagination-speed = "{$carousel_options['pagination_speed']|escape:'htmlall':'UTF-8'}"
                    data-carousel-prev = "{l s='prev' mod='hicarouselspack'}"
                    data-carousel-next = "{l s='next' mod='hicarouselspack'}">
                    {if $psv >= 1.7}
                        <div class="carousel_content owl-carousel {if !$carousel_options['activate_carousel']}inactive_carousel{/if}">
                            {foreach from=$cp_products item="product"}
                                {include file="catalog/_partials/miniatures/product.tpl" product=$product}
                            {/foreach}
                        </div>
                    {else}
                        {if $default_template}
                            {include file="{$tpl_dir}./product-list.tpl" products=$cp_products}
                        {else}
                            <ul class="carousel_content owl-carousel product_list">
                                {include file="{$cp_module_tpl_dir}/products_version.tpl" products=$cp_products psv=$psv activate_carousel=$carousel_options['activate_carousel']}
                            </ul>
                        {/if}
                    {/if}
                </div>
    {if $psv >= 1.7}
        </section>
    {else}
            </div>
        </div>
    {/if}
{/if}


