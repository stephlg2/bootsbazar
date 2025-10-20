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

<div id="ras_dispo_boutique_block_center" class="ras_dispo_boutique_block modal fade " data-url="{$url}"
    data-idproduct="{$product['id_product']}" data-idproductattribute="{$product['id_product_attribute']}"
    data-translate="{ &quot;horaires&quot;:&quot;{l s="+ d'infos" mod='ras_boutique_interne' }&quot;,&quot;en_stock&quot;:&quot;{l s='En stock' mod='ras_boutique_interne' }&quot;,
     &quot;lundi&quot;:&quot;{l s='Lundi' mod='ras_boutique_interne' }&quot;,&quot;mardi&quot;:&quot;{l s='Mardi' mod='ras_boutique_interne'}&quot;,&quot;mercredi&quot;:&quot;{l s='Mercredi' mod='ras_boutique_interne'}&quot;,
     &quot;jeudi&quot;:&quot;{l s='Jeudi' mod='ras_boutique_interne'}&quot;,&quot;vendredi&quot;:&quot;{l s='Vendredi' mod='ras_boutique_interne'}&quot;,&quot;samedi&quot;:&quot;{l s='Samedi' mod='ras_boutique_interne'}&quot;,
     &quot;dimanche&quot;:&quot;{l s='Dimanche' mod='ras_boutique_interne'}&quot;,&quot;aucun_resultat&quot;:&quot;{l s='Aucun résultat.' mod='ras_boutique_interne' }&quot;}">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="dispo_btq-left modal-header">
                <p class="dispo_btq titre-modal-dispoBtq">
                    {l s='Disponibilité en boutique' mod='ras_boutique_interne'}</p>
                <i class="fa-light fa-xmark close-modal-action"></i>
            </div>
            <div class="product-dispo modal-body">
                <div class="container">
                    <div class="row">

                        <div class="product-image-container layer_cart_img col-lg-2 col-md-2 col-sm- col-2 p-0">
                            <img class="layer_cart_img img-responsive"
                                src="{$product.default_image.bySize.small_default.url}" />
                        </div>

                        <div class="product-info col-lg-10 col-md-10 col-sm-10 col-10">
                            <p class="product-name">{$product->name}</p>
                            <p id="layer_cart_product_attributes">
                                {l s='Taille' mod='ras_boutique_interne'} : <span
                                    id="pointure_produit_popup">{$product.attributes[1].name}</span>
                            </p>
                            <p>
                                {l s='Prix' mod='ras_boutique_interne'} : <span
                                    id="prix_produit_popup">{$product.regular_price}</span></p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-xs-12 col-md-12 cp hidden modal-footer">
                {if $active_search}
                <input id="dispo_btq_ras_Address" class="cp"
                    placeholder="{l s='Rue, ville ou code postal' mod='ras_boutique_interne'}" />
                <span id="dispo_btq_search" class="btn-cp">{l s='Rechercher'}</span>
                {/if}
                {* liste des boutiques *}
                <div id="btq_list_container">
                    <ul>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>