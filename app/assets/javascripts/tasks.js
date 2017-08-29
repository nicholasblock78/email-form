$(function () {
  $('#email-btn').on('click', function(e) {
    // e.preventDefault();
    // $(this).text()="hello";
    $('#email-form').toggle();
    $('div').show();
    var href = window.location.href
    $('#email-description').after("<input type='hidden' name='href' value='"+href+"'>");
  });
})
