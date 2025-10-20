
<table id="payment-tab" width="100%">
	<tr>
		<td class="payment center small grey bold" width="44%">{l s='Payment Method' d='Shop.Pdf' pdf='true'}</td>
		<td class="payment left white" width="56%">
			<table width="100%" border="0">
				{foreach from=$order_invoice->getOrderPaymentCollection() item=payment}
					<tr>
						<td class="right small">{$payment->payment_method}</td>
						<td class="right small">{displayPrice currency=$payment->id_currency price=$payment->amount}</td>
					</tr>
				{/foreach}
			</table>
		</td>
	</tr>
</table>
<p style="font-size: 12pt; text-align: left;">
{l s='DDP %s' sprintf=['%s' => $addresses['delivery']->city] d="Shop.Pdf" pdf='true'}
</p>

