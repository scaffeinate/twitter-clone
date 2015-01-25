module TweetsHelper
  def get_favorite(tweet_id)
    current_user.favorites.find_by(tweet_id: tweet_id)
  end

  def tweet_favored?(tweet_id)
    !get_favorite(tweet_id).nil?
  end

  def get_retweet(tweet_id)
    current_user.retweets.find_by(source_tweet_id: tweet_id)
  end

  def retweeted?(tweet_id)
    !get_retweet(tweet_id).nil?
  end

  def can_retweet?(tweet_id)
    Tweet.find(tweet_id).user != current_user
  end

end
