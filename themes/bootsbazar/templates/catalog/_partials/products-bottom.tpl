{*
 * Classic theme doesn't use this subtemplate, feel free to do whatever you need here.
 * This template is generated at each ajax calls.
 * See ProductListingFrontController::getAjaxProductSearchVariables()
 *}
<div class="container container-description-categories">
{if ($category.description || $category.image.large.url) && $listing.pagination.items_shown_from == 1}
    <div class="d-flex">
     {if $category.description}
            <div id="category-description" class="text-muted">{$category.description nofilter}</div>
        {/if}
</div>
{/if}
</div>
