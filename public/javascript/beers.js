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
      data = { 'method': '__delete', 'id': $(this).closest('li').attr('id')  }
      $.post('/beer', data, 
        function(data) {
          $(this).closest('li').remove()
        },
        function(data) {
          alert('There was a problem: ' + data)
        })
    }
    return false;
  } )
});

