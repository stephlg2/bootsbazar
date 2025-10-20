<div id="ras_bandeau" style="{if !empty($background)}background-color:{$background};{/if}">
    <div id="ras_bandeau_left">
        {hook h="displayBandeauLeft"}
    </div>
    <div id="ras_bandeau_text" style="{if !empty($color)}color:{$color};{/if}">
        {assign var="texts_explode" value='[__break_line__]'|explode:$texts}
        {foreach $texts_explode as $text}
            <span class="ras-bandeau-text {if $texts_explode|count == 1 }active-ras-bandeau-text-one{elseif $text@first}active-ras-bandeau-text{/if}">
                        {$text nofilter}
                </span>
        {/foreach}
    </div>

    <div id="ras_bandeau_right">
        {hook h="displayBandeauRight"}
    </div>
    {if $close}
        <div id="bandeau_close"><i class="fa-light fa-close"></i></div>
    {/if}
</div>
