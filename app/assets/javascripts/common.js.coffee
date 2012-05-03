jQuery ->
  $('.toggle-edition').click (e)->
    e.preventDefault()
    $button = $(this)
    $form = $button.closest('form')
    if $button.hasClass 'edit'
      $form.find('input').removeClass('disabled').prop('disabled', false)
      $button.removeClass('edit').addClass('btn-danger').html('<i class="icon-remove"></i> Cancelar')
    else
      $form.find('input').addClass('disabled').prop('disabled', true)
      $button.addClass('edit').removeClass('btn-danger').html('<i class="icon-edit"></i> Editar')
