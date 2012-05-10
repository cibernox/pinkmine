# -*- encoding : utf-8 -*-
module IssuesHelper

  # Returns a class to style with twitter bootstrap the color of a progress bar
  # Colors changes this way: red (low), orange(medium), green(high) and blue(complete)
  def issue_progress_bar_class(issue)
    color = case issue.percentage
    when 0..33 then 'progress-danger'
    when 34..66 then 'progress-warning'
    when 67..99 then 'progress-success'
    else 'progress-info'
    end
    striped = 'progress-striped active' if issue.in_progress?
    "#{striped} #{color}".strip
  end

  # Generates a progress bar based on the percentage of the given issue
  def issue_progress_bar(issue)
    content_tag :div, class: "progress #{issue_progress_bar_class issue}", style: "min-width: 150px" do
      content_tag :div, "#{issue.percentage}%", class: 'bar', style: "width: #{issue.percentage}%"
    end
  end

  # Generates a label to ilustrate the priority of an issue, with a color code:
  # grey(low), blue(normal), yellow(high), red(urgent), black(immediate)
  def issue_priority_label(issue)
    color_class = case issue.priority.to_sym
    when :low       then ''
    when :normal    then 'label-info'
    when :high      then 'label-warning'
    when :urgent    then 'label-danger'
    when :immediate then 'label-inverse'
    end
    content_tag(:span, issue.priority, class: "label #{color_class}")
  end

  # Generates a dropdown button for select the status of the given issue
  def issue_status_dropdown(issue)
    link_content = issue.status + content_tag(:span, nil, class: 'caret')
    content_tag :div, class: 'btn-group' do
      link_to(link_content.html_safe, '#', class: 'btn btn-small dropdown-toggle', data: { toggle: "dropdown"} ) +
      content_tag(:ul, class: 'dropdown-menu') do
        Issue::VALID_STATUS.map do |status|
          link_to status, '#', class: ('active' if status == issue.status), data: { status: status }
        end.join.html_safe
      end
    end
  end

end
