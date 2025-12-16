{* 
* @Module Name: AP Page Builder
* @Website: apollotheme.com - prestashop template provider
* @author Apollotheme <apollotheme@gmail.com>
* @copyright Apollotheme
* @description: ApPageBuilder is module help you can build content for your shop
*}


{block name='product_accordion'}


      
   
       
   <div class="products-accordion" id="accordion" role="tablist" aria-multiselectable="true">
        
       <div class="card" id="description" role="presentation">
         <div class="card-header" role="tab" id="headingdescription">
           <h3 class="sr-only" id="title-description">{l s='Description' d='Shop.Theme.Accessibility'}</h3>
             <p class="titre_accordeon">
               <a class="collapsed"  data-toggle="collapse" data-parent="#accordion" href="#collapsedescription" aria-expanded="true" aria-controls="collapsedescription" tabindex="0" aria-labelledby="title-description">
                 {l s='Description' d='Shop.Theme.Catalog'} <span class="arrow-desc">
                 </span>
               </a>
            </p>
         </div> 
         <div id="collapsedescription" role="tabpanel" aria-labelledby="title-description" tabindex="0" aria-live="polite">
             <div class="card-block">
               {block name='product_description'}
               
                 <div class="product-description">{$product.description nofilter}</div>
                
               {/block}
             </div>
         </div>
       </div>
       {* Product Detail *}
       <div class="card" id="product-detail" role="presentation" >
         <div class="card-header" role="tab" id="headingdetails">
           <h3 class="sr-only" id="title-product-details">{l s='Product Details' d='Shop.Theme.Accessibility'}</h3>
             <p class="titre_accordeon">
               <a class="details" data-toggle="collapse" data-parent="#accordion" href="#collapsedetails" aria-expanded="false" aria-controls="collapsedetails" tabindex="0" aria-labelledby="title-product-details">
                   {l s='Product Details' d='Shop.Theme.Catalog'} <span class="arrow-desc">
                   {* FLECHE MASQUEE <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><!--!Font Awesome Pro 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2024 Fonticons, Inc.--><path d="M212.7 363.3c6.2 6.2 16.4 6.2 22.6 0l160-160c6.2-6.2 6.2-16.4 0-22.6s-16.4-6.2-22.6 0L224 329.4 75.3 180.7c-6.2-6.2-16.4-6.2-22.6 0s-6.2 16.4 0 22.6l160 160z"/></svg>*}
                   </span>
               </a>
             </p>
         </div>

         {* Remplacer tab-details par collapse pour réactiver lestabs  *}
         <div id="collapsedetails" class="tab-details" role="tabpanel" aria-labelledby="title-product-details" tabindex="0" aria-live="polite">
           <div class="card-block">
             <div data-product="{$product|json_encode}">
               <div id="product-details"> 
                 {block name='product_reference'}
                   {if isset($product_manufacturer->id)}
                       <div class="product-manufacturer">
                         {if isset($manufacturer_image_url)}
                             <a href="{$product_brand_url}">
                               <img data-src="{$manufacturer_image_url}" class="lazy img img-thumbnail manufacturer-logo" />
                             </a>
                         {else}
                             <label class="label">{l s='Brand' d='Shop.Theme.Catalog'}</label>
                             <span>
                               <a href="{$product_brand_url}">{$product_manufacturer->name}</a>
                             </span>
                         {/if}
                       </div>
                   {/if}
                  
                 {/block} 
                 {block name='product_quantities'}
                     {if $product.show_quantities}
                       <div class="product-quantities">
                           
                           <span>{$product.quantity} {$product.quantity_label}</span>
                           <label class="label">{l s='In stock' d='Shop.Theme.Catalog'}</label>
                       </div>
                     {/if}
                 {/block}
                 {block name='product_availability_date'}
                     {if $product.availability_date}
                       <div class="product-availability-date">
                           <label>{l s='Availability date:' d='Shop.Theme.Catalog'} </label>
                           <span>{$product.availability_date}</span>
                       </div>
                     {/if}
                 {/block}
                 {block name='product_out_of_stock'}
                     <div class="product-out-of-stock">
                       {hook h='actionProductOutOfStock' product=$product}
                     </div>
                 {/block}
                 {block name='product_features'}
                     {if $product.features}
                       <section class="product-features">

                           <div class="data-sheet">
                             {foreach from=$product.features item=feature}
                                 {hook h='displayFeatureProduct' feature=$feature}
                             {/foreach}
                           </div>
   
                       </section>
                     {/if}
                 {/block}
                 {*   {block name='product_condition'}
                     {if $product.condition}
                       <div class="product-condition">
                           <label class="label">{l s='Condition' d='Shop.Theme.Catalog'} </label>
                           <link itemprop="itemCondition" href="{$product.condition.schema_url}"/>
                           <span>{$product.condition.label}</span>
                       </div>
                     {/if}
                 {/block} 
                 *}
               </div>
           </div>
           
           </div>
           <div class="tracabilite">

           <h3 class="sr-only" id="title-tracabilite">{l s='Product sheet relating to environmental qualities and characteristics' d='Shop.Theme.Accessibility'}</h3>

           <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapsetracabilite" aria-expanded="false" aria-controls="collapsetracabilite" tabindex="0" aria-labelledby="title-tracabilite">
               {l s='Product sheet relating to environmental qualities and characteristics' d='Shop.Theme.Catalog'} <span class="arrow-desc">
               <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><!--!Font Awesome Pro 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2024 Fonticons, Inc.--><path d="M212.7 363.3c6.2 6.2 16.4 6.2 22.6 0l160-160c6.2-6.2 6.2-16.4 0-22.6s-16.4-6.2-22.6 0L224 329.4 75.3 180.7c-6.2-6.2-16.4-6.2-22.6 0s-6.2 16.4 0 22.6l160 160z"/></svg>
               </span>
           </a>

             <div id="collapsetracabilite" class="collapse" role="tabpanel" aria-labelledby="title-tracabilite" tabindex="0" aria-live="polite">
                 {if $product.features}
                     <section class="product-features">
                         <div class="data-sheet">
                             {foreach from=$product.features item=feature}
                                 {hook h='displayFeatureProductAgec' feature=$feature}
                             {/foreach}
                         </div>

                     </section>
                 {/if}

                 <a class="tracabilite-box" target="_blank" href="{l s='link_page_agec' d='Shop.Theme.Catalog'}" >
                 {l s='Information regarding packaging used for online shipments of goods to the customer' d='Shop.Theme.Catalog'}
             </a>
               </div>

             
         </div>
         </div>

     </div>
   
   
       {* Attachments Product Detail *}
       {block name='product_attachments'}
       {if $product.attachments}
           <div class="card" id="attachments" role="presentation">
             <div class="card-header" role="tab" id="headingattachments">
               <h3 class="sr-only" id="title-attachments">{l s='Attachments' d='Shop.Theme.Accessibility'}</h3>
                 <h5 class="h5">
                   <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseattachments" aria-expanded="false" aria-controls="collapseattachments" tabindex="0" aria-labelledby="title-attachments">
                       {l s='Attachments' d='Shop.Theme.Catalog'}
                   </a>
                 </h5>
             </div>
             <div id="collapseattachments" class="collapse" role="tabpanel" aria-labelledby="title-attachments" tabindex="0" aria-live="polite">
                 <div class="card-block">
                   <div class="attachments">
                     <section class="product-attachments">
                         <h3 class="h5 text-uppercase">{l s='Download' d='Shop.Theme.Actions'}</h3>
                         {foreach from=$product.attachments item=attachment}
                           <div class="attachment">
                               <h4><a href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}">{$attachment.name}</a></h4>
                               <p>{$attachment.description}</p>
                               <a href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}">
                                {l s='Download' d='Shop.Theme.Actions'} ({$attachment.file_size_formatted})
                               </a>
                           </div>
                         {/foreach}
                     </section>
                   </div>
                 </div>
             </div>
         </div>
       {/if}
     {/block}
     {* Extra Product *}
     {foreach from=$product.extraContent item=extra key=extraKey}
       <div class="card" id="extra-{$extraKey}" role="presentation">
          <div class="card-header" role="tab" id="headingextra-{$extraKey}">
            <h3 class="sr-only" id="title-extra-{$extraKey}">{l s=$extra.title d='Shop.Theme.Accessibility'}</h3>
               <h5 class="h5">
                 <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseextra-{$extraKey}" aria-expanded="false" aria-controls="collapseextra-{$extraKey}" tabindex="0" aria-labelledby="title-extra-{$extraKey}">
                     {$extra.title}
                 </a>
               </h5>
           </div>
           <div id="collapseextra-{$extraKey}" class="collapse" role="tabpanel" aria-labelledby="title-extra-{$extraKey}" tabindex="0" aria-live="polite">
               <div class="card-block">
                 <div class="{$extra.attr.class}" id="extra-content-{$extraKey}" {foreach $extra.attr as $key => $val} {$key}="{$val}"{/foreach}>
                  {$extra.content nofilter}
               </div>
               </div>
           </div>
       </div>
     {/foreach}
   </div>
   {/block}