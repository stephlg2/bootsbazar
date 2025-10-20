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
{extends file='customer/page.tpl'}

{block name='pageWrapperClass'}{/block}
{block name='pageHeaderClass'}{/block}
{block name='pageContentClass'}{/block}
{block name='pageFooterClass'}{/block}

{block name='page_title'}
  {l s='Your account' d='Shop.Theme.Customeraccount'}
{/block}

{block name='page_content'}
  <div class="row account-links">

      <a class="col-lg-4 col-md-6 col-sm-6 col-12" id="identity-link" href="{$urls.pages.identity}">
        <span class="link-item">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--!Font Awesome Free 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path d="M406.5 399.6C387.4 352.9 341.5 320 288 320l-64 0c-53.5 0-99.4 32.9-118.5 79.6C69.9 362.2 48 311.7 48 256C48 141.1 141.1 48 256 48s208 93.1 208 208c0 55.7-21.9 106.2-57.5 143.6zm-40.1 32.7C334.4 452.4 296.6 464 256 464s-78.4-11.6-110.5-31.7c7.3-36.7 39.7-64.3 78.5-64.3l64 0c38.8 0 71.2 27.6 78.5 64.3zM256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zm0-272a40 40 0 1 1 0-80 40 40 0 1 1 0 80zm-88-40a88 88 0 1 0 176 0 88 88 0 1 0 -176 0z"/></svg>
          {l s='Information' d='Shop.Theme.Customeraccount'}
        </span>
      </a>

      {if $customer.addresses|count}
        <a class="col-lg-4 col-md-6 col-sm-6 col-12" id="addresses-link" href="{$urls.pages.addresses}">
          <span class="link-item">
          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--!Font Awesome Pro 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2024 Fonticons, Inc.--><path d="M464 256A208 208 0 1 0 48 256a208 208 0 1 0 416 0zM0 256a256 256 0 1 1 512 0A256 256 0 1 1 0 256zm358.2-73.3l-84 196c-3.5 8.1-11.4 13.3-20.2 13.3c-1.4 0-2.9-.1-4.4-.4C239.4 389.5 232 380.4 232 370l0-90-90 0c-10.4 0-19.5-7.4-21.5-17.6c-2.1-10.2 3.3-20.5 12.9-24.6l196-84c8.5-3.5 18-1.7 24.2 4.7c6.4 6.3 8.2 15.9 4.7 24.2z"/></svg>
            {l s='Addresses' d='Shop.Theme.Customeraccount'}
          </span>
        </a>
      {else}
        <a class="col-lg-4 col-md-6 col-sm-6 col-12" id="address-link" href="{$urls.pages.address}">
          <span class="link-item">
          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--!Font Awesome Pro 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2024 Fonticons, Inc.--><path d="M464 256A208 208 0 1 0 48 256a208 208 0 1 0 416 0zM0 256a256 256 0 1 1 512 0A256 256 0 1 1 0 256zm358.2-73.3l-84 196c-3.5 8.1-11.4 13.3-20.2 13.3c-1.4 0-2.9-.1-4.4-.4C239.4 389.5 232 380.4 232 370l0-90-90 0c-10.4 0-19.5-7.4-21.5-17.6c-2.1-10.2 3.3-20.5 12.9-24.6l196-84c8.5-3.5 18-1.7 24.2 4.7c6.4 6.3 8.2 15.9 4.7 24.2z"/></svg>
            {l s='Add first address' d='Shop.Theme.Customeraccount'}
          </span>
        </a>
      {/if}

      {if !$configuration.is_catalog}
        <a class="col-lg-4 col-md-6 col-sm-6 col-12" id="history-link" href="{$urls.pages.history}">
          <span class="link-item">
          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--!Font Awesome Pro 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2024 Fonticons, Inc.--><path d="M48 106.7L48 56c0-13.3-10.7-24-24-24S0 42.7 0 56L0 168c0 13.3 10.7 24 24 24l112 0c13.3 0 24-10.7 24-24s-10.7-24-24-24l-55.3 0c37-57.8 101.7-96 175.3-96c114.9 0 208 93.1 208 208s-93.1 208-208 208c-42.5 0-81.9-12.7-114.7-34.5c-11-7.3-25.9-4.3-33.3 6.7s-4.3 25.9 6.7 33.3C155.2 496.4 203.8 512 256 512c141.4 0 256-114.6 256-256S397.4 0 256 0C170.3 0 94.4 42.1 48 106.7zM256 128c-13.3 0-24 10.7-24 24l0 104c0 6.4 2.5 12.5 7 17l72 72c9.4 9.4 24.6 9.4 33.9 0s9.4-24.6 0-33.9l-65-65 0-94.1c0-13.3-10.7-24-24-24z"/></svg>
            {l s='Order history and details' d='Shop.Theme.Customeraccount'}
          </span>
        </a>
      {/if}

      {if !$configuration.is_catalog}
        <a class="col-lg-4 col-md-6 col-sm-6 col-12" id="order-slips-link" href="{$urls.pages.order_slip}">
          <span class="link-item">
          <svg style="width: 24px;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512"><!--!Font Awesome Pro 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2024 Fonticons, Inc.--><path d="M39.6 5.8C32.5-.3 22.5-1.7 14 2.2S0 14.6 0 24L0 488c0 9.4 5.5 17.9 14 21.8s18.5 2.5 25.6-3.6L80 471.6l40.4 34.6c9 7.7 22.3 7.7 31.2 0L192 471.6l40.4 34.6c9 7.7 22.3 7.7 31.2 0L304 471.6l40.4 34.6c7.1 6.1 17.1 7.5 25.6 3.6s14-12.4 14-21.8l0-464c0-9.4-5.5-17.9-14-21.8s-18.5-2.5-25.6 3.6L304 40.4 263.6 5.8c-9-7.7-22.3-7.7-31.2 0L192 40.4 151.6 5.8c-9-7.7-22.3-7.7-31.2 0L80 40.4 39.6 5.8zm8.4 430L48 76.2l16.4 14c9 7.7 22.3 7.7 31.2 0L136 55.6l40.4 34.6c9 7.7 22.3 7.7 31.2 0L248 55.6l40.4 34.6c9 7.7 22.3 7.7 31.2 0l16.4-14 0 359.6-16.4-14c-9-7.7-22.3-7.7-31.2 0L248 456.4l-40.4-34.6c-9-7.7-22.3-7.7-31.2 0L136 456.4 95.6 421.8c-9-7.7-22.3-7.7-31.2 0L48 435.8zM120 144c-13.3 0-24 10.7-24 24s10.7 24 24 24l144 0c13.3 0 24-10.7 24-24s-10.7-24-24-24l-144 0zm0 176c-13.3 0-24 10.7-24 24s10.7 24 24 24l144 0c13.3 0 24-10.7 24-24s-10.7-24-24-24l-144 0zM96 256c0 13.3 10.7 24 24 24l144 0c13.3 0 24-10.7 24-24s-10.7-24-24-24l-144 0c-13.3 0-24 10.7-24 24z"/></svg>
            {l s='Credit slips' d='Shop.Theme.Customeraccount'}
          </span>
        </a>
      {/if}

      {if $configuration.voucher_enabled && !$configuration.is_catalog}
        <a class="col-lg-4 col-md-6 col-sm-6 col-12" id="discounts-link" href="{$urls.pages.discount}">
          <span class="link-item">
          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--!Font Awesome Pro 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2024 Fonticons, Inc.--><path d="M200.3 81.5C210.9 61.5 231.9 48 256 48s45.1 13.5 55.7 33.5C317.1 91.7 329 96.6 340 93.2c21.6-6.6 46.1-1.4 63.1 15.7s22.3 41.5 15.7 63.1c-3.4 11 1.5 22.9 11.7 28.2c20 10.6 33.5 31.6 33.5 55.7s-13.5 45.1-33.5 55.7c-10.2 5.4-15.1 17.2-11.7 28.2c6.6 21.6 1.4 46.1-15.7 63.1s-41.5 22.3-63.1 15.7c-11-3.4-22.9 1.5-28.2 11.7c-10.6 20-31.6 33.5-55.7 33.5s-45.1-13.5-55.7-33.5c-5.4-10.2-17.2-15.1-28.2-11.7c-21.6 6.6-46.1 1.4-63.1-15.7S86.6 361.6 93.2 340c3.4-11-1.5-22.9-11.7-28.2C61.5 301.1 48 280.1 48 256s13.5-45.1 33.5-55.7C91.7 194.9 96.6 183 93.2 172c-6.6-21.6-1.4-46.1 15.7-63.1S150.4 86.6 172 93.2c11 3.4 22.9-1.5 28.2-11.7zM256 0c-35.9 0-67.8 17-88.1 43.4c-33-4.3-67.6 6.2-93 31.6s-35.9 60-31.6 93C17 188.2 0 220.1 0 256s17 67.8 43.4 88.1c-4.3 33 6.2 67.6 31.6 93s60 35.9 93 31.6C188.2 495 220.1 512 256 512s67.8-17 88.1-43.4c33 4.3 67.6-6.2 93-31.6s35.9-60 31.6-93C495 323.8 512 291.9 512 256s-17-67.8-43.4-88.1c4.3-33-6.2-67.6-31.6-93s-60-35.9-93-31.6C323.8 17 291.9 0 256 0zM192 224a32 32 0 1 0 0-64 32 32 0 1 0 0 64zm160 96a32 32 0 1 0 -64 0 32 32 0 1 0 64 0zM337 209c9.4-9.4 9.4-24.6 0-33.9s-24.6-9.4-33.9 0L175 303c-9.4 9.4-9.4 24.6 0 33.9s24.6 9.4 33.9 0L337 209z"/></svg>
            {l s='Vouchers' d='Shop.Theme.Customeraccount'}
          </span>
        </a>
      {/if}

      {if $configuration.return_enabled && !$configuration.is_catalog}
        <a class="col-lg-4 col-md-6 col-sm-6 col-12" id="returns-link" href="{$urls.pages.order_follow}">
          <span class="link-item">
          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512"><!--!Font Awesome Pro 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2024 Fonticons, Inc.--><path d="M352 48L128 48c-8.8 0-16 7.2-16 16l0 32 128 0c8.8 0 16 7.2 16 16s-7.2 16-16 16L16 128c-8.8 0-16-7.2-16-16s7.2-16 16-16l48 0 0-32C64 28.7 92.7 0 128 0L352 0c35.3 0 64 28.7 64 64l0 32 42.7 0c14.9 0 29.1 5.9 39.6 16.4l93.3 93.3c10.5 10.5 16.4 24.7 16.4 39.6L608 368l8 0c13.3 0 24 10.7 24 24s-10.7 24-24 24l-40 0c0 53-43 96-96 96s-96-43-96-96l-8 0-24 0-32 0-64 0c0 53-43 96-96 96s-96-43-96-96l0-48 0-80 48 0 0 44.8c14.1-8.2 30.5-12.8 48-12.8c35.5 0 66.6 19.3 83.2 48l76.8 0 32 0c8.8 0 16-7.2 16-16l0-288c0-8.8-7.2-16-16-16zM557.7 239.6l-93.3-93.3c-1.5-1.5-3.5-2.3-5.7-2.3L416 144l0 96 142 0-.2-.2-.2-.2zM208 416a48 48 0 1 0 -96 0 48 48 0 1 0 96 0zm272 48a48 48 0 1 0 0-96 48 48 0 1 0 0 96zM48 160l224 0c8.8 0 16 7.2 16 16s-7.2 16-16 16L48 192c-8.8 0-16-7.2-16-16s7.2-16 16-16zM16 224l224 0c8.8 0 16 7.2 16 16s-7.2 16-16 16L16 256c-8.8 0-16-7.2-16-16s7.2-16 16-16z"/></svg>
            {l s='Merchandise returns' d='Shop.Theme.Customeraccount'}
          </span>
        </a>
      {/if}

      {block name='display_customer_account'}
        {hook h='displayCustomerAccount'}
      {/block}

  </div>
{/block}



{block name='page_footer'}
  {block name='my_account_links'}
    <div class="text-sm-center">
      <a class="deconnexion-compte" href="{$logout_url}" >
        {l s='Sign out' d='Shop.Theme.Actions'}
      </a>
    </div>
  {/block}
{/block}
