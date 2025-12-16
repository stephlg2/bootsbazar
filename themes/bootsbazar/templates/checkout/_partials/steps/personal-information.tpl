{extends file='checkout/_partials/steps/checkout-step.tpl'}

{block name='step_content'}
    {hook h='displayPersonalInformationTop' customer=$customer}

    {if $customer.is_logged && !$customer.is_guest}
        <div class="identite-commande row">
        <p class="identity col-lg-6">
        <span><i class="fa-regular fa-user-check"></i></span>
            {* [1][/1] is for a HTML tag. *}
            {l s='Connected as [1]%firstname% %lastname%[/1].'
            d='Shop.Theme.Customeraccount'
            sprintf=[
            '[1]' => "<a href='{$urls.pages.identity}'>",
            '[/1]' => "</a>",
            '%firstname%' => $customer.firstname,
            '%lastname%' => $customer.lastname
            ]
            }
            
        </p>
        <p class="deconnect-identity col-lg-6">
        <span><i class="fa-regular fa-arrow-right-from-bracket"></i></span>
            {* [1][/1] is for a HTML tag. *}
            {l
            s='Not you? [1]Log out[/1]'
            d='Shop.Theme.Customeraccount'
            sprintf=[
            '[1]' => "<a href='{$urls.actions.logout}'>",
            '[/1]' => "</a>"
            ]
            }
        </p>
        </div>
        {if !isset($empty_cart_on_logout) || $empty_cart_on_logout}
            <p><small>{l s='If you sign out now, your cart will be emptied.' d='Shop.Theme.Checkout'}</small></p>
        {/if}
        <div class="clearfix">
            <form method="GET" action="{$urls.pages.order}">
                <button
                        class="continue btn btn-primary btn-lg"
                        name="controller"
                        type="submit"
                        value="order"
                >
                    {l s='Continue' d='Shop.Theme.Actions'}
                </button>
            </form>

        </div>
    {else}
        <ul class="nav nav-tabs nav-tabs--center my-2 nav-tabs-info" style="display: none;" role="tablist">
            <li class="nav-item">
                <a
                        id="create_customer"
                        class="nav-link {if $show_login_form}active{/if}"
                        data-toggle="tab"
                        href="#checkout-guest-form"
                        role="tab"
                        aria-controls="checkout-guest-form"
                        {if !$show_login_form} aria-selected="true"{/if}
                >
                    {if $guest_allowed}
                        {l s='Order as a guest' d='Shop.Theme.Checkout'}
                    {else}
                        {l s='Create an account' d='Shop.Theme.Customeraccount'}
                    {/if}
                </a>
            </li>

            <li class="nav-item">
                <a id="login_customer"
                   class="nav-link {if !$show_login_form}active{/if}"
                   data-link-action="show-login-form"
                   data-toggle="tab"
                   href="#checkout-login-form"
                   role="tab"
                   aria-controls="checkout-login-form"
                        {if $show_login_form} aria-selected="true"{/if}
                >
                    {l s='Sign in' d='Shop.Theme.Actions'}
                </a>
            </li>
        </ul>
        <div class="tab-content">
            <div class="checkout-form tab-pane active" id="checkout-login-form"
                 role="tabpanel" aria-hidden="true">
                <div class="row">
                    <div id="login_form_payment" class="bloc-connection deja-client col-lg-6 col-sm-12">{render file='checkout/_partials/login-form.tpl' ui=$login_form tunel=true}</div>
                    <div id="login_form_payment_create" class="bloc-connection pas-client col-lg-6 col-sm-12">{render file='checkout/_partials/login-create-form.tpl' ui=$login_form tunel=true}</div>
                </div>
            </div>
            <div class="checkout-form tab-pane" id="checkout-guest-form" role="tabpanel">
                {render file='checkout/_partials/customer-form.tpl' ui=$register_form guest_allowed=$guest_allowed}

            </div>
        </div>
    {/if}
{/block}




