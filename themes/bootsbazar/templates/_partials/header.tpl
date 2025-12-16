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

<a href="#main-content" class="sr-only sr-only-focusable">{l s='Skip to content' d='Shop.Theme.Accessibility'}</a>

<header id="site-header" role="banner" class="container-fluid">
  <div class="row">
    {block name='header_top'}
      <div class="col"></div>
      <div class="col-lg-12 col-md-12 col-sm-12 banniere-header p-0">{hook h='displayTop'}</div>
      <div class="col"></div>
    {/block}
  </div>

</header>

{block name='header_banner'}
  <div class="header-banner">
    {hook h="rasHookTplEdit" id="banner"}
  </div>
{/block}

<div class="container-fluid header-sticky">
  <div class="row Row_Logo">
    {block name='header_nav'}
      <nav class="col-lg-5 col-md-3 header-nav2 mega-menu" aria-label="{l s='Main menu' d='Shop.Theme.Accessibility'}">
        {hook h='displayMegaMenu'}
      </nav>
      <div class="col-lg-2 col-md-6 col-sm-12 logo-armistice"><a
          aria-label="{l s='Home page' d='Shop.Theme.Accessibility'}" href="{$urls.base_url}">
          <?xml version="1.0" encoding="UTF-8"?>
          <svg xmlns="http://www.w3.org/2000/svg" id="Calque_1" data-name="Calque 1" viewBox="0 0 323.88 70.68">
            <defs>
              <style>
                .cls-1 {
                  fill: #1d1d1b;
                }

                .cls-2 {
                  fill: #63614c;
                }

                .cls-3 {
                  font-family: Dabre-Grunge, 'Dabre Grunge';
                  font-size: 64.7px;
                }
              </style>
            </defs>
            <text class="cls-3" transform="translate(0 54.83)">
              <tspan class="cls-1" x="0" y="0">Boots</tspan>
              <tspan class="cls-2" x="161.36" y="0">Bazar</tspan>
            </text>
          </svg>
        </a></div>
      <nav class="col-lg-5 col-md-3 header-nav2 d-flex justify-content-end" aria-label="{l s='User links' d='Shop.Theme.Accessibility'}">
        {hook h='displayNav2'}
      </nav>
    {/block}
  </div>
  <div class="degrade-index-header"></div>
</div>