$(document).ready(function(){
  $(document).on('click', 'button, a', function(){
    $(this).attr('disabled', true);
  })

  $(document).on('submit', 'form', function(){
    $('form button').attr('disabled', true);
  })

  $(".select2").select2({
    theme: "bootstrap"
  });

  $(document).on('change', '.js-user-check', function() {
    // We need to conver user_ids to an array first
    // so we can know if an id is already there
    var ids = $('#debt_user_ids').val().split(',');
    ids.filter(String);
    var newId = $(this).data('user-id').toString();
    alert("The new id is: " + newId);
    if(this.checked){
      if(!ids.includes(newId)){
        ids.push(newId);
      }
    } else {
      ids[ids.indexOf(newId)] = '';
      ids = ids.filter(String);
      alert(ids);
    }
    alert(ids.join(','))
    $('#debt_user_ids').val(ids.join(','));
  })
});