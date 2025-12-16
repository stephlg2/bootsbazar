{block name='product_cover'}
    <div id="slider_cover">
        {if $display_desktop == 1}
            <div class="swiper">
                <div class="swiper-wrapper">
                    {assign var="videoActive" value=false}
                    {assign var="video360Active" value=false}
                    {assign var="i" value=0}
                    {foreach from=$images item=image key=j}

                        {$video360Active = (!empty($video_360) && $video_360->isActive() && $i == $position_360 )}
                        {if $video360Active }
                            <div class="swiper-slide swiper-slide-video {if $i > 0 } swiper-slide-loading {/if} axeptio-video-consent"
                                 {if $axeptio}data-consent="vimeo"{/if}>
                                <div class="video-cover"></div>
                                {include file ="module:$name_module/views/templates/hook/_partial/player.tpl" videoFind=$video_360 }
                            </div>
                            {$i = $i+1}
                        {/if}
                        {$videoActive = (!empty($video) && $video->isActive() && $i == $position_video )}
                        {if $videoActive }
                            <div class="swiper-slide swiper-slide-video {if $i > 0 } swiper-slide-loading {/if} axeptio-video-consent"
                                 {if $axeptio}data-consent="vimeo"{/if}>
                                <div class="video-cover"></div>
                                {include file ="module:$name_module/views/templates/hook/_partial/player.tpl" videoFind=$video }
                            </div>
                            {$i = $i+1}
                        {/if}
                        <div class="swiper-slide {if $i > 0 } swiper-slide-loading {/if}">
                            <div class="background-image-zoom" data-image="//{$images_max[$j]}">
                                <img width="1000" height="1000" src="//{$image}" width="1000" height="1000"
                                     alt="{l s='image' mod='ras_slider_product'}">
                                <div class="block-cover"></div>
                            </div>
                        </div>
                        {$i = $i+1}
                    {/foreach}
                </div>
            </div>
        {else}
            <div class="swiper-static">
                <div class="swiper-wrapper">
                    {assign var="videoActive" value=false}
                    {assign var="video360Active" value=false}
                    {assign var="i" value=0}

                    {if !empty($third3) && $third3->isActive() }
                        {$position_360 = $position_360 +1}
                        {$position_video = $position_video +1}
                    {/if}
                    {foreach from=$images item=image key=j}

                        {$video360Active =  (!empty($video_360) && $video_360->isActive() && $i == $position_360 )}
                        {if $video360Active }
                            <div class="swiper-slide-static axeptio-video-consent" {if $axeptio}data-consent="vimeo"{/if}>
                                <div class="video-cover"></div>
                                {include file ="module:$name_module/views/templates/hook/_partial/player.tpl" videoFind=$video_360}
                            </div>
                            {$i = $i+1}
                        {/if}
                        {$videoActive = (!empty($video) && $video->isActive() && $i == $position_video )}
                        {if $videoActive }
                            <div class="swiper-slide-static axeptio-video-consent" {if $axeptio}data-consent="vimeo"{/if}>
                                <div class="video-cover"></div>
                                {include file ="module:$name_module/views/templates/hook/_partial/player.tpl" videoFind=$video}
                            </div>
                            {$i = $i+1}
                        {/if}

                        {$thirdDActive = (!empty($third3) && $third3->isActive() && $i == $position_3d )}
                        {if $thirdDActive }
                            <div id="fibbl_gallery" class="swiper-slide-static axeptio-video-consent background-image-zoom" >
                                <span id="fibbl_gallery_close_ar" style="display: none"><i class="fa-light fa-close"></i></span>
                                <img src="//{$image}" alt="{l s='image' mod='ras_slider_product'}" id="fibbl_gallery_image_default">
                                <fibbl-layer data-product-id="{$third3->getUrl()}"  >
                                    <button data-element="fibbl-model-viewer" data-controls="none" data-initial-zoom="1.25" class="fibbl-model-viewer-click-3d fibbl-active" style="display: none"> 3D</button>
                                    <button data-element="fibbl-qr-code"  data-type="vto" class="fibbl-model-viewer-click-ar" style="display: none"> ar</button>
                                </fibbl-layer>
                            </div>
                            {$i = $i+1}
                        {else}
                            <div class="swiper-slide-static img-zoom-static">
                                <div class="background-image-zoom" data-image="//{$images_max[$j]}">
                                    <img width="1000" height="1000" src="//{$image}" alt="{l s='image' mod='ras_slider_product'}">
                                    <div class="block-cover"></div>
                                </div>
                            </div>
                            {$i = $i+1}
                        {/if}
                    {/foreach}
                </div>
            </div>
        {/if}
        {if $display_mobile == 1}
            <div class="swiper-mobile">

                {$thirdDActive = (!empty($third3) && $third3->isActive())}
                {if $thirdDActive }
                    <div id="fibbl_gallery_mobile" >
                        {foreach from=$images item=image name=foo }
                            {if $smarty.foreach.foo.first}
                                <img src="//{$image}" alt="{l s='image' mod='ras_slider_product'}"
                                     id="fibbl_gallery_image_default_mobile">
                                {break}
                            {/if}
                        {/foreach}
                        <fibbl-layer data-product-id="{$third3->getUrl()}" >
                            <button data-element="fibbl-model-viewer" data-controls="none" class="fibbl-model-viewer-click-3d-mobile fibbl-active" style="display: none"> 3D</button>
                            <button data-element="fibbl-qr-code" data-type="ar" class="fibbl-model-viewer-click-ar-mobile" style="display: none"> ar</button>
                        </fibbl-layer>
                    </div>
                    <div id="fibbl_mobile_type_display_content">
                        <label for="fibbl_mobile_type_display" >
                            <span class="display-selector-left" >{l s='3D' mod='ras_listing_product'}</span>
                            <span class="display-selector-switch">
                        <input id="fibbl_mobile_type_display" name="fibbl_mobile_type_display"
                               class="option-input-data" type="checkbox">
                        <span class="display-selector">
                            <span class="display-selector-ball"></span>
                        </span>
                    </span>
                            <span class="display-selector-right">{l s='Images' mod='ras_listing_product'}</span>
                        </label>
                    </div>
                {/if}
                <div class="swiper-wrapper" {if $thirdDActive } style="display:none;" {/if}>
                    {assign var="videoActive" value=false}
                    {assign var="video360Active" value=false}
                    {assign var="i" value=0}

                    {foreach from=$images item=image }

                        {$video360Active =   (!empty($video_360) && $video_360->isActive() && $i == $position_360 )}
                        {if $video360Active }
                            <div class="swiper-slide swiper-slide-video axeptio-video-consent"
                                 {if $axeptio}data-consent="vimeo"{/if}>
                                <div class="video-cover"></div>
                                {include file ="module:$name_module/views/templates/hook/_partial/player.tpl"  videoFind=$video_360}
                            </div>
                            {$i = $i+1}
                        {/if}
                        {$videoActive =  (!empty($video) && $video->isActive() && $i == $position_video )}
                        {if $videoActive }
                            <div class="swiper-slide swiper-slide-video axeptio-video-consent"
                                 {if $axeptio}data-consent="vimeo"{/if}>
                                <div class="video-cover"></div>
                                {include file ="module:$name_module/views/templates/hook/_partial/player.tpl"  videoFind=$video}
                            </div>
                            {$i = $i+1}
                        {/if}
                        <div class="swiper-slide">
                            <img src="//{$image}" alt="{l s='image' mod='ras_slider_product'}">
                        </div>
                        {$i = $i+1}
                    {/foreach}
                </div>
            </div>
        {/if}
    </div>

    <script src="https://cdn.fibbl.com/fibbl-layer.js" class="script-fibbl-loading"
            type="module"
            data-locale="{$language['locale']}"
            data-fibbl-config
            data-analytics-type="google"
            data-analytics-id="{$analytics}"
    ></script>
{/block}