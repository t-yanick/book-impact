# rubocop: disable Layout/LineLength

module UsersHelper
  def follow_unfollow(user)
    links = link_to 'Unfollow', following_path, method: :delete, class: 'textdec-none form-btn unfollow-btn align-self-center'
    return links if current_user.followds.include?(user)

    cntnt = link_to 'Follow', follow_path(user), class: 'textdec-none form-btn unfollow-btn align-self-center'
    return cntnt unless current_user.followds.include?(user) || current_user == user

    nil
  end

  def user_avatar(user)
    if user.photo.attached?
      image_tag user.photo.variant(resize: '90x90!'), class: 'rounded-circle avatar'
    else
      image_tag('avatar.png', class: 'rounded-circle', height: 110, width: 110)
    end
  end

  def user_cover
    if @user.cover_image.attached?
      image_tag @user.cover_image, class: 'col-12 p-0', style: 'height: 30rem'
    else
      image_tag('cover.png', class: 'col-12 p-0', style: 'height: 12rem')
    end
  end

  def edit_avatar
    if resource.photo.attached?
      image_tag resource.photo.variant(resize: '90x90!'), class: 'rounded-circle'
    else
      image_tag('avatar.png', class: 'rounded-circle', height: 90, width: 90)
    end
  end

  def edit_cover
    if resource.cover_image.attached?
      image_tag resource.cover_image.variant(resize: '90x90!'), class: 'rounded-circle'
    else
      image_tag('cover.png', height: 90, width: 90)
    end
  end

  def current_avatar
    if current_user.photo.attached?
      image_tag current_user.photo.variant(resize: '90x90!'), class: 'rounded-circle'
    else
      image_tag('avatar.png', class: 'rounded-circle', height: 90, width: 90)
    end
  end

  def comment_settings(opinion)
    return unless user_signed_in? && current_user.id == opinion.user_id

    content_tag :div, class: 'd-flex justify-content-between'
    "#{link_to edit_opinion_path(id: opinion.id), class: 'text-dark mx-2 icon-comment' do
      fa_icon 'edit'
    end}" \
    "#{link_to opinion, method: :delete, data: { confirm: 'Are you sure you want to delete this comment?' }, class: 'text-dark mx-2 icon-comment' do
      fa_icon 'trash-alt'
    end}".html_safe
  end
end

# rubocop: enable Layout/LineLength
