jQuery(document).ready(function($) {

  // Create a new element and clone the initial header into it - this becomes the fixed header

  $( '<div id="js-header-fixed" class="page-header fixed-header"></div>').insertBefore( "#js-page-header" );
  $( "#js-page-header .container" ).clone(true).appendTo( "#js-header-fixed" );


  //  Toggle content sections on terms page when header is clicked
  $('.js-section-toggle h2 a').click(function(e){

    e.preventDefault();

    var target = $(this).parent().siblings('.js-section-content');

    $(this).toggleClass('shown');
    target.slideToggle();

  });

  // Smooth scrolling
  $('.js-smooth-scroll').click(function(e){

    e.preventDefault();

    var target = $(this).attr("href");

    if ($(this).attr("data-offset")) {
      var offset = $(this).attr("data-offset");
    } else {
      var offset = 0;
    }

    $('html,body').animate({
      scrollTop: $(target).offset().top - offset
    }, 1000);
  });

  // Smooth expand
  $('.js-smooth-expand').click(function(e){

    e.preventDefault();

    var target = $(this).attr("href");
    var text = $(this).text();
    var normalText = $(this).data("normaltext");
    var alternativeText = $(this).data("alternativetext");

    $(this).text(text == normalText ? alternativeText : normalText).toggleClass("shown");
    $(target).toggleClass("active").slideToggle();

  });

  // Scroll to citation on click
  $("a[href*='#citation-']").click( function(e) {

    e.preventDefault();

    var target = $(this).attr("href");

    var offset = 140;

    if ($(".term-references .js-toggle-content.shown").length) {
      $(".term-references .js-toggle-content").trigger("click");
    }

    $('html,body').animate({
      scrollTop: $(target).offset().top - offset
    }, 1000);

  });

  setTimeout(function(){
    $('.theme-filters .custom.dropdown li').each(function(){
      if ($(this).html().substr(0, 1) === '-') {
        $(this).addClass('indented');
      }
    });
  },500);

});
