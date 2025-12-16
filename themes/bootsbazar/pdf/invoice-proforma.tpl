{$style_tab}

<table width="100%" id="body" border="0" cellpadding="0" cellspacing="0" style="margin:0;">
	<!-- Invoicing -->
	<tr>
		<td colspan="12">

			{$addresses_tab}

		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<!-- Product -->
	<tr>
		<td colspan="12">
			<br />
			{$product_tab}

		</td>
	</tr>

	<tr>
		<td colspan="12" height="10">&nbsp;</td>
	</tr>

	<!-- TVA -->
	<tr>
		<!-- Code TVA -->
		<td colspan="6" class="left">
			<br />
		</td>
		<td colspan="1">&nbsp;</td>
		<!-- Calcule TVA -->
		<td colspan="5" rowspan="5" class="right">

			{$total_tab}

		</td>
	</tr>
	<tr>
		<td colspan="12" height="100">&nbsp;</td>
	</tr>
	<tr>
		<table style="width: 100%;">
			<tr>
				<td style="text-align: center; font-size: 12pt; color: #444; width:100%;">
					{$douanes_text|escape:'html':'UTF-8'|replace:'--':'<br/>'}
				</td>

			</tr>
			<br />
			<br />
			<br />
			<br />
			<br />
			<tr>
				<td style="text-align: left; font-size: 12pt; color: #444; width:100%;">
					{l s='EXW'} {$city}
				</td>
			</tr>
		</table>
	</tr>

	<tr>
		<td colspan="12" height="10">&nbsp;</td>
	</tr>

	<tr>
		<td colspan="12" height="10">&nbsp;</td>
	</tr>

	<!-- Hook -->
	{if isset($HOOK_DISPLAY_PDF)}
		<tr>
			<td colspan="12" height="30">{$HOOK_DISPLAY_PDF}</td>
		</tr>
	{/if}

</table>