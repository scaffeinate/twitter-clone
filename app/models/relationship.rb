class Relationship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, class_name: "User"
  counter_culture :user, column_name: :following_count
  counter_culture :friend, column_name: :followers_count
end
