# -*- encoding : utf-8 -*-
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

  def default_text_for_bootstrap_alert(level)
    text = case level.to_s
    when 'notice' then nil
    when 'error' then '<strong>Oh oh!</strong> Parece que hay algún dato erróneo'
    when 'alert' then nil
    when 'success' then '<strong>Listo!</strong> Se han actualizado los datos'
    else nil
    end
    return nil unless text
    text.html_safe
  end

  # Renderiza un alert estilado para bootstrap, con boton de cerrar.
  def bootstrap_alert(text = nil, level = nil)
    text ||= default_text_for_bootstrap_alert(level)
    content_tag :div, class: "alert fade in #{flash_class(level)}" do
      button_tag('×', class: 'close', 'data-dismiss' => "alert") + content_tag(:div, text, class: 'text-center')
    end
  end

  # Renderiza los flashes (:notice, :error, :success ...) con estilo de alerts de bootstrap
  def bootstrap_flashes
    [:notice, :error, :alert, :success].map do |level|
      bootstrap_alert(flash[level], level) unless flash[level].blank?
    end.join.html_safe
  end

  # Dado un tipo de mensaje flash, devuelve la clase del alert de bootstrap correspondiente
  def flash_class(level)
    case level.to_s
    when 'notice' then "alert-info"
    when 'error' then "alert-error"
    when 'alert' then "alert-warning"
    when 'success' then "alert-success"
    end
  end

end
