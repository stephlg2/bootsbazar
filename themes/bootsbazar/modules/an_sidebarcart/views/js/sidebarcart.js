/**
 * 2021 Anvanto
 *
 * NOTICE OF LICENSE
 *
 * This file is not open source! Each license that you purchased is only available for 1 wesite only.
 * If you want to use this file on more websites (or projects), you need to purchase additional licenses.
 * You are not allowed to redistribute, resell, lease, license, sub-license or offer our resources to any third party.
 *
 *  @author Anvanto <anvantoco@gmail.com>
 *  @copyright  2021 Anvanto
 *  @license    Valid for 1 website (or project) for each purchase of license
 *  International Registered Trademark & Property of Anvanto
 */
function qtyButtons() {
    let qtyTimer;
    $(document).on('click', '.product-qty-container:not(.adding) .quantity-button', function() {
        var min, max,
            input = $(this).siblings('input[type="text"]');
        if (input.attr('min')) {
            min = input.attr('min');
        }
        if (input.attr('max')) {
            max = input.attr('max')
        }
        var oldValue = parseFloat(input.val());

        if ($(this).hasClass('quantity-up')) {
            if (max && (oldValue >= max)) {
                var newVal = oldValue;
            } else {
                var newVal = oldValue + 1;
            }
            input.val(newVal);
        } else {
            if (oldValue <= min) {
                var newVal = oldValue;
            } else {
                var newVal = oldValue - 1;
            }
            input.val(newVal);
        }
        clearTimeout(qtyTimer);

        qtyTimer = setTimeout(function () {
            $('.product-qty-container').addClass('adding');
            var e = $.Event( "keyup", { keyCode: 13 } );
            $('#js-cart-sidebar .js-cart-line-product-quantity').trigger(e);
            input.trigger("focusout");
        }, 500);
    })
}

$(document).ready(function () {
    qtyButtons();
    var elemSideBar = $('<div id="js-cart-sidebar" class="cart-preview"></div>').insertAfter('main').wrapAll('<div class="sb-menu-right"></div>'),
        elemOverlay = $('<div class="sb-overlay"></div>').insertAfter('main'),
        elemCloseBtn = $('<div class="sb-close-btn"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><!--!Font Awesome Pro 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2024 Fonticons, Inc.--><path d="M18.2 273l-17-17 17-17L171.8 85.4l17-17 33.9 33.9-17 17L93.1 232 424 232l24 0 0 48-24 0L93.1 280 205.8 392.6l17 17-33.9 33.9-17-17L18.2 273z"/></svg></div>');

    elemCloseBtn.prependTo('.sb-menu-right');

    $('#js-cart-sidebar').html($('.js-cart-source').html());

    $('#_desktop_cart, .js-sidebar-cart-trigger').add('#_mobile_cart').on('click', function (e) {
        $('html').addClass('sb-open');
        $('.sb-overlay ').fadeIn(500);
        $('#scrolltopbtn').hide();
        return false;
    });

    $('.sb-overlay').add('.sb-close-btn').on('click', function () {
        $('.sb-overlay').fadeOut('500');
        $('html').removeClass('sb-open');
        $('#scrolltopbtn').show();
    });

    prestashop.on(
        'updateCart',
        function (event) {
            var refreshURL = $('.blockcart').data('refresh-url');
            var requestData = {};

            if (event && event.reason) {
                requestData = {
                    id_product_attribute: event.reason.idProductAttribute,
                    id_product: event.reason.idProduct,
                    action: event.reason.linkAction
                };
            }

            $.post(refreshURL.replace('ps_shoppingcart', 'an_sidebarcart'), requestData).then(function (resp) {
                $('.blockcart .header').replaceWith($(resp.preview).find('.blockcart .header'));
                $('.blockcart .cart-dropdown-wrapper').replaceWith($(resp.preview).find('.blockcart .cart-dropdown-wrapper'));
                $('.blockcart').removeClass('inactive').addClass('active');

                if ($('.sb-menu-right').length) {
                    $('#js-cart-sidebar .cart-dropdown-wrapper').replaceWith($(resp.preview).find('.blockcart .cart-dropdown-wrapper'));
                    if (prestashop.page.page_name != 'cart' && prestashop.page.page_name != 'checkout') {
                        $('html').addClass('sb-open');
                        $('.sb-overlay ').fadeIn(500);
                        $('#scrolltopbtn').hide();
                    }
                } else {
                    if (resp.modal) {
                        showModal(resp.modal);
                    }
                }
            }).fail(function (resp) {
                prestashop.emit('handleError', {eventType: 'updateShoppingCart', resp: resp});
            });
        }
    );

});

