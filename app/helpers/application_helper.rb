module ApplicationHelper
  def user_avatar(user)
    # TODO: each user avatar
    asset_pack_path('media/images/user.png')
  end

  def bi_icon(icon_class)
    content_tag 'span', '', class: "bi bi-#{icon_class}"
  end
end
