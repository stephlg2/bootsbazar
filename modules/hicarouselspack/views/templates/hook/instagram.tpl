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

{if isset($instagram_imgs) && !empty($instagram_imgs)}
    <div class="clearfix"></div>
    <div class="block carousels-pack-block {if $psv >= 1.7}featured-products{/if} cp-{$carousel_options['type']|escape:'htmlall':'UTF-8'}">
        {if $carousel_options['show_title']}
            <h2>
                {if $carousel_options['title'] != ''}
                    {$carousel_options['title']|escape:'htmlall':'UTF-8'}
                {/if}
            </h2>
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
            <div class="carousel_content owl-carousel instagram-carousel">
                {foreach from=$instagram_imgs item=value}
                    <div class="hi-carousels-images instagram-imgs {if !$carousel_options['activate_carousel']}on_left{/if}">
                        <a {if $instagram_link_img != 'none'} href="{if $instagram_link_img == 'page'}{$value.link|escape:'htmlall':'UTF-8'}{else}{$value.big_img|escape:'htmlall':'UTF-8'}{/if}"{/if}
                            class="{if $instagram_link_img == 'popup'} instagram-popup{/if}" {if $instagram_link_img == 'page'} target="_blank" {/if} {if $value.big_img != ''} style="background-image: url({$value.big_img})" {/if}>
                            {if $value.big_img|strpos:"video"}
                                <video loop muted autoplay playsinline oncanplay="this.play()" onloadedmetadata="this.muted = true">
                                    <source src="{$value.big_img}" type="video/mp4">
                                </video>
                            {/if}
                            {if $instagram_link_img == 'popup'}
                                <img src="data:image/gif;base64,R0lGODlhAQABAAD/ACwAAAAAAQABAAACADs=">
                            {/if}
                        </a>
                    </div>
                {/foreach}
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
{/if}
