jQuery(document).ready(function($) {

  // duplicate first 'about' item
  $('.mobile-header-nav').find('.about').prev().clone().prependTo($('.mobile-header-nav').find('.about')).wrap("<li>");

  // open mobile menu
  $('.js-toggle-menu').click(function(e){

    e.preventDefault();

    var target = $(this).siblings('.mobile-header-nav');
    $('.mobile-header-nav').not(target).hide();
    target.slideToggle();
    
  });

  // open mobile submenu
  $('.mobile-header-nav li').addClass('hidden-sub-nav');

  $('.mobile-header-nav .parent-menu > li > a').click(function(e){
    
    //slide up all sub navs on click
    $('.mobile-header-nav ul.child-menu').slideUp();
    
    //add a hidden class to all sub navs and then remove for active one
    $('.mobile-header-nav li').addClass('hidden-sub-nav').find("a").removeClass("active");
    $(this).closest('li').removeClass('hidden-sub-nav');
    
    // If active subnav is not already visible slide it down
    var closest_sub_menu = $(this).closest('li').find('ul.child-menu');
    if(!$(closest_sub_menu).is(':visible')){
      $(closest_sub_menu).slideDown();
    } else {
      $('mobile-header-nav li').addClass('hidden-sub-nav');
    }

    $(this).toggleClass("active");

    e.preventDefault();
  });

});