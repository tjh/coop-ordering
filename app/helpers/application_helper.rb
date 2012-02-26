module ApplicationHelper
  def body_id
    controller_name = controller.controller_name.underscore
    action_name     = controller.action_name.underscore
    css_id = "#{controller_name}-#{action_name}"
    css_id << "-#{params[:id]}" if params[:id]
    css_id
  end

  def membership_status(user)
    if user.is_member?
      text = 'Approved'
      color = 'green'
    else
      text = 'Pending'
      color = 'red'
    end
    content_tag(:span, text, :style => "color:#{color};")
  end

  def red_green(condition, green_text, red_text)
    if condition
      text = green_text
      color = 'green'
    else
      text = red_text
      color = 'red'
    end
    content_tag(:span, text, :style => "color:#{color};")
  end
end
