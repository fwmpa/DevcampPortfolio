module ApplicationHelper
  # def sample_helper     #As a ruby code, .html_safe must be added in order to <p> to be processed
  #   "<p> My Helper <p>".html_safe
  # end

  def login_helper
    if current_user.is_a?(User)
      button_to "Logout", destroy_user_session_path, method: :delete
    else
      (link_to "Register", new_user_registration_path) +
      "<br>".html_safe +
      (link_to "Login", new_user_session_path)
    end
  end
end
