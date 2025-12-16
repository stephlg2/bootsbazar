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

{if isset($twitter_tweets) && !empty($twitter_tweets)}
    <div class="clearfix"></div>
    <div class="block carousels-pack-block {if $psv >= 1.7}featured-products{/if} cp-{$carousel_options['type']|escape:'htmlall':'UTF-8'}">
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
                {foreach from=$twitter_tweets item=tweet}
                    <div class="{if !$carousel_options['activate_carousel']}on_left{/if}">
                        {if $twitter_profile_image}
                            <div>
                                <a href="https://twitter.com/{$tweet->user->screen_name|escape:'htmlall':'UTF-8'}/status/{$tweet->id_str|escape:'htmlall':'UTF-8'}" target="_blank">
                                    <img src="{$tweet->user->profile_image_url|escape:'htmlall':'UTF-8'}">
                                </a>
                            </div>
                        {/if}
                        {if $twitter_user_name}
                            <strong>{$tweet->user->name|escape:'htmlall':'UTF-8'}</strong>
                            <span>@<b>{$tweet->user->screen_name|escape:'htmlall':'UTF-8'}</b></span>
                        {/if}
                        <p>
                            <a href="https://twitter.com/{$tweet->user->screen_name|escape:'htmlall':'UTF-8'}/status/{$tweet->id_str|escape:'htmlall':'UTF-8'}" target="_blank">
                                <span>{$tweet->text|escape:'htmlall':'UTF-8'}</span>
                            </a>
                        </p>
                    </div>
                {/foreach}
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
{/if}
