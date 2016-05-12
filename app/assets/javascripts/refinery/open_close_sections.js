jQuery(document).ready(function($) {

  $(".section-details").hide();

  $(".term-form").on("click", ".open-section", function() {
    $(this).toggleClass("active");
    $(this).next().slideToggle().toggleClass("active");
  });

  $(".term-form").on("change", ".change-title-on-edit", function() {
    var newText = $(this).val();
    console.log(newText);
    $(this).parents(".expandable-fields").find(".open-section span").text(newText);
  });

  $(".themes-and-categories").on("click", "input[type='checkbox']", function() {
    $(this).next().next("fieldset").slideToggle();
  });

});