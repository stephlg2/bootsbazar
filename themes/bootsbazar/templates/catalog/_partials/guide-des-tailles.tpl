{**
  * 2007-2019 PrestaShop.
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
  * @copyright 2007-2019 PrestaShop SA
  * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
  * International Registered Trademark & Property of PrestaShop SA
  *}

<div id="size_guide">

    <div class="bs-canvas-overlay bg-dark position-fixed w-100 h-100" style="top:0;left:0;"></div>

    <div id="bs-canvas-right" class="bs-canvas bs-canvas-right position-fixed  h-100">
        <header class="bs-canvas-header p-3 bg-danger overflow-auto">
            <button type="button" class="bs-canvas-close float-left close close-guide" aria-label="Close" aria-expanded="false"><span aria-hidden="true" class="fermer-guide"><i class="fa-regular fa-xmark"></i></span>
            </button>
            <p class="d-inline-block mb-0 titre_guide_pointure">{l s='Size guide' d='Shop.Theme.Catalog'}</p>
        </header>
        <div class="bs-canvas-content px-3">
		{hook h="rasHookTplEdit" id="guide-taille"}
        </div>

    </div>
</div>

