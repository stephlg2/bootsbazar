$(function () {


    if (typeof $('#js-product-list-top').html() != "undefined") {

        var observer = new IntersectionObserver(function (entries) {

            if (!entries[0].isIntersecting) {
                document.querySelector("#js-product-list-top").classList.add("shadow-filtre");
            } else {
                document.querySelector("#js-product-list-top").classList.remove("shadow-filtre");
            }
        }, {threshold: [0, 1]});

        observer.observe(document.querySelector("#notifications"));
    }

    if (typeof $('#block_total_origin').html() != "undefined") {
        $("#products").on('DOMSubtreeModified', function () {
            $("#block_total_replace").html($("#block_total_origin").html());
        });
    }

    if (typeof $('.show_list').html() != "undefined") {
        $('.show_list').on('click', function () {
            document.cookie = "show_list=true; expires=Thu, 30 Jan 2100 12:00:00 UTC; path=/";
            $('#js-product-list .product-miniature').addClass('product_show_list');
        });
    }
    if (typeof $('.show_grid').html() != "undefined") {
        $('.show_grid').on('click', function () {
            document.cookie = "show_list=; expires=Thu, 30 Jan 1970 12:00:00 UTC; path=/";
            $('#js-product-list .product-miniature').removeClass('product_show_list');
        });
    }
    if (typeof $('.show_list').html() != "undefined" && typeof $('.show_grid').html() != "undefined") {

        prestashop.on('updateProductList', function (event) {
            $('.show_list').on('click', function () {
                $('#js-product-list .product-miniature').addClass('product_show_list');
            });

            $('.show_grid').on('click', function () {
                $('#js-product-list .product-miniature').removeClass('product_show_list');
            });
        });
    }

    if (typeof $('#login_form_payment_create').html() != "undefined") {


        if ($("#customer-form").find('input[name="email"]').length > 0 && $("#customer-form").find('input[name="email"]').val().length > 0
            && $("#customer-form").find('.is-invalid').length > 0) {

            if ($("#create_customer").hasClass('active')) {
                $("#login_customer").trigger('click');
            }
            $("#create_customer").trigger('click');
            setTimeout(function () {
                $('html, body').scrollTop($("#heading-checkout-personal-information-step").offset().top);
            }, 100);
        } else {

            $('.continue-create').on('click', function (event) {
                event.stopImmediatePropagation();
                event.stopPropagation();

                if ($("#email_create_customer").val().length > 0) {

                    $("#checkout-guest-form").find('input[name=email]').val($("#email_create_customer").val());
                    if ($("#create_customer").hasClass('active')) {
                        $("#login_customer").trigger('click');
                    }
                    $("#create_customer").trigger('click');
                }

            });
        }
        $('.return-create').on('click', function (event) {
            $("#login_customer").trigger('click');
        });


    }
    if (typeof $('#js-delivery').html() != "undefined") {
        $(document).on('keypress', function (event) {
            if (event.which == 13) {
                event.stopPropagation();
                event.stopImmediatePropagation();
                event.preventDefault();
                return false;
            }
        });
    }
    if (typeof $('#widget_colissimo_contenu').html() != "undefined" || typeof $('#chronorelais_map').html() != "undefined") {

        let refresh = 0;

        $("#widget_colissimo_adresse").val($("#widget_colissimo_adresse").val().replaceAll(',', ''));

        $(".delivery-option").on('click', function () {
            refresh = 0;
            resizeTrigger();
        });

        function resizeTrigger() {

            window.dispatchEvent(new Event('resize'));

            if (refresh < 15) {
                setTimeout(function () {
                    refresh++;
                    resizeTrigger();
                }, 500);
            }
        }
    }

    if (typeof $('#sticky-filtrer').html() != "undefined") {

        $(window).scroll(function () {
            var scroll = $(window).scrollTop();
            if (scroll > 0) {
                $("#sticky-filtrer").addClass("ombre");
            } else {
                $("#sticky-filtre").removeClass("ombre");
            }
        });
    }
    if (typeof $('.show-more').html() != "undefined") {

        $(".show-more").click(function () {
            if ($(".text").hasClass("show-more-height")) {
                $(this).text($(this).data('showminus'));
            } else {
                $(this).text($(this).data('showplus'));
            }
            $(".text").toggleClass("show-more-height");
        });
    }
    if (typeof $('.show-password').html() != "undefined") {

        $(".show-password").click(function () {
            let target = $(this).data('target');
            let show = $(this).data('show');
            let hide = $(this).data('hide');

            if ($(target).attr("type") == "text") {
                $(this).html(show);
                $(target).attr("type", "password");
            } else {
                $(target).attr("type", "text");
                $(this).html(hide);
            }

        });
    }
    if (typeof $('.search-block-modal').html() != "undefined") {

        let searchFind = $('.search-block-modal');

        let select = null;

        searchFind.each(function () {

            if (!$(this).parent().hasClass('recherche-mobile')) {
                select = $(this);
            }
        });

        if (typeof select != null) {

            $(document).on("click", function () {

                    // Close
                    if (
                        $(".search-icon-open:hover").length == 0 &&
                        $(".submit-button:hover").length == 0 &&
                        $(".search-block-modal-input:hover").length == 0) {

                        select.removeClass('active');
                        select.find('form').removeClass('active');

                    }
                }
            );

            // Open
            $('.search-icon-open').on('click', function () {
                select.addClass('active');
                select.find('form').addClass('active');
            });
            $('.submit-button').on('click', function () {
                $(this).parent('form').submit();
            });
        }

    }


    if (typeof $('.faq-accordion button').html() != "undefined") {

        const items = document.querySelectorAll(".faq-accordion button");
        items.forEach(item => item.setAttribute('aria-expanded', 'false'));

        function toggleAccordion() {
            const itemToggle = this.getAttribute('aria-expanded');
            $_this = this;
            for (i = 0; i < items.length; i++) {
                items[i].setAttribute('aria-expanded', 'false');
            }

            if (itemToggle == 'false') {
                this.setAttribute('aria-expanded', 'true');
                setTimeout(function () {
                    $('html').animate(
                        {
                            scrollTop: $($_this).offset().top,
                        },
                        300 //speed
                    );
                }, 200);
            }
        }


        items.forEach(item => item.addEventListener('click', toggleAccordion));
    }
    if (typeof $('#size_guide').html() != "undefined") {


        var bsOverlay = $('.bs-canvas-overlay');
        $('[data-toggle="canvas"]').on('click', function () {
            var ctrl = $(this),
                elm = ctrl.is('button') ? ctrl.data('target') : ctrl.attr('href');
            $(elm).addClass('mr-0');
            $(elm + ' .bs-canvas-close').attr('aria-expanded', "true");
            $('[data-target="' + elm + '"], a[href="' + elm + '"]').attr('aria-expanded', "true");
            if (bsOverlay.length)
                bsOverlay.addClass('show');
            return false;
        });

        $('.bs-canvas-close, .bs-canvas-overlay').on('click', function () {
            var elm;
            if ($(this).hasClass('bs-canvas-close')) {
                elm = $(this).closest('.bs-canvas');
                $('[data-target="' + elm + '"], a[href="' + elm + '"]').attr('aria-expanded', "false");
            } else {
                elm = $('.bs-canvas')
                $('[data-toggle="canvas"]').attr('aria-expanded', "false");
            }
            elm.removeClass('mr-0');
            $('.bs-canvas-close', elm).attr('aria-expanded', "false");
            if (bsOverlay.length)
                bsOverlay.removeClass('show');
            return false;
        });


    }

if (document.getElementById("chrono")) {
    // Date cible = 13 juillet 2025 à 23h59
    var countDownDate = new Date(2025, 6, 13, 23, 59, 0);

    var countdownFunction = setInterval(function () {
        var now = new Date().getTime();
        var distance = countDownDate - now;

        if (distance < 0) {
            clearInterval(countdownFunction);
            document.getElementById("chrono").innerHTML = "00h 00m 00s";
            return;
        }

        var days = Math.floor(distance / (1000 * 60 * 60 * 24));
        var hours = String(Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60))).padStart(2, "0");
        var minutes = String(Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60))).padStart(2, "0");
        var seconds = String(Math.floor((distance % (1000 * 60)) / 1000)).padStart(2, "0");

        let output = "";
        if (days > 0) {
            output += String(days).padStart(2, "0") + "j ";
        }
        output += hours + "h " + minutes + "m " + seconds + "s";

        document.getElementById("chrono").innerHTML = output;
    }, 1000);
}

});

