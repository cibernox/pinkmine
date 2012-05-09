# -*- encoding : utf-8 -*-
module ApplicationHelper

  # Override link_to so it can accept some useful options
  #
  # icon: Generates a link with a bootstrap-style icon
  #       Example:
  #           link_to 'Profile', '#', icon: 'user' # => <a href="#"><i class="icon-user"></i>Profile</a>
  #
  def link_to(body, url, html_options = {})
    if (icon_class = html_options.delete(:icon))
      body = content_tag(:i, '', class: "icon-#{icon_class}") + body
    end
    super body, url, html_options
  end


  # Gives a good default text for display on alert messages
  def default_text_for_bootstrap_alert(level)
    text = case level.to_sym
    when :notice then nil
    when :error then '<strong>Oh oh!</strong> Parece que hay algún dato erróneo'
    when :alert then nil
    when :success then '<strong>Listo!</strong> Se han actualizado los datos'
    else nil
    end
    return nil unless text
    text.html_safe
  end

  # Renders a bootstrap-styled alert with close button and fade in effect.
  def bootstrap_alert(text = nil, level = nil)
    text ||= default_text_for_bootstrap_alert(level)
    content_tag :div, class: "alert fade in #{flash_class(level)}" do
      button_tag('×', class: 'close', data: { dismiss: "alert" }) + content_tag(:div, text, class: 'text-center')
    end
  end

  # Renders the flashes (:notice, :error, :success ...) on the bootstrap way.
  def bootstrap_flashes
    [:notice, :error, :alert, :success].map do |level|
      bootstrap_alert(flash[level], level) unless flash[level].blank?
    end.join.html_safe
  end

  # Given a message type, return the bootrtrap's class for this king of alert
  def flash_class(level)
    case level.to_sym
    when :notice then "alert-info"
    when :error then "alert-error"
    when :alert then "alert-warning"
    when :success then "alert-success"
    end
  end

  # Renders a bootstrap breadcrumbs for any number of links
  def bootstrap_breadcrumb(*links)
    content_tag :ul, class: 'breadcrumb' do
      links.each_with_index.map do |link, index|
        content_tag :li, class: ('active' if index == links.size - 1) do
          content = link
          content << (index < links.size - 1 ? content_tag(:span, '/', class: 'divider') : '')
          content.html_safe
        end
      end.join.html_safe
    end
  end

end
