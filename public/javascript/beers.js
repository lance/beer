$(document).ready(function() {
  $('.toggle').click( function() { 
    $(this).parent().hide()
    $(this).parent().siblings().show()
    return false;
  } )
});

