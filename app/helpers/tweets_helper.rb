module TweetsHelper
  def is_last_page?(tweets)
    tweets.total_pages == tweets.current_page
  end
end
