module ApplicationHelper
    
  #   - if user_signed_in? 
  #     = link_to "User: #{current_user ? current_user.email: ""}", user_session_path
  #     \-
  #     = link_to 'Log Out', destroy_user_session_path, method: :delete, class: 'pure-menu-link'
  #   - else
  #       = link_to 'Log In', new_user_session_path, class: 'pure-menu-link'
  #       \-
  #       = link_to 'Sign up', new_user_registration_path, class: 'pure-menu-link'
  # end
  
  
  def self.logged_in_email(user)
    "User: #{user ? user.email: ""}"
  end
  
  def login_url_helper
  end
end
