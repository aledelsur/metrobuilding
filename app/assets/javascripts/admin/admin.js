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

  // $(document).on('click', '.newsletter-section .panel-heading', function(){
  //   var section = $(this).parent();
  //   section.find('.panel-body').toggle('collapse');
  // });

  // $("#newsletter_sections").sortable({
  //   update: function(e, ui){
  //     Rails.ajax({
  //       url: $(this).data('url'),
  //       type: 'PATCH',
  //       data: $(this).sortable('serialize'),
  //     });
  //   }
  // });

  $(document).on('change', '#image-input', function(){
    $('form').submit();
  });
});
