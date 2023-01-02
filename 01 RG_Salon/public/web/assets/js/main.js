(function ($) {
    "use strict";
/*--
    Commons Variables
-----------------------------------*/
var windows = $(window);
var windowWidth = windows.width();
var mainWrapper = $('.main-wrapper');


/*--
    Header Cart
-----------------------------------*/
var cartToggle = $('.header-cart-toggle');
var miniCart = $('.header-mini-cart');
// Toggle Header Cart
cartToggle.on("click", function () {
    miniCart.slideToggle();
});
// Closing the Header Cart by clicking in the menu button or anywhere in the screen
$('body').on('click', function (e) {
    var target = e.target;
    if (!$(target).is('.header-cart-toggle') && !$(target).parents().is('.header-cart-toggle')) {
        miniCart.slideUp();
    }
});
// Prevent closing Header Cart upon clicking inside the Header Cart
$('.header-mini-cart').on('click', function (e) {
    e.stopPropagation();
});





    var notificationToggle = $('.header-notification-toggle');
    var miniNotification = $('.notification');
// Toggle Header Cart
    notificationToggle.on("click", function () {
        $.ajax({
            url:"/status/notification",
            method:"GET",
            dataType:'json',
            data:{

            },
            success:function(data){
            }
        });
        miniNotification.slideToggle();
        $("#notify_result").hide();
    });
// Closing the Header Cart by clicking in the menu button or anywhere in the screen
    $('body').on('click', function (e) {
        var target = e.target;
        if (!$(target).is('.header-notification-toggle') && !$(target).parents().is('.header-notification-toggle')) {
            miniNotification.slideUp();
        }
    });
// Prevent closing Header Cart upon clicking inside the Header Cart
    $('.notification').on('click', function (e) {
        e.stopPropagation();
    });

    /*--
        Mobile Menu
    -----------------------------------*/
var mainMenuNav = $('.main-menu');
mainMenuNav.meanmenu({
    meanScreenWidth: '991',
    meanMenuContainer: '.mobile-menu',
    meanMenuClose: '<span class="menu-close"></span>',
    meanMenuOpen: '<span class="menu-bar"></span>',
    meanRevealPosition: 'right',
    meanMenuCloseSize: '0'
});

/*--
    Sliders
-----------------------------------*/
// Hero Slider
$('.hero-slider').slick({
    infinite: true,
    fade: true,
    dots: false,
    prevArrow: '<button class="slick-prev"><i class="fa fa-angle-left"></i></button>',
    nextArrow: '<button class="slick-next"><i class="fa fa-angle-right"></i></button>',
    responsive: [
        {
        breakpoint: 992,
            settings: {
                dots: true,
                arrows: false,
            }
        },
    ]
});
// Product Slider 4 Column
$('.product-slider-4').slick({
    infinite: true,
    dots: false,
    slidesToShow: 4,
    slidesToScroll: 1,
    prevArrow: '<button class="slick-prev"><i class="fa fa-angle-left"></i></button>',
    nextArrow: '<button class="slick-next"><i class="fa fa-angle-right"></i></button>',
    responsive: [
        {
            breakpoint: 1200,
            settings: {
                slidesToShow: 3,
            }
        },
        {
            breakpoint: 992,
            settings: {
                slidesToShow: 2,
            }
        },
        {
            breakpoint: 576,
            settings: {
                slidesToShow: 1,
            }
        },
    ]
});
// Product Slider 3 Column
$('.product-slider-3').slick({
    infinite: true,
    dots: false,
    slidesToShow: 3,
    slidesToScroll: 1,
    prevArrow: '<button class="slick-prev"><i class="fa fa-angle-left"></i></button>',
    nextArrow: '<button class="slick-next"><i class="fa fa-angle-right"></i></button>',
    responsive: [
        {
            breakpoint: 1200,
            settings: {
                slidesToShow: 2,
            }
        },
        {
            breakpoint: 992,
            settings: {
                slidesToShow: 2,
            }
        },
        {
            breakpoint: 576,
            settings: {
                slidesToShow: 1,
            }
        },
    ]
});
// Single Product Slider
$('.single-product-slider').slick({
    infinite: true,
    dots: false,
    slidesToShow: 1,
    slidesToScroll: 1,
    prevArrow: '<button class="slick-prev"><i class="fa fa-angle-left"></i></button>',
    nextArrow: '<button class="slick-next"><i class="fa fa-angle-right"></i></button>',
});
// Single Product Slider
$('.single-product-slider-syn').slick({
    infinite: true,
    arrows: false,
    dots: false,
    slidesToShow: 1,
    slidesToScroll: 1,
    prevArrow: '<button class="slick-prev"><i class="fa fa-angle-left"></i></button>',
    nextArrow: '<button class="slick-next"><i class="fa fa-angle-right"></i></button>',
    asNavFor: '.single-product-thumb-slider-syn',
});
// Single Product Thumbnail Slider
$('.single-product-thumb-slider-syn').each(function() {
    var $vertical = $(this).attr('data-vertical') === 'true' ? true : false;
    var $verticalPrevArrow = $(this).attr('data-vertical') === 'true' ? 'up' : 'left';
    var $verticalNextArrow = $(this).attr('data-vertical') === 'true' ? 'down' : 'right';
    $(this).slick({
        infinite: true,
        dots: false,
        slidesToShow: 3,
        slidesToScroll: 1,
        focusOnSelect: true,
        centerMode: true,
        centerPadding: '0px',
        prevArrow: '<button class="slick-prev"><i class="fa fa-angle-'+$verticalPrevArrow+'"></i></button>',
        nextArrow: '<button class="slick-next"><i class="fa fa-angle-'+$verticalNextArrow+'"></i></button>',
        asNavFor: '.single-product-slider-syn',
        vertical: $vertical,
        responsive: [
            {
                breakpoint: 479,
                settings: {
                    arrows: false,
                    vertical: false,
                    prevArrow: '<button class="slick-prev"><i class="fa fa-angle-left"></i></button>',
                    nextArrow: '<button class="slick-next"><i class="fa fa-angle-right"></i></button>',
                }
            },
        ]
    });
});
// Brand Slider
$('.brand-slider').slick({
    infinite: true,
    arrows: false,
    dots: false,
    slidesToShow: 5,
    slidesToScroll: 1,
    responsive: [
        {
            breakpoint: 992,
            settings: {
                slidesToShow: 4,
            }
        },
        {
            breakpoint: 768,
            settings: {
                slidesToShow: 3,
            }
        },
        {
            breakpoint: 576,
            settings: {
                slidesToShow: 2,
            }
        },
    ]
});
// Brand Slider
$('.blog-slider').slick({
    infinite: true,
    arrows: true,
    dots: false,
    slidesToShow: 1,
    slidesToScroll: 1,
    prevArrow: '<button class="slick-prev"><i class="fa fa-angle-left"></i></button>',
    nextArrow: '<button class="slick-next"><i class="fa fa-angle-right"></i></button>',
});
// Testimonial Slider
$('.testimonial-image-slider').slick({
    infinite: true,
    arrows: true,
    dots: false,
    slidesToShow: 1,
    slidesToScroll: 1,
    prevArrow: '<button class="slick-prev">prev</button>',
    nextArrow: '<button class="slick-next">next</button>',
    asNavFor: '.testimonial-content-slider'
});
$('.testimonial-content-slider').slick({
    infinite: true,
    arrows: false,
    dots: false,
    slidesToShow: 1,
    slidesToScroll: 1,
    asNavFor: '.testimonial-image-slider'
});

/*--
    Imageloaded & Masonry
-----------------------------------*/
var $masonryGird = $('.masonry-grid');
$masonryGird.imagesLoaded( function() {
    $masonryGird.masonry({
      // options
      itemSelector: '.masonry-grid > *',
    });
});

/*--
    Rellax Parallax
-----------------------------------*/
windows.on('load', function(){
    if($('.rellax').length){
        var rellax = new Rellax('.rellax');
    }
});
/*--
    Perfect Scrollbar
-----------------------------------*/
$('.custom-scroll').each(function(){
    const ps = new PerfectScrollbar($(this)[0],);
});

/*--
    Nice Select
-----------------------------------*/
$('.nice-select').niceSelect();

/*--
	MailChimp
-----------------------------------*/
$('#mc-form').ajaxChimp({
	language: 'en',
	callback: mailChimpResponse,
	// ADD YOUR MAILCHIMP URL BELOW HERE!
	url: 'http://devitems.us11.list-manage.com/subscribe/post?u=6bbb9b6f5827bd842d9640c82&amp;id=05d85f18ef'

});
function mailChimpResponse(resp) {

	if (resp.result === 'success') {
		$('.mailchimp-success').html('' + resp.msg).fadeIn(900);
		$('.mailchimp-error').fadeOut(400);

	} else if(resp.result === 'error') {
		$('.mailchimp-error').html('' + resp.msg).fadeIn(900);
	}
}

/*--
	Price Range
-----------------------------------*/



/*-----
	Quantity
--------------------------------*/

/*--
	Product View Mode
-----------------------------------*/
$('body').on('click', '.product-view-mode button', function(e) {
    e.stopPropagation();
    var $this = $(this);
    var $modeClass = $this.data('mode');
    var $productWrap = $this.closest('body').find('.shop-product-wrap');

    $('.product-view-mode button').removeClass('active');
    $this.addClass('active');

    $productWrap.removeClass('grid-3 grid-4 list').addClass($modeClass).find('.product-item').removeClass('list');

    if($modeClass === 'list') {
        $productWrap.find('.product-item').addClass('list');
    }

});

/*-----
	Shipping Form Toggle
--------------------------------*/
$('[data-shipping]').on('click', function(){
    if( $('[data-shipping]:checked').length > 0 ) {
        $('#shipping-form').slideDown();
    } else {
        $('#shipping-form').slideUp();
    }
})

/*-----
	Payment Method Select
--------------------------------*/
$('[name="payment-method"]').on('click', function(){

    var $value = $(this).attr('value');

    $('.single-method p').slideUp();
    $('[data-method="'+$value+'"]').slideDown();

})

/*--
	Sticky Sidebar
-----------------------------------*/
if($('.product-details-with-gallery').length) {
    var sidebar = new StickySidebar('.product-content', {
        containerSelector: '.product-details-with-gallery',
        innerWrapperSelector: '.product-content-inner',
        topSpacing: 20,
        bottomSpacing: 20,
        minWidth: 992,
    });
};



})(jQuery);

