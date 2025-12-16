{***************************************************************************************************
*	                                                                                               *
*	Fichier: ras_newsletter.tpl                                                                    *
*	Répertoire: /views/templates/hook/ras_newsletter.tpl                                           *
*	                                                                                               *
*	Projet: RAS Newsletter                                                                         *
*	Version: 1.0.0                                                                                 *
*	Date de création: 26/05/2020 à 12:56:22                                                        *
*	Auteur: Stéphane OUVRARD                                                                       *
*	Société: RAUTUREAU APPLE SHOES                                                                 *
*	                                                                                               *
*	Date de modification: 26/05/2020 à 16:31:58                                                    *
*	Modifié par: Stéphane OUVRARD                                                                  *
*	                                                                                               *
*	Copyright (c) 2020 RAUTUREAU APPLE SHOES                                                       *
*	                                                                                               *
*	CHANGELOG:                                                                                     *
*	Date      	By 	Comments                                                                       *
*	----------	---	-----------------------------------------------------------------------------  *
*	                                                                                               *
***************************************************************************************************}

<!-- Block RAS_Newsletter module-->
<section id="newsletter_block_form">


    <div id="newsletter_block_form_text">

        <p>
            {$paragraph nofilter}</p>
    </div>
    <div id="newsletter_block_form_input">
        <form id="rasnw_subscription_form">
            {if $man + $woman + $children > 1}
                <div class="prefs-gender custom-control custom-checkbox">
                    {if $man}
                        <div class="type-collection"><input id="gender-man" type="checkbox" name="prefs[]" value="homme"
                                                            class="custom-control-input">
                            <label class="custom-control-label"
                                   for="gender-man">{l s='man' mod='ras_newsletter'}</label></div>
                    {/if}
                    {if $woman}
                        <div class="type-collection"><input id="gender-woman" type="checkbox" name="prefs[]"
                                                            value="femme" class="custom-control-input">
                            <label class="custom-control-label"
                                   for="gender-woman">{l s='woman' mod='ras_newsletter'}</label></div>
                    {/if}
                    {if $children}
                        <div><input id="gender-children" type="checkbox" name="prefs[]" value="enfants">
                            <label for="gender-children">{l s='children' mod='ras_newsletter'}</label></div>
                    {/if}
                </div>
            {else}
                {if $man}
                    <input type="hidden" id="prefs" name="prefs[]" value="homme">
                {elseif $woman}
                    <input type="hidden" id="prefs" name="prefs[]" value="femme">
                {else}
                    <input type="hidden" id="prefs" name="prefs[]" value="enfants">
                {/if}
            {/if}
            <input name="email" id="newsletter_input_email" type="text"
                   placeholder="{l s='Enter your e-mail' mod='ras_newsletter'}">
            <button type="submit" id="newsletter_input_button" name="submitNewsletter" class="btn">
                <span class="ok_newsletter">OK</span>
            </button>
        </form>
    </div>

    <div class="col-md-6 col-md-offset-3 alert alert-success newsletter-alert" id="rasnwblock_confirm"
         style="display:none;">
        <p>{l s='Thank you ! Your e-mail address has been successfuly saved.' mod='ras_newsletter'}</p>
    </div>
    <div class="col-md-6 col-md-offset-3 alert alert-warning newsletter-alert" id="rasnwblock_exists"
         style="display:none;">
        <p>{l s='Sorry, this e-mail address already exists in our newsletter mail list.' mod='ras_newsletter'}</p>
    </div>
    <div class="col-md-6 col-md-offset-3 alert alert-warning newsletter-alert" id="rasnwblock_error"
         style="display:none;">
        <p>{l s='Sorry, this e-mail address is not valid.' mod='ras_newsletter'}</p>
    </div>
    <div class="col-md-6 col-md-offset-3 alert alert-warning newsletter-alert" id="rasnwblock_error_select"
         style="display:none;">
        <p>{l s='Sorry, you need choose one or more collections.' mod='ras_newsletter'}</p>
    </div>
    <div id="newsletter_block_form_link" style="display: none;">

        <p>
            {$legal_terms nofilter}
            <a href="{$link->getCMSLink($legalLink)}" target="_blank"> {l s='legal-terms-link' mod='ras_newsletter'}</a>
        </p>

    </div>


</section>