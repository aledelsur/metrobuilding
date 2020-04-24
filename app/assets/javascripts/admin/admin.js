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
    ],
    "oLanguage": {
      "sSearch": "Buscar:"
    }
  });

  $('.datatable_budgets').DataTable({
    "columnDefs": [
      { "orderable": false, "targets": 3 }
    ],
    "oLanguage": {
      "sSearch": "Buscar:"
    }
  });

  $('.datatable_properties').DataTable({
    "columnDefs": [
      { "orderable": false, "targets": 4 }
    ],
    "oLanguage": {
      "sSearch": "Buscar:"
    }
  });

  $('.datatable_newsletters').DataTable({
    "columnDefs": [
      { "orderable": false, "targets": [2,3,4] }
    ],
    "oLanguage": {
      "sSearch": "Buscar:"
    }
  });

  $('.datatable').DataTable({
    "oLanguage": {
      "sSearch": "Buscar:"
    }
  });

  $(".dataTables_empty").text("No hay información para mostrar.")

  $(document).on('change', '#some_users', function(){
    $('.select-users-as-recipients').show();
  });

  $(document).on('change', '#all_users', function(){
    $('.select-users-as-recipients').hide();
  });

 $('#selected_users').tagsinput({
    itemValue: 'id',
    itemText: 'text',
  });

  /* Sets the id of the newsletter to the modal so that when submitting the form we can add the id to the url in the form */
  $(document).on('click', '.send-newsletter-btn-index', function(){
    var newsletter_id = $(this).data('newsletter-id');
    $('#send_newsletter_modal').attr('data-newsletter-id', newsletter_id);
  });

  $('#user_id').on("select2:select", function(event) {
    var selected_option = $(event.currentTarget).find("option:selected");
    var user_name = selected_option.text();
    var user_id = selected_option.val();

    $('#selected_users').tagsinput('add', {id: user_id, text: user_name});
    $('.users-selected').show();
  });

  $(document).on('click', '#send_newsletter_modal #send-btn', function(e){
    e.preventDefault();
    var newsletter_id = $('#send_newsletter_modal').data('newsletter-id');
    $('#send_newsletter_form').attr('action', "/admin/newsletters/" + newsletter_id + "/send_newsletter").submit();
  });

  // Refresh page when modal is closed so that we don't we make sure the estate of the modal is initialized next time it's opened.
  $(document).on('hide.bs.modal', function(e) {
    location.reload();
  })
});
