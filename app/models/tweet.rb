class Tweet < ActiveRecord::Base

  self.per_page = 20

  belongs_to :user
  belongs_to :parent, class_name: "Tweet"
  has_many :replies, class_name: "Tweet", foreign_key: "parent_id"
  has_many :favorites
  validates :tweet_text, presence: true, length: { maximum: 140 }
end
