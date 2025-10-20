<div class="_desktop_language_selector">
   
        
            <div class="language-selector-wrapper">
                <span id="language-selector-label">{l s='Langage : ' d='Shop.Theme.Catalog'}</span>
                <select name="language-select"  class="custom-select form-arrondi">
                    {foreach from=$languages item=language}
                        <option value="{url entity='language' id=$language.id_lang}"{if $language.id_lang == $current_language.id_lang} selected="selected"{/if}>
                            {$language.name_simple}</option>
                    {/foreach}
                </select>
            </div>
 

</div>
