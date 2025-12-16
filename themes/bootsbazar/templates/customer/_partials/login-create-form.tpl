{**
 * 2007-2017 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
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
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2017 PrestaShop SA
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
 {block name='login_form'}

    {block name='login_form_errors'}
        {include file='_partials/form-errors.tpl' errors=$errors['']}
    {/block}
    {if !empty($tunel) && $tunel}
        <h3 class="h2-connexion">{l s='Nouveau sur le site ?' d='Shop.Theme.Actions'}</h3>
        {**<h4 class="p-connexion">{l s='Créez votre compte' d='Shop.Theme.Actions'}</h4> *}
    {/if}
    {if empty($tunel) || !$tunel}
        <form class="needs-validation" id="login-form-create" action="{block name='login_form_actionurl'}{$action}{/block}"
        method="post" novalidate autocomplete="false">
    {/if}
    {block name='login_form_fields'}
        <section class="form-fields">
            {block name='form_fields'}
                {block name='form_field'}
                    <div class="form-group">
                        <label class="required" for="f-email_229">{l s='Merci de renseigner votre email' d='Shop.Theme.Customeraccount'}</label>
                        <input class="form-control" name="email" type="email" value="" id="email_create_customer"
                               required=""
                               autocomplete="email">
                    </div>
                {/block}
            {/block}

        </section>
    {/block}

    {block name='login_form_footer'}
        <footer class="form-footer">
            <input type="hidden" name="submitLogin" value="1">
            {block name='form_buttons'}
                <button class="btn btn-primary form-control-submit" id="submit-login" type="submit"
                        data-link-action="sign-in">
                    {l s='Sign in' d='Shop.Theme.Actions'}
                </button>
            {/block}
        </footer>
    {/block}
    {if empty($tunel) || !$tunel}
        </form>
    {/if}
    <div class="social-connect-panier"></div>
{/block}