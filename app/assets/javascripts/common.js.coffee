jQuery ->
  $('.toggle-edition').click (e)->
    e.preventDefault()
    $button = $(this)
    $form = $button.closest('form')
    if $button.hasClass 'edit'
      $(input).removeClass('disabled').prop('disabled', false) for input in $form.find('input')
      $button.removeClass('edit').addClass('btn-danger').html('<i class="icon-remove"></i> Cancelar')
    else
      for input in $form.find('input')
        $(input).addClass('disabled').prop 'disabled', true
        $(input).val($(input).data('original')) if input.type != 'submit'
      $button.addClass('edit').removeClass('btn-danger').html('<i class="icon-edit"></i> Editar')
      $form.hideValidationErrors()

