<div class="variant-links" >
    {foreach from=$variants item=variant name="variantslist"}
        {if $smarty.foreach.variantslist.iteration}
            <a href="{$variant.url}"
               class="{$variant.type} mx-1
                {if isset($product['main_variants_status'][$variant.id_product_attribute]) && !$product['main_variants_status'][$variant.id_product_attribute]}out-of-stock{/if} "
               title="{$variant.name}"
               style="
               {if $variant.name|lower == "unit"}display: none;{/if}
               {if $variant.html_color_code} background-color: {$variant.html_color_code}{/if}
               {if $variant.texture} background-image: url({$variant.texture}) {/if}
                       ">
                <p>{$variant.name}</p></a>
        {/if}
    {/foreach}
</div>
