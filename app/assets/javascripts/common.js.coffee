jQuery ->
  $('.toggle-edition').click (e)->
    e.preventDefault()
    $button = $(this)
    $form = $button.closest('form')
    if $button.hasClass 'edit'
      $form.find('input').each (index, input) ->
        $(input).removeClass('disabled').prop('disabled', false)
        # TODO: error, se está eliminando el texto del boton también
      $button.removeClass('edit').addClass('btn-danger').html('<i class="icon-remove"></i> Cancelar')
    else
      $form.find('input').each (index, input) ->
        $(input).addClass('disabled').prop('disabled', true)
        $(input).val($(input).data('original')) if input.type != 'submit'
      $button.addClass('edit').removeClass('btn-danger').html('<i class="icon-edit"></i> Editar')
      $form.hideValidationErrors()

