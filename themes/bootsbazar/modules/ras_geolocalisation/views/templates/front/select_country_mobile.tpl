<div class="langue-mobile">
    <div id="ras_geolocalisation_widget_mobile">
        <div class="selecteurlangue">
            <div class="group-geolocalisation">
                <div id="ras_geolocalisation_select_country_box_mobile">
                    <div class="language-selector-wrapper">
                        <form action="" method="POST">
                            <div id="change_lang_mobile">
                                {hook h='displayGeoloc'}
                            </div>
                            <label for="ras_geolocalisation_select_country">{l s='Pays d\'expédition' mod='ras_geolocalisation'}</label>
                            <select id="ras_geolocalisation_select_country_mobile" name="country_target" class="custom-select form-arrondi">
                                {foreach from=$countries item=country}
                                    <option {if $current_country.id == $country.id_country}selected="selected"{/if}
                                            value="{$country.id_country}">{$country.name}</option>
                                {/foreach}
                            </select>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>