class Tweet < ActiveRecord::Base

  self.per_page = 20

  belongs_to :user
  validates :tweet_text, presence: true, length: { maximum: 140 }
end
