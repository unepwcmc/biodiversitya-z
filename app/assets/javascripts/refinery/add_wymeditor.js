jQuery(document).ready(function($) {


  // Function for numbering references
  function reNumber(element, target) {

    var referenceNum = 1;

    $(element).each( function() {

        $(this).find(target + " strong").remove();

        var content = $(this).find(target).text();

        content = "<strong>" + referenceNum + ".</strong> " + content;

        $(this).find(target).html(content);

        referenceNum++;

    });

  }

  // Generate on load
  reNumber(".reference", ".open-section span");

  // Duplicate fields on '.add_fields' click
  $(".sections").on("click", ".add_fields", function() {
    setTimeout(function(){
      WYMeditor.init();
    }, 1000);

    // Renumber if references
    if ($(this).parent().attr("id") == "references") {
      reNumber(".reference", ".open-section span");
    }

  });

});