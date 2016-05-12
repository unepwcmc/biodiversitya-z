jQuery(document).ready(function($) {

  var unsaved = false;

  $(document).on('change', ':input', function(){ //triggers change in all input fields including text type
    unsaved = true;
  });

  function unloadPage(){
    if(unsaved){
      return "You have unsaved changes on this page";
    }
  }

  $(document).on('click', '#submit_button', function(){
    unsaved = false;
  });

  function enableUnsaved() {
    unsaved = true;
  }

  $($('.wym_box iframe').get(0).contentWindow.document).keydown( function(){window.setTimeout(enableUnsaved, 0);} );

  window.onbeforeunload = unloadPage;

});