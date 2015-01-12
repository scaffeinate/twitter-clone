module UsersHelper
  def user_cover(user)
    if user.cover.url
      "background-image: url(#{ user.cover.url})"
    else
      "background: #ccc"
    end
  end

  def following?(user)
    !current_user.friends.find_by_id(user).nil?
  end

  def follows_you?(user)
    !user.friends.find_by_id(current_user).nil?
  end

end
