module SessionsHelper
  def flash_user_confirmation(type)
    content_tag :p, flash[type], class: 'flash alert' if flash[type]
  end
end
