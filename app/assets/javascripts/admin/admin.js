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

  $(document).on('change', '.js-property-check', function() {
    // We need to conver user_ids to an array first
    // so we can know if an id is already there
    var ids = $('#debt_property_ids').val().split(',');
    ids.filter(String);
    var newId = $(this).data('property-id').toString();
    if(this.checked){
      if(!ids.includes(newId)){
        ids.push(newId);
      }
    } else {
      ids[ids.indexOf(newId)] = '';
      ids = ids.filter(String);
    }
    $('#debt_property_ids').val(ids.join(','));
  })

  $(document).on('change', '#js-select-all', function(){
    $('input[type="checkbox"]').prop('checked', $(this).prop('checked'))
  })

  $('.datatable.users').DataTable({
    "columnDefs": [
      { "orderable": false, "targets": [4,5] }
    ]
  });

  $('.datatable.budgets').DataTable({
    "columnDefs": [
      { "orderable": false, "targets": 3 }
    ]
  });

  $('.datatable.properties').DataTable({
    "columnDefs": [
      { "orderable": false, "targets": 4 }
    ]
  });

  $('.datatable.newsletters').DataTable({
    "columnDefs": [
      { "orderable": false, "targets": [2,3,4] }
    ]
  });

  $(document).on('change', '#image-input', function(){
    $('form').submit();
  });
});
