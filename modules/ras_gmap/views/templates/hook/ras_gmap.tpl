{*
* 2007-2018 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
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
*  @author Arnaud Drieux <contact@awb-dsgn.com>
*  @copyright  2007-2021 awb-dsgn.com
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}
<div class="container-fluid">
    <div class="row">

    <div class="col-lg-9  col-md-12 col-sm-12 p-0 m-0 col-map">
    {if !$display_full}
        <div id="display_before">
            <div>
                {l s='Activate geolocation or do a search' mod='ras_gmap'}
            </div>
        </div>
    {/if}
    {if $axeptio}
        <div onclick="window.axeptioSDK.requestConsent('gmaps')" style="display: none"
             id="storemap_disabled">{l s='Enable cookies' mod='ras_gmap'}</div>{/if}

    <div id="storemap" class="boutiques-map" {if $axeptio}data-hide-on-vendor-consent="gmaps"
         onclick="window.axeptioSDK.requestConsent('gmaps')"{/if}></div>
</div>


        <div class="col-lg-3 col-md-12 col-sm-12 col-list-store">
         
            <div id="map-style">

                {if $apiKey}
                    <div id="map_location_search" class="card">
                        <div class="form-fields">
                            <div class="form-group form-search-map">
                                <div class="col-search-map col-search-map-address">
                                    <label for="location_input" class="form-control-label"></label>
                                    <input type="text" name="location_input"
                                           placeholder="{l s='Your search' mod='ras_gmap'}" id="location_input"
                                           class="form-control">
                                </div>

                                {if !$display_full}
                                    <div class="col-search-map col-search-map-radius"><label for="radius_input"
                                                                       class="form-control-label dans-un-rayon"></label>
                                        <select name="radius_input" id="radius_input" class="form-control">
                                            <option value="" selected disabled
                                                    hidden>{l s='Select a radius' mod='ras_gmap'}</option>
                                            <option value="5">5 Km</option>
                                            <option value="10">10 Km</option>
                                            <option value="15">15 Km</option>
                                            <option selected="selected" value="25">25 Km</option>
                                        </select>
                                    </div>
                                {else}
                                    <select name="radius_input" id="radius_input" class="form-control"
                                            style="display:none;">
                                        <option value="15">15 Km</option>
                                    </select>
                                {/if}
                                <div class="bouton-search-map">
                                    <button id="ras_gmap_search"
                                            class="btn bouton-blanc">{l s='Search' mod='ras_gmap'}</button>
                                </div>
                            </div>
                        </div>
                    </div>
                {else}
                    <div class="alert-warning">{l s='No api key registered' mod='ras_gmap'}</div>
                {/if}

                <div id="list_store">
                    <div class="prototype" style="display: none;">
                        <div class="store-block">
                            <div class="store-name">

                            </div>
                            <div class="store-address">

                            </div>
                            <div class="store-distance">

                            </div>
                            <div class="store-hours">

                            </div>
                            
                            <span class="icon-bloc-store">
                                {if empty($icon)}
                                    <i class="fa-sharp fa-regular fa-sign-post default-marker"></i>
                                {else}
                                    <img class="marker-gmap store-marker" src="{$icon}">
                                    <img class="marker-gmap retail-marker" src="{$icon_retail}">
                                {/if}
                            </span>

                            <div class="store-trip">
                                <a target="_blank" href="">{l s='Trip' mod='ras_gmap'}</a>
                            </div>

                        </div>
                    </div>

                   
                </div>
            </div>
        </div>
       
    </div>
</div>


{hook h="rasHookTplEdit" id="boutiques-sous-Map"}
