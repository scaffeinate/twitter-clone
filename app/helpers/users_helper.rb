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

  def relative_time(created_at)
    time_ago_in_words(created_at)
  end

  def formatted_time(created_at)
    created_at.strftime("%b %d, %Y")
  end

end
