module ApplicationHelper

  def full_title(page_title='')
    base_title = "Bullfrog Websites"
    if page_title.empty?
      return base_title
    else
      return page_title + " | " + base_title
    end
  end

  def description_tag(description='')
    unless description.empty?
      return ('<meta name="description" content="' + description + '">').html_safe
    end
  end

  def show_flashes
    html = Array.new
    flash.each do |message_type, message|
      html.push(("<div class=\"alert alert-" + message_type + "\">" + message + "</div>"))
    end
    render 'shared/notices'
    render html: html.join.html_safe
  end

  def flash_section
    render 'shared/flash_section' if !flash.empty?
  end

  def flash_header
    render 'shared/flash_header' if !flash.empty?
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
    render html: str.html_safe
  end

  def top(color: "white")
    render(partial: 'shared/top', locals: { color: color })
  end

  def normal_page(&block)
    render 'shared/normal_page', &block
  end

  def mailer_page(&block)
    render 'shared/mailer_page',&block
  end

end
