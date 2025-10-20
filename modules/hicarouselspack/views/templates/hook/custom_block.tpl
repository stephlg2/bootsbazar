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

<div class="clearfix"></div>
<div class="block carousels-pack-block {if $psv >= 1.7}featured-products{/if} {$carousel_options['type']|escape:'htmlall':'UTF-8'}">
    {if isset($carousel_options) && !empty($carousel_options)}
        {if $carousel_options['show_title']}
            <h2>
                {if $carousel_options['title'] != ''}
                    {$carousel_options['title']|escape:'htmlall':'UTF-8'}
                {/if}
            </h2>
        {/if}
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
        data-carousel-prev = "<img src='{$uploads_img_url|escape:'htmlall':'UTF-8'}views/img/arrow_left_2.png'>"
        data-carousel-next = "<img src='{$uploads_img_url|escape:'htmlall':'UTF-8'}views/img/arrow_right_2.png'>">
        <div class="carousel_content owl-carousel custom_block_content">
            {foreach from=$get_custom_block item=block}
                <div class="hi-carousels-custom-block clearfix {if !$carousel_options['activate_carousel']}on_left{/if}">
                    {if $block.logo != ''}
                        <div class="image_block">
                            <img src="{$uploads_img_url|escape:'htmlall':'UTF-8'}views/img/upload/{$block.logo|escape:'htmlall':'UTF-8'}">
                        </div>
                    {/if}
                    <div class="info_block">
                        <h5>{$block.title|escape:'htmlall':'UTF-8'}</h5>
                        <p>{$block.description|escape:'htmlall':'UTF-8'}</p>
                    </div>
                </div>
            {/foreach}
        </div>
        <div class="clearfix"></div>
    </div>
</div>
