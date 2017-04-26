module ApplicationHelper
  def full_title(page_title='')
    base_title = "Bullfrog Websites"
    if page_title.empty?
      return base_title
    else
      return page_title + " | " + base_title
    end
  end

  def show_flashes
    returns = Array.new
    flash.each do |message_type, message|
      returns.push(("<div class=\"alert alert-" + message_type + "\">" + message + "</div>"))
    end
    return returns.join.html_safe
  end

  def show_errors(errors)
    str = '<div class="alert alert-danger">'
    errors.each_with_index do |error, i|
      str += '&bull;&nbsp;'
      str += error
      unless(i == errors.length - 1)
        str += "<br>"
      end
    end
    str += '</div><br>'
    return str.html_safe
  end

  def top(color: "white")
    render(partial: 'shared/top', locals: { color: color })
  end
end
