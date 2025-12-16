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
{$autocomplete =
['firstname' => 'given-name',
'lastname' => 'family-name',
'email'=>'email',
'password'=>'current-password',
'new_password'=>'new-password',
'postcode'=>'postal-code',
'birthday'=>'bday',
'address1'=>'street-address',
'address2'=>'address-line2',
'id_state'=>'address-level1',
'city'=>'address-level2',
'company'=>'organization'
]}
{if $field.type == 'hidden'}

    {block name='form_field_item_hidden'}
        <input type="hidden" name="{$field.name}" value="{$field.value}">
    {/block}

{else}
    {assign var=uniqId value=10|mt_rand:100000}

    <div class="form-group">
        {if $field.type == 'checkbox' || $field.type == 'radio-buttons'}
            {if $field.type == 'radio-buttons'}
                <div class="label mr-3">{$field.label}</div>
            {/if}
        {else}
            <label class="{if $field.required}required{/if}" for="f-{$field.name}_{$uniqId}">
                {$field.label}
                {block name='form_field_comment'}
                    {if (!$field.required && !in_array($field.type, ['radio-buttons', 'checkbox']))}
                            <small class="text-muted">({l s='Optional' d='Shop.Forms.Labels'})</small>
                    {/if}
                {/block}
            </label>
        {/if}


            {if $field.type === 'select'}

                {block name='form_field_item_select'}
                    <select class="custom-select{if !empty($field.errors)} is-invalid{/if}" name="{$field.name}" id="f-{$field.name}_{$uniqId}"{if $field.required} required{/if}>
                        <option value disabled selected>{l s='-- please choose --' d='Shop.Forms.Labels'}</option>
                        {foreach from=$field.availableValues item="label" key="value"}
                            <option value="{$value}" {if $value eq $field.value} selected {/if}>{$label}</option>
                        {/foreach}
                    </select>
                {/block}

            {elseif $field.type === 'countrySelect'}

                {block name='form_field_item_country'}
                    <select
                            class="custom-select js-country{if !empty($field.errors)} is-invalid{/if}"
                            name="{$field.name}"
                            id="f-{$field.name}_{$uniqId}"
                            {if $field.required}required{/if}
                    >
                        <option value disabled selected>{l s='-- please choose --' d='Shop.Forms.Labels'}</option>
                        {foreach from=$field.availableValues item="label" key="value"}
                            <option value="{$value}" {if $value eq $field.value} selected {/if}>{$label}</option>
                        {/foreach}
                    </select>
                {/block}

            {elseif $field.type === 'radio-buttons'}

                {block name='form_field_item_radio'}
                    {foreach from=$field.availableValues item="label" key="value" name="radiolist"}
                        <div class="custom-control custom-radio custom-control-inline">
                            <input
                                    name="{$field.name}"
                                    type="radio"
                                    value="{$value}"
                                    class="custom-control-input {if !empty($field.errors)} is-invalid{/if}"
                                    id="f-{$field.name}_{$uniqId}-{$smarty.foreach.radiolist.iteration}"
                                    {if $field.required}required{/if}
                                    {if $value eq $field.value} checked {/if}
                            >

                            <label class="custom-control-label" for="f-{$field.name}_{$uniqId}-{$smarty.foreach.radiolist.iteration}">{$label}</label>
                        </div>
                    {/foreach}

                {/block}

            {elseif $field.type === 'checkbox'}

                {block name='form_field_item_checkbox'}
                    <div class="custom-control custom-checkbox">
                        <input name="{$field.name}" type="checkbox" value="1" id="f-{$field.name}_{$uniqId}" class="custom-control-input{if !empty($field.errors)} is-invalid{/if}"{if $field.value} checked="checked"{/if}{if $field.required} required{/if}>
                        <label class="custom-control-label" for="f-{$field.name}_{$uniqId}">{$field.label nofilter}</label>
                    </div>
                {/block}

            {elseif $field.type === 'date' || $field.name === 'birthday'}

                {block name='form_field_item_date'}
                    {assign var=date_or_birthday value=""}
                    {assign var=date_or_birthday_tmp value=""}
                    {if !empty($field.value)}
                        {assign var=date_or_birthday value="/"|explode:$field.value}

                        {if 3 == $date_or_birthday|count}
                            {foreach from="/"|explode:$field.availableValues.placeholder item="typeInt" key="pos"}
                                {if $typeInt == "YYYY"}
                                    {$date_or_birthday_tmp[2] = $date_or_birthday[$pos]}
                                {elseif $typeInt == "MM"}
                                    {$date_or_birthday_tmp[1] = $date_or_birthday[$pos]}
                                {else}
                                    {$date_or_birthday_tmp[0] = $date_or_birthday[$pos]}
                                {/if}
                            {/foreach}
                            {$date_or_birthday = "`$date_or_birthday_tmp[2]`-`$date_or_birthday_tmp[1]`-`$date_or_birthday_tmp[0]`"}
                        {/if}
                    {/if}
                    <input name="{$field.name}" class="form-control{if !empty($field.errors)} is-invalid{/if}" type="date" value="{$date_or_birthday}" placeholder="{if isset($field.availableValues.placeholder)}{$field.availableValues.placeholder}{/if}" id="f-{$field.name}_{$uniqId}"{if isset($autocomplete[$field.name])} autocomplete="{$autocomplete[$field.name]}"{/if}>
                    {if isset($field.availableValues.comment)}
                        <span class="form-text text-muted">
              {$field.availableValues.comment}
            </span>
                    {/if}
                {/block}

            {elseif $field.type === 'birthday'}

                {block name='form_field_item_birthday'}
                    <div class="js-parent-focus">
                        {html_select_date
                        field_order=DMY
                        time={$field.value}
                        field_array={$field.name}
                        prefix=false
                        reverse_years=true
                        field_separator='<br>'
                        day_extra='class="form-control form-control-select"'
                        month_extra='class="form-control form-control-select"'
                        year_extra='class="form-control form-control-select"'
                        day_empty={l s='-- day --' d='Shop.Forms.Labels'}
                        month_empty={l s='-- month --' d='Shop.Forms.Labels'}
                        year_empty={l s='-- year --' d='Shop.Forms.Labels'}
                        start_year={'Y'|date}-100 end_year={'Y'|date}
                        }
                    </div>
                {/block}

            {elseif $field.type === 'password'}

                {block name='form_field_item_password'}
                    <div class="input-group js-parent-focus">
                        <input
                                class="form-control js-child-focus js-visible-password{if !empty($field.errors)} is-invalid{/if}"
                                name="{$field.name}"
                                id="f-{$field.name}_{$uniqId}"
                                type="password"
                                value=""
                                pattern=".{literal}{{/literal}5,{literal}}{/literal}"
                                {if isset($autocomplete[$field.name])} autocomplete="{$autocomplete[$field.name]}"{/if}
                                {if $field.required}required{/if}
                        >
                        <span class="input-group-btn">
              <button
                      class="btn btn-light show-password"
                      type="button"
                      data-target='#f-{$field.name}_{$uniqId}'
                      data-show='<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512"><!--!Font Awesome Pro 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2024 Fonticons, Inc.--><path d="M117.2 136C160.3 96 217.6 64 288 64s127.7 32 170.8 72c43.1 40 71.9 88 85.2 120c-13.3 32-42.1 80-85.2 120c-43.1 40-100.4 72-170.8 72s-127.7-32-170.8-72C74.1 336 45.3 288 32 256c13.3-32 42.1-80 85.2-120zM288 32c-80.8 0-145.5 36.8-192.6 80.6C48.6 156 17.3 208 2.5 243.7c-3.3 7.9-3.3 16.7 0 24.6C17.3 304 48.6 356 95.4 399.4C142.5 443.2 207.2 480 288 480s145.5-36.8 192.6-80.6c46.8-43.5 78.1-95.4 93-131.1c3.3-7.9 3.3-16.7 0-24.6c-14.9-35.7-46.2-87.7-93-131.1C433.5 68.8 368.8 32 288 32zM192 256a96 96 0 1 1 192 0 96 96 0 1 1 -192 0zm224 0a128 128 0 1 0 -256 0 128 128 0 1 0 256 0z"/></svg>'
                      data-hide='<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512"><!--!Font Awesome Pro 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2024 Fonticons, Inc.--><path d="M25.9 3.4C19-2 8.9-.8 3.4 6.1S-.8 23.1 6.1 28.6l608 480c6.9 5.5 17 4.3 22.5-2.6s4.3-17-2.6-22.5L25.9 3.4zM605.5 268.3c3.3-7.9 3.3-16.7 0-24.6c-14.9-35.7-46.2-87.7-93-131.1C465.5 68.8 400.8 32 320 32c-51.2 0-96 14.8-133.9 36.8l27.3 21.5C244.6 74.2 280.2 64 320 64c70.4 0 127.7 32 170.8 72c43.1 40 71.9 88 85.2 120c-9.2 22.1-25.9 52-49.5 81.5l25.1 19.8c25.6-32 43.7-64.4 53.9-89zM88.4 154.7c-25.6 32-43.7 64.4-53.9 89c-3.3 7.9-3.3 16.7 0 24.6c14.9 35.7 46.2 87.7 93 131.1C174.5 443.2 239.2 480 320 480c51.2 0 96-14.8 133.9-36.8l-27.3-21.5C395.4 437.8 359.8 448 320 448c-70.4 0-127.7-32-170.8-72C106.1 336 77.3 288 64 256c9.2-22.1 25.9-52 49.5-81.5L88.4 154.7zM320 384c16.7 0 32.7-3.2 47.4-9.1l-30.9-24.4c-5.4 .9-10.9 1.4-16.5 1.4c-51 0-92.8-39.8-95.8-90.1l-30.9-24.4c-.9 6-1.3 12.2-1.3 18.5c0 70.7 57.3 128 128 128zM448 256c0-70.7-57.3-128-128-128c-16.7 0-32.7 3.2-47.4 9.1l30.9 24.4c5.4-.9 10.9-1.4 16.5-1.4c51 0 92.8 39.8 95.8 90.1l30.9 24.4c.9-6 1.3-12.2 1.3-18.5z"/></svg>'
              >
              <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512"><!--!Font Awesome Pro 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2024 Fonticons, Inc.--><path d="M117.2 136C160.3 96 217.6 64 288 64s127.7 32 170.8 72c43.1 40 71.9 88 85.2 120c-13.3 32-42.1 80-85.2 120c-43.1 40-100.4 72-170.8 72s-127.7-32-170.8-72C74.1 336 45.3 288 32 256c13.3-32 42.1-80 85.2-120zM288 32c-80.8 0-145.5 36.8-192.6 80.6C48.6 156 17.3 208 2.5 243.7c-3.3 7.9-3.3 16.7 0 24.6C17.3 304 48.6 356 95.4 399.4C142.5 443.2 207.2 480 288 480s145.5-36.8 192.6-80.6c46.8-43.5 78.1-95.4 93-131.1c3.3-7.9 3.3-16.7 0-24.6c-14.9-35.7-46.2-87.7-93-131.1C433.5 68.8 368.8 32 288 32zM192 256a96 96 0 1 1 192 0 96 96 0 1 1 -192 0zm224 0a128 128 0 1 0 -256 0 128 128 0 1 0 256 0z"/></svg>
              </button>
            </span>
                        {include file='_partials/form-errors.tpl' errors=$field.errors required=$field.required label=$field.label}

                    </div>
                    <small class="form-text text-muted">{l s='At least 5 characters long' d='Shop.Forms.Help'}</small>

                {/block}

            {elseif $field.type === 'file'}
                <div class="custom-file">
                    <input name="{$field.name}" type="file" class="custom-file-input{if !empty($field.errors)} is-invalid{/if}" id="f-{$field.name}_{$uniqId}"{if $field.required} required{/if}>
                    <label class="custom-file-label" for="f-{$field.name}_{$uniqId}" data-browse="{l s='Choose file' d='Shop.Theme.Actions'}">{l s='Choose file' d='Shop.Theme.Actions'}</label>
                </div>
            {else}

                {block name='form_field_item_other'}
                    <input
                            class="form-control{if !empty($field.errors)} is-invalid{/if}"
                            name="{$field.name}"
                            type="{if $field.name === "phone" || $field.name === "phone_mobile"}tel{else}{$field.type}{/if}"
                            value="{$field.value}"
                            id="f-{$field.name}_{$uniqId}"
                            {if isset($field.availableValues.placeholder)}placeholder="{$field.availableValues.placeholder}"{/if}
                            {if $field.maxLength}maxlength="{$field.maxLength}"{/if}
                            {if $field.required}required{/if}
                            {if isset($autocomplete[$field.name])} autocomplete="{$autocomplete[$field.name]}"{/if}
                    >
                    {if isset($field.availableValues.comment)}
                        <small class="form-text text-muted">
                            {$field.availableValues.comment}
                        </small>
                    {/if}
                {/block}

            {/if}

            {block name='form_field_errors'}
                {if $field.type !== 'password'}
                {include file='_partials/form-errors.tpl' errors=$field.errors required=$field.required label=$field.label}
                {/if}
            {/block}


    </div>

{/if}
