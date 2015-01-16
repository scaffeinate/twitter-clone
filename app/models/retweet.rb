class Retweet < ActiveRecord::Base
  belongs_to :retweeter, class_name: "User"
  belongs_to :retweet, class_name: "Tweet"
end
