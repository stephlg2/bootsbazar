{assign var=taux_tva value=(($footer.total_paid_tax_incl / ($footer.total_paid_tax_excl)) -1 ) * 100}
{assign var=totalBrut value=0}
{assign var=totalReduc value=0}
{assign var=totalReducOrderSlip value=0}
{foreach $order_details as $key => $order_detail}

    {if !empty($order_detail.reduction_amount_tax_incl) }
        {$totalBrut = $totalBrut+ (($order_detail.unit_price_tax_incl + $order_detail.reduction_amount_tax_incl)*$order_detail.product_quantity)}
        {$totalReduc = $totalReduc+$order_detail.reduction_amount_tax_incl}
    {elseif !empty($order_detail.reduction_percent)}
        {$totalBrut = $totalBrut+ ($order_detail.unit_price_tax_incl * $order_detail.reduction_percent*$order_detail.product_quantity)}
        {$totalReduc = $totalReduc+
        (($order_detail.unit_price_tax_incl -($order_detail.unit_price_tax_incl * $order_detail.reduction_percent)) * $order_detail.product_quantity )}
    {else}
        {$totalBrut = $totalBrut + ($order_detail.unit_price_tax_incl + $order_detail.reduction_amount_tax_incl)}
    {/if}
{/foreach}


{foreach from=$cart_rules item=cart_rule name="cart_rules_loop"}

    {assign var=generate_name_order_split value="V"|cat:$cart_rule.id_cart_rule|cat:"C"|cat:$order->id_customer|cat:"O"}

    {if !$cart_rule.name|strstr:"Avoir" && !$cart_rule.name|strstr:$generate_name_order_split}
        {$totalReduc=$totalReduc+$cart_rule.value}
    {else}
        {$totalReducOrderSlip=$totalReducOrderSlip+$cart_rule.value}
    {/if}

{/foreach}


<table id="total-tab" width="100%">

    {* Total brut *}
    <tr>
        <td class="grey" width="50%">
            {l s='Total Products' d='Shop.Pdf' pdf='true'}
        </td>
        <td class="white" width="50%">
            {displayPrice currency=$order->id_currency price=$totalBrut}
        </td>
    </tr>
    {* Total reduc *}
    {if $totalReduc > 0}
        <tr>
            <td class="grey" width="50%">
                {l s='Total Réduction' d='Shop.Pdf' pdf='true'}
            </td>
            <td class="white" width="50%">
                - {displayPrice currency=$order->id_currency price=$totalReduc}
            </td>
        </tr>
    {/if}
    {* Total  transporteur  *}
    {if !$order->isVirtual()}
        <tr>
            <td class="grey" width="50%">
                {l s='Shipping Costs' d='Shop.Pdf' pdf='true'}
            </td>
            <td class="white" width="50%">
                {if $footer.shipping_tax_excl > 0}
                    {displayPrice currency=$order->id_currency price=($footer.shipping_taxes+$footer.shipping_tax_excl)}
                {else}
                    {l s='Free Shipping' d='Shop.Pdf' pdf='true'}
                {/if}
            </td>
        </tr>
    {/if}

    {* Total  TTC *}
    <tr>
        <td class="grey" width="50%">
            {l s='Total TTC' d='Shop.Pdf' pdf='true'}
        </td>
        <td class="white" width="50%">
            {displayPrice currency=$order->id_currency price=$footer.total_paid_tax_incl}
        </td>
    </tr>

    {* Total taxe *}
    <tr class="bold">
        <td class="grey">
            {l s='Total (Tax excl.)' d='Shop.Pdf' pdf='true'}
        </td>
        <td class="white">
            {displayPrice currency=$order->id_currency price=$footer.total_paid_tax_excl}
        </td>
    </tr>


    {foreach from=$cart_rules item=cart_rule name="cart_rules_loop"}
        {if $cart_rule.name|strstr:"Avoir" || $cart_rule.name|strstr:$generate_name_order_split}
            <tr>
                <td class="grey">
                    {$cart_rule.name}
                </td>
                <td class="white">
                    {displayPrice currency=$order->id_currency price=$cart_rule.value}
                </td>
            </tr>
        {/if}
    {/foreach}

    {if $footer.total_taxes > 0}
        <tr class="bold">
            <td class="grey">
                {l s='Total Tax' d='Shop.Pdf' pdf='true'} {*<span style="font-size:8px">({$taux_tva|string_format:"%.2f"}  %)</span>*}
            </td>
            <td class="white">
                {displayPrice currency=$order->id_currency price=$footer.total_taxes}
            </td>
        </tr>
    {/if}

    {if $totalReducOrderSlip > 0}

        <tr class="bold">
            <td class="grey">
                {l s='Total order slip' d='Shop.Pdf' pdf='true'} {*<span style="font-size:8px">({$taux_tva|string_format:"%.2f"}  %)</span>*}
            </td>
            <td class="white">
                - {displayPrice currency=$order->id_currency price=$totalReducOrderSlip}
            </td>
        </tr>
    {/if}
    <tr class="bold big">
        <td class="grey">

            ({$currency_name_{$order->id}})
            {l s='Total à régler' d='Shop.Pdf' pdf='true'}
        </td>
        <td class="white">
            {displayPrice currency=$order->id_currency price=$footer.total_paid_tax_incl}
        </td>
    </tr>
</table>
