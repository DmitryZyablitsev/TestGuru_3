module SessionsHelper
  def flash_user_confirmation
    content_tag :p, flash[:alert], class: 'flash alert' if flash[:alert]
  end
end
