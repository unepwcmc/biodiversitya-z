jQuery(document).ready(function($) {

  // Add a customised select to various select form elements

  // $('.js-styled-select').customSelect();

  $(document).foundation();


  // Waypoints for back to top
  $('.theme-filters, .highlight-box').waypoint(function() {
    $('.back-to-top').addClass("visible");
  });

  $('.theme-banner').waypoint(function() {
    $('.back-to-top').removeClass("visible");
    }, {
    offset: function() {
      return -$(this).height();
    }
  });


  // Use waypoints to drop down the programmitcally created fixed header when the user scrolls the page

  $('#js-page-header').waypoint(function(direction) {

    var fixedHeader = $('#js-header-fixed');
    var fixedHeaderHeight = fixedHeader.outerHeight();


    if(direction == 'down'){
      fixedHeader.addClass('bottom-shadow');
      fixedHeader.animate({ marginBottom: -fixedHeaderHeight });
      // If initial header subnav is visible , hide it and display fixed one instead
      var initial_mobile_menu = $('.initial-header .mobile-header-nav');
      var fixed_mobile_menu = $('.fixed-header .mobile-header-nav');
      if($(initial_mobile_menu).is(':visible')){
        $(initial_mobile_menu).hide();
        $(fixed_mobile_menu).show();
      }

    } else {
      fixedHeader.removeClass('bottom-shadow');
      fixedHeader.animate({ marginBottom: -20 });
      $('.mobile-header-nav').slideUp();
    }
  }, {
    offset: function() {
      var pageHeaderHeight = $('.initial-header').height();
      return - pageHeaderHeight;
    }
  });


  // Hide all toggle-content on terms page on mobile

  if( /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) && $("body").hasClass("term") ) {
    $(".toggle-section").each( function() {
      $(this).find("h2 a").addClass("shown");
      $(this).find(".js-section-content").hide();
    });
  }

});
