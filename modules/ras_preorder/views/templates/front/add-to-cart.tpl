{if $preorder}


    <button class="btn btn-primary add-to-cart btn-lg btn-block btn-add-to-cart js-add-to-cart"
        data-button-action="add-to-cart" type="submit">
        <span class="btn-add-to-cart__spinner" role="status" aria-hidden="true"></span>
        {l s='Preorder' mod='ras_preorder'}
    </button>
    <div class="delivery-preorder-info">
        <span class="delivery-preorder-info-icon"></span>
        <span class="delivery-preorder-info-text">{$deliveryInfo}</span>
    </div>
     <div class="bar_ou text-center"><span>{l s='Or' mod='ras_preorder'}</span></div>
{else}
    <button class="btn btn-primary add-to-cart btn-lg btn-block btn-add-to-cart js-add-to-cart"
        data-button-action="add-to-cart" type="submit" disabled>
        <span class="btn-add-to-cart__spinner" role="status" aria-hidden="true"></span>
        {l s='Unavailable'  mod='ras_preorder'}
    </button>
{/if}