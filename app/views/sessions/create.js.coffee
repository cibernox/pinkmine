<% if @user %>
  window.location = "<%= root_url %>"
<% else %>
  $alertError = $("<%= j render 'login_error' %>")
  $('#login_form .alert-error').remove()
  $('#login_form fieldset').before $alertError.fadeIn(50)
<% end %>