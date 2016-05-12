// On load close any unselected themes - open an preselected themes
$(document).ready(function(){

  // Hide the categories of unselected themes
  close_categories_for_inactive_themes();

  // Clear all categories if a parent theme is unselected
  $('select.category').on('change', function(){
    if ($(this).attr('checked', 'checked')){
      clear_category_selections_for_theme($(this));
    }
  });

  // Add on change event to update children
  $('select.categories').on('change', function(){
    update_child_options_for_parent(child, parent);
  });

  $('#master_theme_id').change(function(){
    master_theme_changed($(this).val());
  });

  hide_children_of_unchecked($('fieldset.depth_1'));
  hide_children_of_unchecked($('fieldset.depth_2'));
  hide_children_of_unchecked($('fieldset.depth_3'));

//  $('fieldset.depth_1 > input:checkbox').change(function(){
//    if ($(this).attr('checked') !== undefined){
//      $(this).nextAll('fieldset').first().hide();
//    } else {
//      $(this).nextAll('fieldset').first().show();
//    }
//  });

});

function hide_children_of_unchecked($fieldsets){
  $fieldsets.each(function(i, e){
    $(e).children('input:checkbox').each(function(i, f){
      if ($(f).attr('checked') === undefined){
        $(f).nextAll('fieldset').first().hide();
      }
    });
  });
}

function close_categories_for_inactive_themes(){
  // TODO: Modify the selector correctly!
  $('.inactive').hide();
}

function clear_category_selections_for_theme($theme){
  $theme.next('.categories').children().each(function(c){
    c.val('');
  });
}

function master_theme_changed(theme_id){
  $("[data-association='" + theme_id + "']").prop('checked', true).trigger('click');

}