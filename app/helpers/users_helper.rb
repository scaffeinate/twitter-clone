module UsersHelper
  def user_cover(user)
    if user.cover.url
      "background-image: url(#{ user.cover.url})"
    else
      "background: #ccc"
    end
  end

  def following?(user)
    !current_user.relationships.find_by_friend_id(user.id).nil?
  end

end
