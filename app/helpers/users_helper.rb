module UsersHelper
  def user_cover(user)
    if user.cover.url
      "background-image: url(#{ user.cover.url})"
    else
      "background: #ccc"
    end
  end
end
