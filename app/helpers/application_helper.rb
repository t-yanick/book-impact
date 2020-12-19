module ApplicationHelper
  def flash_message
    if flash[:notice]
      content_tag :p, notice, class: 'bg-success m-0 text-white text-center p-2'
    elsif flash[:alert]
      content_tag :p, alert, class: 'bg-danger m-0 text-white text-center p-2'
    end
  end

  def signed_in?
    if user_signed_in?
      "#{link_to 'New Book Review', new_opinion_path, class: 'btn btn-light my-2 my-sm-0 logs'}" \
        "#{link_to 'Edit Profile', edit_user_registration_path, class: 'btn text-light m-2 logs'}" \
       "#{link_to 'Logout', destroy_user_session_path, method: :delete, class: 'btn text-light m-2 logs'}".html_safe
    else
      "#{link_to 'Sign In', new_user_session_path, class: 'btn text-light m-2 logs'}" \
       "#{link_to 'Sing Up', new_user_registration_path, class: 'btn text-light m-2 logs'}".html_safe
    end
  end

  def like_or_dislike_btn(opinion)
    like = Like.find_by(opinion: opinion, user: current_user)
    if like
      link_to opinion_like_path(id: like.id, opinion_id: opinion.id), method: :delete, class: 'like-button' do
        fa_icon 'thumbs-down'
      end
    else
      link_to opinion_likes_path(opinion_id: opinion.id), method: :post, class: 'like-button' do
        fa_icon 'thumbs-up'
      end
    end
  end
end
