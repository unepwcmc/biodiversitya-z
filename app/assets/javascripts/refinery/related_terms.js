$(document).ready(function(){

  $('#term_related_term_tokens').tokenInput('/refinery/terms/search.json', {
    theme: 'facebook',
    propertyToSearch: 'title',
    prePopulate: $('#term_related_term_tokens').data('load')
  });

  $('#term_definition_title').keyup(function(){
    term_definition_title();
  });
  setTimeout(term_definition_title, 50);

});

function term_definition_title(){
  $('#ui-id-1').html($('#term_definition_title').val());
}
function load_child_options($child, parent_id){
  $child.load("/refinery/terms/themes/" + parent_id + "/children");
}

function reference_numbers(){
  $('.reference_number').each(function(i, e){
    $(this).html("" + i+1 + "");
  });
}