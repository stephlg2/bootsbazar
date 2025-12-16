<p>&nbsp;</p>
<table id="addresses-tab" cellspacing="0" cellpadding="0">
	<tr>
		<td style="width: 50%"></td>
		<td style="width: 50%">
			{if $delivery_address}
				<span style="font-weight: bold;">{l s='Destinataire' pdf='true'}</span><br/>
				<span>{l s='RAUTUREAU APPLE SHOES' pdf='true'}</span>
				{if isset($order_invoice)}
					<div>{$order_invoice->shop_address}</div>
					<span>{l s='N° TVA ' pdf='true'}  {$NTVA}</span>
					<br />
					<span>{l s='N° EORI ' pdf='true'} {$NEORI}</span>
				{/if}
			{/if}
		</td>
	</tr>
</table>