// Custom js
(function($) {
    "use strict";
  
    $(".owl-carousel").owlCarousel({
      loop: true,
      margin: 30,
      nav: true,
      pagination: true,
      responsive: {
        0: {
          items: 1
        },
        600: {
          items: 2
        },
        1000: {
          items: 3
        }
      }
    });
  
    $(window).scroll(function() {
      var scroll = $(window).scrollTop();
      var box = $(".header-text").height();
      var header = $("header").height();
  
      if (scroll >= box - header) {
        $("header").addClass("background-header");
      } else {
        $("header").removeClass("background-header");
      }
    });
  
    // Mobile menu dropdown
    $(".submenu").on("click", function() {
      var width = $(window).width();
      if (width < 992) {
        $(".submenu ul").toggleClass("active");
      }
    });
  
    // Scroll animation init
    window.sr = new scrollReveal();
  
   
  
    // Menu elevator animation
    $("a[href*=\\#]:not([href=\\#])").on("click", function() {
      if (
        location.pathname.replace(/^\//, "") ==
          this.pathname.replace(/^\//, "") &&
        location.hostname == this.hostname
      ) {
        var target = $(this.hash);
        target = target.length ? target : $("[name=" + this.hash.slice(1) + "]");
        if (target.length) {
          var width = $(window).width();
          if (width < 991) {
            $(".menu-trigger").removeClass("active");
            $(".header-area .nav").slideUp(200);
          }
          $("html,body").animate(
            {
              scrollTop: target.offset().top - 80
            },
            700
          );
          return false;
        }
      }
    });
  
    $(document).ready(function() {
      $(document).on("scroll", onScroll);
  
      //smoothscroll
      $('a[href^="#"]').on("click", function(e) {
        e.preventDefault();
        $(document).off("scroll");
  
        $("a").each(function() {
          $(this).removeClass("active");
        });
        $(this).addClass("active");
  
        var target = this.hash,
          menu = target;
        var target = $(this.hash);
        $("html, body")
          .stop()
          .animate(
            {
              scrollTop: target.offset().top - 79
            },
            500,
            "swing",
            function() {
              window.location.hash = target;
              $(document).on("scroll", onScroll);
            }
          );
      });
    });
  
    function onScroll(event) {
      var scrollPos = $(document).scrollTop();
      $(".nav a").each(function() {
        var currLink = $(this);
  
        try {
          var refElement = $(currLink.attr("href"));
          if (
            refElement.position().top <= scrollPos &&
            refElement.position().top + refElement.height() > scrollPos
          ) {
            $(".nav ul li a").removeClass("active");
            currLink.addClass("active");
          } else {
            currLink.removeClass("active");
          }
        } catch (e) {
          // Ignore href='javascript:;'
        }
      });
    }
  
    const Accordion = {
      settings: {
        // Expand the first item by default
        first_expanded: false,
        // Allow items to be toggled independently
        toggle: false
      },
  
      openAccordion: function(toggle, content) {
        if (content.children.length) {
          toggle.classList.add("is-open");
          let final_height = Math.floor(content.children[0].offsetHeight);
          content.style.height = final_height + "px";
        }
      },
  
      closeAccordion: function(toggle, content) {
        toggle.classList.remove("is-open");
        content.style.height = 0;
      },
  
      init: function(el) {
        const _this = this;
  
        // Override default settings with classes
        let is_first_expanded = _this.settings.first_expanded;
        if (el.classList.contains("is-first-expanded")) is_first_expanded = true;
        let is_toggle = _this.settings.toggle;
        if (el.classList.contains("is-toggle")) is_toggle = true;
  
        // Loop through the accordion's sections and set up the click behavior
        const sections = el.getElementsByClassName("accordion");
        const all_toggles = el.getElementsByClassName("accordion-head");
        const all_contents = el.getElementsByClassName("accordion-body");
        for (let i = 0; i < sections.length; i++) {
          const section = sections[i];
          const toggle = all_toggles[i];
          const content = all_contents[i];
  
          // Click behavior
          toggle.addEventListener("click", function(e) {
            if (!is_toggle) {
              // Hide all content areas first
              for (let a = 0; a < all_contents.length; a++) {
                _this.closeAccordion(all_toggles[a], all_contents[a]);
              }
  
              // Expand the clicked item
              _this.openAccordion(toggle, content);
            } else {
              // Toggle the clicked item
              if (toggle.classList.contains("is-open")) {
                _this.closeAccordion(toggle, content);
              } else {
                _this.openAccordion(toggle, content);
              }
            }
          });
  
          // Expand the first item
          if (i === 0 && is_first_expanded) {
            _this.openAccordion(toggle, content);
          }
        }
      }
    };
  
    (function() {
      // Initiate all instances on the page
      const accordions = document.getElementsByClassName("accordions");
      for (let i = 0; i < accordions.length; i++) {
        Accordion.init(accordions[i]);
      }
    })();
  
    // Home seperator
    if ($(".home-seperator").length) {
      $(".home-seperator .left-item, .home-seperator .right-item").imgfix();
    }
  
    // Home number counterup
    if ($(".count-item").length) {
      $(".count-item strong").counterUp({
        delay: 10,
        time: 1000
      });
    }
  
    // Page loading animation
    $(window).on("load", function() {
      if ($(".cover").length) {
        $(".cover").parallax({
          imageSrc: $(".cover").data("image"),
          zIndex: "1"
        });
      }
  
      $("#preloader").animate(
        {
          opacity: "0"
        },
        600,
        function() {
          setTimeout(function() {
            $("#preloader")
              .css("visibility", "hidden")
              .fadeOut();
          }, 300);
        }
      );
    });
  })(window.jQuery);
  