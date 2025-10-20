<div class="tab-pane fade{if !$product.description} show active{/if}"
     id="product-details"
     data-product="{$product.embedded_attributes|json_encode}"
     role="tabpanel"
     aria-labelledby="product-details-title"
     tabindex="0"
  >
  <h2 id="product-details-title" class="sr-only">{l s='Product details' d='Shop.Theme.Catalog'}</h2>
  {block name='product_reference'}
    {if isset($product_manufacturer->id)}
      <div class="product-manufacturer">
        {if isset($manufacturer_image_url)}
          <a href="{$product_brand_url}">
            <img src="{$manufacturer_image_url}" class="img img-thumbnail manufacturer-logo" alt="{$product_manufacturer->name}">
          </a>
        {else}
          <label id="product-manufacturer-label" class="label">{l s='Brand' d='Shop.Theme.Catalog'}</label>
          <span aria-labelledby="product-manufacturer-label">
            <a href="{$product_brand_url}">{$product_manufacturer->name}</a>
          </span>
        {/if}
      </div>
    {/if}
    
  {/block}

  {block name='product_quantities'}
    {if $product.show_quantities}
      <div class="product-quantities">
        <label id="product-quantities-label" class="label">{l s='In stock' d='Shop.Theme.Catalog'}</label>
        <span data-stock="{$product.quantity}" data-allow-oosp="{$product.allow_oosp}" aria-labelledby="product-quantities-label">{$product.quantity} {$product.quantity_label}</span>
      </div>
    {/if}
  {/block}

  {block name='product_availability_date'}
    {if $product.availability_date}
      <div class="product-availability-date">
        <label id="product-availability-date-label">{l s='Availability date:' d='Shop.Theme.Catalog'} </label>
        <span aria-labelledby="product-availability-date-label">{$product.availability_date}</span>
      </div>
    {/if}
  {/block}

  {block name='product_out_of_stock'}
    <div class="product-out-of-stock" role="alert">
      {hook h='actionProductOutOfStock' product=$product}
    </div>
  {/block}

  {block name='product_features'}
    {if $product.grouped_features}
      <section class="product-features" role="region" aria-labelledby="product-features-title">
        <h3 id="product-features-title" class="sr-only">{l s='Product features' d='Shop.Theme.Catalog'}</h3>
        <div class="data-sheet">
          {foreach from=$product.grouped_features item=feature}
              {hook h='displayFeatureProduct' feature=$feature}
          {/foreach}
        </div>
      </section>
    {/if}
  {/block}


  

  {block name='product_condition'}
    {if $product.condition}
      <div class="product-condition">
        <label id="product-condition-label" class="label">{l s='Condition' d='Shop.Theme.Catalog'} </label>
        <span aria-labelledby="product-condition-label">{$product.condition.label}</span>
      </div>
    {/if}
  {/block}
</div>
