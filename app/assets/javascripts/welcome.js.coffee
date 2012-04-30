# LoginForm
$('#loginForm').live 'submit', ()->
  $form = $(this)
  $.post("#{@action}.js", $(this).serialize)
    .error (data) -> 
      $form.find('.alert-error').remove()
      $form.find('fieldset').before $(data.responseText).fadeIn(50)
  false