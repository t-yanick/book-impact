module ApplicationHelper
  def flash_message
    if flash[:notice]
      content_tag :p, notice, :class => 'bg-success m-0 text-white text-center p-2'
    elsif flash[:alert]
      content_tag :p, alert, :class => 'bg-danger m-0 text-white text-center p-2'
    end
  end

  def signed_in?
    if user_signed_in?
      ("#{link_to current_user.name, user_path(current_user), class: 'button is-info'}" <<
       "#{link_to 'Logout', destroy_user_session_path, method: :delete, class: 'button is-info'}").html_safe
    else
      ("#{link_to 'Sing In', new_user_session_path, class: 'button is-info'}" <<
       "#{link_to 'Sing Up', new_user_registration_path, class: 'button is-info'}").html_safe
    end
  end
end

