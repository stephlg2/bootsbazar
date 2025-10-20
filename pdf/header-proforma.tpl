<table style="width: 100%;font-size: 14pt; color: #000;">
	<tr>
		<td style="width: 50%">
			<span style="font-weight: bold;">{l s='EXPEDITEUR/SHIPPER' pdf='true'}</span>
			<div>{$delivery_address}</div>
		</td>
		<td style="width: 50%; text-align: right;">
			{if isset($header)}
				<h4 style="font-weight: bold; margin-top: 0px; margin-bottom: 0px; padding-top: 0px; padding-bottom: 0px;">
					{$header|escape:'html':'UTF-8'|upper} </h4>
			{/if}
			<div style="text-align: right;">N°{$title|escape:'html':'UTF-8'} {l s='du' pdf='true'}
				{$date|escape:'html':'UTF-8'}</div>
			<div>{l s='N° de retour '} {$order_return}</div>
		</td>
	</tr>
</table>