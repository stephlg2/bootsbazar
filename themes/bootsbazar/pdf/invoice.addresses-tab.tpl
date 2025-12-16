<table id="addresses-tab" cellspacing="0" cellpadding="0"  style="font-size: 8px">
	<tr>
		<td width="50%">{if $delivery_address}<span class="bold" style="font-size: 14px">{l s='Delivery Address' d='Shop.Pdf' pdf='true'}</span><br/><br/>
				{$delivery_address}
			{/if}
		</td>
		<td width="50%"><span class="bold" style="font-size: 14px">{l s='Billing Address' d='Shop.Pdf' pdf='true'}</span><br/><br/>
				{$invoice_address}
		</td>
	</tr>
</table>
