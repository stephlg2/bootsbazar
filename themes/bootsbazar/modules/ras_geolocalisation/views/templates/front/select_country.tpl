<div class="d-flex switch-langue-pc">
    <div id="ras_geolocalisation_widget">
        <div class="selecteurlangue">
        <span class="langue-text">
         <span style="display: none;">{l s='Langage : ' mod='ras_geolocalisation'}</span>  {$language.iso_code} 
        </span>
            <span class="text-country" style="display: none;">{l s='Pays d\'expédition' mod='ras_geolocalisation'} : {$current_country.name} <i
                        class="fa fa-angle-down"></i></span>
            <div class="group-geolocalisation">
                <div id="ras_geolocalisation_select_country_box" style="display: none">
                    <div class="language-selector-wrapper">
                        <form action="" method="POST">
                            <div id="change_lang">
                                {hook h='displayGeoloc'}
                            </div>
                            <label for="ras_geolocalisation_select_country">{l s='Pays d\'expédition' mod='ras_geolocalisation'}</label>
                            <select id="ras_geolocalisation_select_country" name="country_target"  class="custom-select form-arrondi">
                                {foreach from=$countries item=country}
                                    <option {if $current_country.id == $country.id_country}selected="selected"{/if}
                                            value="{$country.id_country}">{$country.name}</option>
                                {/foreach}
                            </select>

                            <button class="btn-geolocalisation btn btn-primary btn-lg btn-block">{l s='Enregistrer' mod='ras_geolocalisation'}</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>