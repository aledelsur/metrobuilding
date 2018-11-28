$(document).ready(function(){
  $(document).on('click', 'button, a', function(){
    $(this).attr('disabled', true);
  })

  $(document).on('submit', 'form', function(){
    $('form button').attr('disabled', true);
  })
});