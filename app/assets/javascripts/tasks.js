$(function () {
  $('#email-btn').on('click', function(e) {
    // e.preventDefault();
    $('#email-form').toggle();
    $('div').show();
  });

  // $('#email-form').on('submit', function(e) {
  //   e.preventDefault();
  //
  //   $form = $(this);
  //   var name = $('#email-name').val();
  //   var email = $('#email-email').val();
  //   var desc = $('#email-description').val();
  //   var dataToSend = {letter:{name: name, email: email, description: desc}}
  //   console.log(dataToSend);
  //   console.log($form.attr('action'));
  //   // console.log($form.serialize());
  //
  //   $.ajax({
  //     url: $form.attr('action'),
	// 		method: $form.attr('method'),
	// 		data: dataToSend
  //   })
  // })

})
