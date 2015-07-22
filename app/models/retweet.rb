class Retweet < ActiveRecord::Base
  belongs_to :retweeter, class_name: "User"
  belongs_to :source_tweet, class_name: "Tweet"

  validates_presence_of :retweeter

end
