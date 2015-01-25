class ChangeColumnInRetweets < ActiveRecord::Migration
  def change
    rename_column :retweets, :retweet_id, :source_tweet_id
  end
end
