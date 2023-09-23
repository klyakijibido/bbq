module ApplicationHelper

  # Возвращает путь к авке данного юзера
  def user_avatar(user)
    if user.avatar.attached?
      user.avatar
    else
      asset_pack_path('media/images/user.png')
    end
  end

  def user_avatar_thumb(user)
    if user.avatar.attached?
      # user.avatar.variant(:thumb)
      user.avatar.variant(resize: "100x100")
    else
      asset_pack_path('media/images/user.png')
    end
  end

  def event_photo(event)
    photos = event.photos.persisted

    if photos.any?
      photos.sample.photo.url
    else
      asset_path('event.jpg')
    end
  end

  def event_thumb(event)
    photos = event.photos.persisted

    if photos.any?
      photos.sample.photo.thumb.url
    else
      asset_path('event_thumb.jpg')
    end
  end

  def bi_icon(icon_class)
    content_tag 'span', '', class: "bi bi-#{icon_class}"
  end
end
