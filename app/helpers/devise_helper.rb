module DeviseHelper

  def devise_error_messages!
    return '' if resource.errors.empty?

    show_errors(resource.errors)
  end

end
