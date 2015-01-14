module TweetsHelper
  def get_favorite(tweet_id)
    current_user.favorites.find_by(tweet_id: tweet_id)
  end

  def tweet_favored?(tweet_id)
    !get_favorite(tweet_id).nil?
  end
end
