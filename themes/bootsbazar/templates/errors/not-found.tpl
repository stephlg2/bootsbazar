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
<section id="content" class="page-content page-not-found">
  {block name='page_content'}
<h2 class="titre_404">404</h2>
    <h4>{l s='This page no longer exists or has been moved...' d='Shop.Theme.Global'}</h4>
    <p><a class="backstore btn btn-primary" href="/">{l s='Return to the store' d='Shop.Theme.Global'}</a></p>

    

    {block name='hook_not_found'}
      {hook h='displayNotFound'}
    {/block}

  {/block}
</section>
<div class="container-fluid container-404">
<span class="carousel404"><h2>{l s='What style are you looking for?' d='Shop.Theme.Global'}</h2> {hook h="hicarousel" id="1"}</span>
</div>