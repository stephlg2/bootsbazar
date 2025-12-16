{**
 * Copyright since 2007 PrestaShop SA and Contributors
 * PrestaShop is an International Registered Trademark & Property of PrestaShop SA
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Open Software License (OSL 3.0)
 * that is bundled with this package in the file LICENSE.md.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/OSL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to https://devdocs.prestashop.com/ for more information.
 *
 * @author    PrestaShop SA and Contributors <contact@prestashop.com>
 * @copyright Since 2007 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/OSL-3.0 Open Software License (OSL 3.0)
 *}

{assign var=reducFind value=false}
{foreach $order_details as $key => $order_detail}
	{if !empty($order_detail.reduction_amount_tax_incl|intval) || !empty($order_detail.reduction_percent|intval)}
		{assign var=reducFind value=true}
	{/if}
{/foreach}

<table class="product" width="100%" cellpadding="4" cellspacing="0">

	<thead>
		<tr>
			<th class="product header small" width="{if $reducFind}50%{else}60%{/if}">{l s='Product / Reference' d='Shop.Pdf' pdf='true'}</th>
			<th class="product header-right small" width="{if $reducFind}10%{else}15%{/if}">{l s='Unit price' d='Shop.Pdf' pdf='true'}<br />{if $tax_excluded_display}{l s='(Tax Excl.)' d='Shop.Pdf' pdf='true'}{else}{l s='(Tax Incl.)' d='Shop.Pdf' pdf='true'}{/if}</th>
			<th class="product header small" width="{if $reducFind}10%{else}15%{/if}">{l s='Qty' d='Shop.Pdf' pdf='true'}</th>
		{if $reducFind }
			<th class="product header small"  style="width: 10%" >{l s='Base price' d='Shop.Pdf' pdf='true'} <br /> {l s='(TTC)' d='Shop.Pdf' pdf='true'}</th>
			<th class="product header small"  style="width: 10%" >{l s='Réduc.' d='Shop.Pdf' pdf='true'} <br /> {l s='(TTC)' d='Shop.Pdf' pdf='true'}</th>
		{/if}
			<th class="product header-right small" width="{if $reducFind}10%{else}%{/if}">{l s='Price' d='Shop.Pdf' pdf='true'}<br />{if $tax_excluded_display}{l s='(Tax Excl.)' d='Shop.Pdf' pdf='true'}{else}{l s='(Tax Incl.)' d='Shop.Pdf' pdf='true'}{/if}</th>
		</tr>
	</thead>

	<tbody>
		{if !isset($order_details) || count($order_details) == 0}
			<tr class="product" colspan="4">
				<td class="product center">
					{l s='No details' d='Shop.Pdf' pdf='true'}
				</td>
			</tr>
		{else}
			{foreach $order_details as $order_detail}
				{cycle values=["color_line_even", "color_line_odd"] assign=bgcolor_class}
				<tr class="product {$bgcolor_class}">
					<td class="product left">
						{$order_detail.product_name}
					</td>
					<td class="product right">
						{if $tax_excluded_display}
							- {displayPrice currency=$order->id_currency price=$order_detail.unit_price_tax_excl}
						{else}
							- {displayPrice currency=$order->id_currency price=$order_detail.unit_price_tax_incl}
						{/if}
					</td>
					<td class="product center">
						{$order_detail.product_quantity}
					</td>
			{if $reducFind }

				{* total avant reduc *}
				<td class="product right">
					- 
					{if !empty($order_detail.reduction_amount_tax_incl) }
						{displayPrice currency=$order->id_currency price=(($order_detail.unit_price_tax_incl + $order_detail.reduction_amount_tax_incl)*$order_detail.product_quantity)}
					{elseif !empty($order_detail.reduction_percent)}
						{displayPrice currency=$order->id_currency price=$order_detail.unit_price_tax_incl * $order_detail.reduction_percent*$order_detail.product_quantity}
					{else}
						--
					{/if}
				</td>
				{* reduc*}
				<td class="product right">
					{if !empty($order_detail.reduction_amount_tax_incl) }
						{displayPrice currency=$order->id_currency price=($order_detail.reduction_amount_tax_incl*$order_detail.product_quantity)}
					{elseif !empty($order_detail.reduction_percent)}
						{$order_detail.reduction_percent}
					{else}
						-
					{/if}
				</td>
			{/if}
					<td class="product right">
						{if $tax_excluded_display}
							- {displayPrice currency=$order->id_currency price=$order_detail.total_price_tax_excl}
						{else}
							- {displayPrice currency=$order->id_currency price=$order_detail.total_price_tax_incl}
						{/if}
					</td>
				</tr>

				{foreach $order_detail.customizedDatas as $customizationPerAddress}
					{foreach $customizationPerAddress as $customizationId => $customization}
						<tr class="customization_data {$bgcolor_class}">
							<td>
								<table style="width: 100%;"><tr><td>
									{foreach $customization.datas as $customization_types}
										{if isset($customization.datas[Product::CUSTOMIZE_TEXTFIELD]) && count($customization.datas[Product::CUSTOMIZE_TEXTFIELD]) > 0}
											{foreach $customization.datas[Product::CUSTOMIZE_TEXTFIELD] as $customization_infos}
												{$customization_infos.name}: {$customization_infos.value}
												{if !$smarty.foreach.custo_foreach.last}<br />{/if}
											{/foreach}
										{/if}

										{if isset($customization.datas[Product::CUSTOMIZE_FILE]) && count($customization.datas[Product::CUSTOMIZE_FILE]) > 0}
											{count($customization.datas[Product::CUSTOMIZE_FILE])} {l s='image(s)' d='Shop.Pdf' pdf='true'}
										{/if}

									{/foreach}
								</td></tr></table>
							</td>

							<td class="center">({$customization.quantity})</td>
							<td class="product"></td>
							<td class="product"></td>
						</tr>
					{/foreach}
				{/foreach}
			{/foreach}
		{/if}

		{if is_array($cart_rules) && count($cart_rules)}
			{foreach $cart_rules as $cart_rule}
				<tr class="discount">
					<td class="white left" colspan="5">{$cart_rule.name}</td>
					<td class="white right">
						{if $tax_excluded_display}
							+ {displayPrice currency=$order->id_currency price=$cart_rule.value_tax_excl}
						{else}
							+ {displayPrice currency=$order->id_currency price=$cart_rule.value}
						{/if}
					</td>
				</tr>
			{/foreach}
		{/if}

	</tbody>

</table>
