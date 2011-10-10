$(document).ready(function() {
  // Toggle display/form
  $('.toggle').click( function() { 
    $(this).parent().hide()
    $(this).parent().siblings().show()
    return false;
  } )

  // Delete a beer
  $('.delete').click( function() {
    if ( confirm('Are you sure?') ) {
      $.post('/beer/' + $(this).closest('li').attr('id'), { '_method': 'delete' },
        function(data) {
          alert(data)
          alert(data.id)
          $("#"+data.id).remove()
        }, 'json')
    }
    return false;
  } )
});

