module ApplicationHelper

  def logged_in_email(user)
    "User: #{user ? user.email : "Unknown"}"
  end

end
