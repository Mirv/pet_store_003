module ApplicationHelper

  def logged_in_email(user)
    "#{user ? user.email : "Unknown"}"
  end

end
