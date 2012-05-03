# Templates al estilo moustache
_.templateSettings =
  interpolate : /\{\{(.+?)\}\}/g

# Función para poner un alert en su sitio predefinido a un form (marcado por .alert-container)
$.fn.extend
  bootstrapAlert: (text, level = 'error') ->
    alertClass = if level then "alert-#{level}" else ''
    alertTemplate = _.template $('#alertTemplate').html()
    $(this).find('.alert-container').html alertTemplate({ text: text, klass: alertClass })
  hideValidationErrors: () ->
    $(this).find('.control-group').removeClass('error')
    $(this).find('.help-block.error').remove()
    $(this).find('.alert-error').alert('close')
  showValidationErrors: (jsonErrors) ->
    $(this).hideValidationErrors()
    for field, errors of jsonErrors
      $input = $("##{$(this).data('model')}_#{field}")
      $input.closest('.control-group').addClass('error')
      $input.after "<p class='help-block error'>#{errors.join('. ')}</p>"
  bootstrapValidation: (response) ->
    json = $.parseJSON(response.responseText)
    $(this).showValidationErrors(json.errors)
    $(this).bootstrapAlert '<strong>Oh oh!</strong> Parece que hay algún dato erróneo'

jQuery ->
  # Cuando enviar un formulario de usuario, en realidad se envía una petición de JSON que devuelve
  # el objeto actualizado o los errores.
  $('.user_form').submit (e)->
    $form = $(this)
    e.preventDefault()
    $.post("#{@action}.json", $(this).serialize())
      .success (response) ->
        $form.hideValidationErrors()
        $form.bootstrapAlert '<strong>Listo!</strong> Se han actualizado los datos', 'success'
      .error (response) ->
        $form.bootstrapValidation(response)