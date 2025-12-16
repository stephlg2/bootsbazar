{extends file='page.tpl'}
{block name='pageWrapperClass'}{/block}
{block name='page_content_container' prepend}
    <section id="content-hook_order_confirmation" class="card mb-3 text-white bg-success">
    <div class="container">
      <div class="card-body">


            {block name='order_confirmation_header'}
              <h3 class="h1 card-title">
               <div class="check-success"> <svg width="100" height="100" class="checkmark" xmlns="https://www.w3.org/2000/svg" viewBox="0 0 52 52">
    <g stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="10">
      <circle class="checkmark__circle" cx="26" cy="26" r="26" fill="none"/>
      <path class="checkmark__check" fill="none" d="M14.1 27.2l7.1 7.2 16.7-16.8"/>
    </g>
  </svg></div>
  
  {l s='Your order is confirmed' d='Shop.Theme.Checkout'}
              </h3>
            {/block}

            <p>
              {l s='An email has been sent to your mail address %email%.' d='Shop.Theme.Checkout' sprintf=['%email%' => $customer.email]}
            <!--[  {if $order.details.invoice_url}
                {* [1][/1] is for a HTML tag. *}
                {l
                  s='You can also [1]download your invoice[/1]'
                  d='Shop.Theme.Checkout'
                  sprintf=[
                    '[1]' => "<a href='{$order.details.invoice_url}'>",
                    '[/1]' => "</a>"
                  ]
                }
              {/if}-->
            </p>

            {block name='hook_order_confirmation'}
              {$HOOK_ORDER_CONFIRMATION nofilter}
            {/block}


      </div>
      </div>
    </section>
{/block}

{block name='page_content_container'}
   <section id="content" class="page-content page-order-confirmation card mb-3 container">
      {block name='order_confirmation_table'}
          <div>
              {hook h='displayOrderSplit' order=$order.details}
          </div>
      {/block}
        {block name='order_details'}
          <div id="order-details" class="mt-4">
            <h3 class="h3 card-title">{l s='Order details' d='Shop.Theme.Checkout'}:</h3>
            <ul>
              <li>{l s='Order reference: %reference%' d='Shop.Theme.Checkout' sprintf=['%reference%' => $order.details.reference]}</li>
              <li>{l s='Payment method: %method%' d='Shop.Theme.Checkout' sprintf=['%method%' => $order.details.payment]}</li>
              {if !$order.details.is_virtual}
                <li>
                  {l s='Shipping method: %method%' d='Shop.Theme.Checkout' sprintf=['%method%' => $order.carrier.name]}<br>
                  <em>{$order.carrier.delay}</em>
                </li>
              {/if}
            </ul>
          </div>
        {/block}
  </section>


  {block name='hook_payment_return'}
    {if ! empty($HOOK_PAYMENT_RETURN)}
    <section id="content-hook_payment_return" class="card mb-3 definition-list container">
      <div class="container">

          <div class="col-md-12">
            {$HOOK_PAYMENT_RETURN nofilter}
          </div>
    
      </div>
    </section>
    {/if}
  {/block}

  {block name='customer_registration_form'}
    {if $customer.is_guest}
    <div class="container">
      <div id="registration-form" class="card mb-3">
        <div class="card-body">
          <h4 class="h4">{l s='Save time on your next order, sign up now' d='Shop.Theme.Checkout'}</h4>
          {render file='customer/_partials/customer-form.tpl' ui=$register_form}
        </div>
      </div>
      </div>
    {/if}
  {/block}

  {block name='hook_order_confirmation_1'}
    {hook h='displayOrderConfirmation1'}
  {/block}


 <!--[
  {block name='hook_order_confirmation_2'}
    <section id="content-hook-order-confirmation-footer">
      {hook h='displayOrderConfirmation2'}
    </section>
  {/block}

{/block} -->
