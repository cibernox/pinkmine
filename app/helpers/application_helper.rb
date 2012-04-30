module ApplicationHelper

  # Sobreescribo link_to para que acepte opciones útiles.
  #
  # icon: Genera un enlace con icono al estilo de twitter-bootstrap
  #       Ejemplo:
  #           link_to 'Mi cuenta', '#', icon: 'user' # => <a href="#"><i class="icon-user"></i>Mi cuenta</a>
  #
  def link_to(body, url, html_options = {})
    if (icon_class = html_options.delete(:icon))
      body = content_tag(:i, '', class: "icon-#{icon_class}") + body
    end
    super body, url, html_options
  end

end
