{***************************************************************************************************
*	                                                                                               *
*	Fichier: ras_dispo_btq_popup.tpl                                                               *
*	Répertoire: /views/templates/hook/ras_dispo_btq_popup.tpl                                      *
*	                                                                                               *
*	Projet: RAS DISPONIBILITE EN BOUTIQUES                                                         *
*	Version: 1.0.0                                                                                 *
*	Date de création: 24/08/2020 à 00:00:00                                                        *
*	Auteur: Nicolas MERLET                                                                         *
*	Société: RAUTUREAU APPLE SHOES                                                                 *
*	                                                                                               *
*	Date de modification: 00/00/2020 à 00:00:00                                                    *
*	Modifié par:                                                                                   *
*	                                                                                               *
*	Copyright (c) 2020 RAUTUREAU APPLE SHOES                                                       *
*	                                                                                               *
*	CHANGELOG:                                                                                     *
*	Date      	By 	Comments                                                                       *
*	----------	---	-----------------------------------------------------------------------------  *
*	                                                                                               *
***************************************************************************************************}

<!-- RAS_DISPO_BOUTIQUES module popup -->


<div class="dispo_btq">
    <div id="display_dispo_btq" class="buttons_bottom_block no-print">
    
        <button type="button" name="display_dispo_btq" class="dispo_btq"><i class="fa-regular fa-store"></i>
            <span>
                {if $content_only && (isset($product->customization_required) && $product->customization_required)}
                    {l s='Customize' mod='ras_boutique_interne' }
                {else}
                     {l s='Disponible en boutique' mod='ras_boutique_interne'}
                {/if}</span>
        </button>
    </div>
</div>

