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
 {extends file='page.tpl'}


{block name='pageWrapperClass'}{/block}


    

{block name='page_content_container'}


    <section id="content" class="page-home">
        {block name='page_content'}
            {block name='hook_home'}
                {$HOOK_HOME nofilter}

           <div  class="container-fluid encart-home">
       
           <div class="col-lg-12 col-sm-12">
           {hook h="rasHookTplEdit" id="home"}
        
           </div>
           </div>    


            {/block}



            <div class="carousel_nouveautes_home container-fluid">
                <h2 class="Titres_homepage">{l s='Our collection' d='Shop.Theme.Homepage'}</h2>
                {hook h="hicarousel" id="1"}
            </div>

            <div class="Une_homepage container-fluid">
                <div class="une-homepage">{hook h="rasHookTplEdit" id="Homepage_Bloc_a_la_une"}</div>
                <div class="clear"></div>
            </div>

           
            
   
            
            <div class="container-fluid ">
                <div class="carrousel-home">{hook h="hicarousel" id="1"}</div>
            </div>

        {/block}
    </section>
{/block}
{block name='page_footer_container'}
    <footer class="page-footer--home">{block name='page_footer'}{/block}</footer>
{/block}