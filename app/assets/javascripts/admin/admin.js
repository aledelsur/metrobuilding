function addRemoveIds(element){
  var ids = $('#debt_property_ids').val().split(',');
  ids.filter(String);
  var newId = $(element).data('property-id').toString();
  if(element.checked){
    if(!ids.includes(newId)){
      ids.push(newId);
    }
  } else {
    ids[ids.indexOf(newId)] = '';
    ids = ids.filter(String);
  }
  $('#debt_property_ids').val(ids.join(','));
}

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

  $(document).on('change', '.js-property-check', function() {
    // We need to conver user_ids to an array first
    // so we can know if an id is already there
    addRemoveIds(this);
  })

  $(document).on('change', '#js-select-all', function(){
    $('input[type="checkbox"]').prop('checked', $(this).prop('checked'));
    $('input[type="checkbox"]').each(function(index){
      if(index != 0) { // Select all checkbox is index 0
        addRemoveIds($('input[type="checkbox"]')[index]);
      }
    })
  })

  $(document).on('submit', '.js-new-payment-form', function(){
    $.ajax({
        method: 'POST',
        url: '/admin/payments',
        data: $(this).serializeArray(),
        dataType: 'script'
    });

    return false;
  })
});
