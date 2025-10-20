{*
* 2007-2018 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author Arnaud Drieux <contact@awb-dsgn.com>
*  @copyright  2007-2021 awb-dsgn.com
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

<div class="store_infos">
    <p class="ville-titre-map">{$store->name}</p>
    {if $store->email != ''}
      
    {/if}
    <p class="adresse-store">{$store->address1}
        {if $store->address2 != ''}<br>{$store->address2}{/if}<br>
        {if $store->postcode != ''} {$store->postcode}{/if} {$store->city} - 
       {$store->country}{if $store->state != ''}, {$store->state}{/if}
        <br>
        {if $store->phone != '' || $store->fax != '' || $store->email != ''}

            {if $store->phone != ''}{l s='Phone:' mod='ras_gmap'} {$store->phone}{/if}
            {if $store->fax != ''}<br>{l s='Fax:' mod='ras_gmap'} {$store->fax}{/if}
            {if $store->email != ''}<br>{l s='Email:' mod='ras_gmap'} <a
                href="mailto:{$store->email}">{$store->email}</a>{/if}
        </p>
    {/if}
    <p class="note-store">
    {if $store->note != ''}
        {l s='Note:' mod='ras_gmap'}</p>
        <p class="contenu-note-store">{$store->note}</p>
    {/if}
    {if $store->hours}
        <p><b>{l s='Our hours' mod='ras_gmap'}</b></p>
        <ul class="store_hours">
            {foreach from=$store->hours key=day item=hour}
                <li><span class="day">{$day} :</span> {$hour}</li>
            {/foreach}
        </ul>
    {/if}
    <a class="lien-itineraire-map" target="_blank" href="{$store->trip}"><i class="fa-sharp fa-regular fa-sign-post default-marker"></i> {l s='Trip' mod='ras_gmap'}</a>
</div>