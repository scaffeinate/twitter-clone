class AddCountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :tweets_count, :integer, null: false, default: 0
    add_column :users, :followers_count, :integer, null: false, default: 0
    add_column :users, :following_count, :integer, null: false, default: 0
  end
end
