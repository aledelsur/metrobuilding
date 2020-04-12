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
    if(!$(this).data('disable') == false)
      $(this).attr('disabled', true);
  })

  $(document).on('submit', 'form', function(){
    $('form button').attr('disabled', true);
  })

  $(".select2").select2({
    theme: "bootstrap"
  });

  $(document).on('keyup', '.js-amount', function() {
    var total = 0;
    $('.js-amount').each(function() {
      if($(this).val()){
        total = total + parseInt($(this).val());
      }
    });

    $('.js-cuota-amount').html(parseInt($('#js-initial-debt').val()) - total);
  })

  $(document).on('keyup', '.js-dolla-value', function() {
    var value = $(this).val();

    $('.js-dolla-value').each(function() {
      $(this).val(value);
    })
  })

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

  $('.btn').attr('disabled', false);

  $('.datatable_users').DataTable({
    "columnDefs": [
      { "orderable": false, "targets": [4,5] }
    ]
  });

  $('.datatable_budgets').DataTable({
    "columnDefs": [
      { "orderable": false, "targets": 3 }
    ]
  });

  $('.datatable_properties').DataTable({
    "columnDefs": [
      { "orderable": false, "targets": 4 }
    ]
  });

  $('.datatable_newsletters').DataTable({
    "columnDefs": [
      { "orderable": false, "targets": [2,3,4] }
    ]
  });

  $('.datatable').DataTable({
  });

  $(document).on('change', '#image-input', function(){
    $('form').submit();
  });
});
