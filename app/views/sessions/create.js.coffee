<% if @user %>
  window.location = "<%= root_url %>"
<% else %>
  $alertError = $("<%= j render 'login_error' %>")
  $('#loginForm .alert-error').remove()
  $('#loginForm fieldset').before $alertError.fadeIn(50)
<% end %>