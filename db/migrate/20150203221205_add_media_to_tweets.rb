class AddMediaToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :media, :string
  end
end
