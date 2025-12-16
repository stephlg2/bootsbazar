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

{if isset($suppliers)}
    <div class="clearfix"></div>
    <div class="block carousels-pack-block {if $psv >= 1.7} featured-products {/if} {$carousel_options['type']|escape:'htmlall':'UTF-8'}">
        {if $carousel_options['show_title']}
            <p class="{if $psv < 1.7}title_block {else} h1 products-section-title text-uppercase{/if}">
                {if $carousel_options['title'] != ''}
                    {$carousel_options['title']|escape:'htmlall':'UTF-8'}
                {/if}
            </p>
        {/if}
        <div class="{if $carousel_options['activate_carousel']}carousels-pack-action{/if} carousels-pack-{$carousel_options['id_carousel']|escape:'htmlall':'UTF-8'}"
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
            <div class="carousel_content owl-carousel">
                {foreach from=$suppliers item=supplier}
                    <div class="hi-carousels-images {if !$carousel_options['activate_carousel']}on_left{/if}">
                        {if $PS_DISPLAY_SUPPLIERS}
                            <a href="{$link->getSupplierLink($supplier.id_supplier, $supplier.link_rewrite)|escape:'htmlall':'UTF-8'}" title="{l s='More about' mod='hicarouselspack'} {$supplier.name|escape:'htmlall':'UTF-8'}" class="manufacturer_link">
                        {/if}
                            <img src="{$supplier_img_dir|escape:'htmlall':'UTF-8'}{$supplier.id_supplier|escape:'htmlall':'UTF-8'}-{$suppc_img_size|escape:'htmlall':'UTF-8'}.jpg" alt="{$supplier.name|escape:'htmlall':'UTF-8'}" />
                        {if $PS_DISPLAY_SUPPLIERS}
                            </a>
                        {/if}
                    </div>
                {/foreach}
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
{/if}
