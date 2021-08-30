module DeviseHelper
  def bootstrap_alert(key)
    case key
    when 'alert'
      'warning'
    when 'notice'
      'success'
    when 'error'
      'danger'
    end
  end

  def devise_error_messages!
    return '' if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-danger"> <button type="button"
    class="close" data-dismiss="alert">x</button>
      #{messages}
    </div>
    HTML

    html.html_safe
  end
end
